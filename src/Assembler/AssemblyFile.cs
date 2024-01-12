using Serilog;

namespace Assembler;

public record AssemblyFile(FileInfo AssemblyFileInfo)
{
    public Dictionary<string, int> Labels { get; } = new();

    public void WriteToFile(bool comments = true)
    {
        using var outputStream = File.CreateText(Path.ChangeExtension(AssemblyFileInfo.FullName, "bin"));
        ConvertToLogicimBinary(outputStream, comments);
    }

    public void ConvertToLogicimBinary(TextWriter outputStream, bool comments = true)
    {
        using var inputStream = AssemblyFileInfo.OpenText();
        ReadAllLabels(inputStream);

        outputStream.WriteLine("v2.0 raw");
        if (comments)
        {
            outputStream.WriteLine($"# Automatically generated the {DateTime.Now:u} from {AssemblyFileInfo.Name}");
            outputStream.WriteLine($"# Program made by Evan GALLI, Alban FALCOZ and Theo LASSAUNIERE (2023-2024)\n");
        }

        var programCounter = 0;
        var lineCounter = 0;
        while (inputStream.ReadLine() is { } line)
        {
            lineCounter++;
            line = line.Trim().Replace('\t', ' ');
            if (line.Length == 0) continue;

            Log.Verbose("Processing {Line} at line {LineNumber}", line, lineCounter);
            switch (line[0])
            {
                case '#':
                case '@':
                {
                    Log.Verbose("Comment detected '{Line}'", line);
                    if (comments) outputStream.WriteLine($"# {line[1..]}");
                    continue;
                }
                case '.':
                {
                    if (line[^1] != ':')
                    {
                        Log.Verbose("Symbol detected '{Line}'", line);
                        continue; // TODO: Symbols are ignored
                    }
                    var label = line.Substring(1, line.Length - 2);
                    Log.Debug("{PC}\t\t\t\t{AssemblyLine}\t\t{Label}", programCounter, line, label);
                    if (comments) outputStream.WriteLine($"\n# GOTO LABEL '{label}'");
                    continue;
                }
            }
            if (line[^1] == ':') // Procedure
            {
                Log.Verbose("Procedure detected '{Line}'", line);
                continue; // TODO
            }

            var result = -1;
            foreach (var instruction in Instruction.Instructions)
            {
                result = instruction.Process(line, programCounter, this);
                if (result >= 0) break;
            }
            if (result < 0) throw new NotSupportedException("Couldn't parse line: " + line);

            Log.Verbose("Generated: {0:B16} -> {0:X4}", result);
            if (comments) outputStream.WriteLine($"\n# {line}\n{result:x4}");
            else outputStream.Write($"{result:x4} ");
            programCounter++;
        }
        outputStream.WriteLine();
    }

    private void ReadAllLabels(StreamReader inputStream)
    {
        var programCounter = 0;
        while (inputStream.ReadLine() is { } line)
        {
            line = line.Trim();
            if (line.Length == 0) continue;
            if (line[0] == '.' && line[^1] == ':')
            {
                var label = line.Substring(1, line.Length - 2);
                Log.Verbose("Label '{Label}' detected at PC #{PC}", label, programCounter);
                Labels.Add(label, programCounter);
            }
            if (!char.IsLetterOrDigit(line[0])) continue;
            if (line[^1] == ':') continue;
            programCounter++;
        }
        inputStream.BaseStream.Seek(0, SeekOrigin.Begin);
    }
}
