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
            outputStream.WriteLine($"# Program made by Evan GALLI, Alban FALCOZ and Theo LAUSSAUNIERE (2023-2024)\n");
        }

        var lineNumber = 1;
        while (inputStream.ReadLine() is { } line)
        {
            line = line.Trim().Replace('\t', ' ');
            if (line.Length == 0) continue;

            Log.Verbose("Processing {0} at {1}", line, lineNumber);
            switch (line[0])
            {
                case '#':
                case '@':
                {
                    Log.Verbose("Comment detected '{0}' at {1}", line, lineNumber);
                    if (comments) outputStream.WriteLine($"# {line[1..]}");
                    continue;
                }
                case '.':
                {
                    if (line[^1] != ':') continue; // TODO: Symbols are ignored
                    var label = line.Substring(1, line.Length - 2);
                    if (comments) outputStream.WriteLine($"\n# GOTO LABEL '{label}'");
                    continue;
                }
            }
            if (line[^1] == ':') // Procedure
            {
                Log.Verbose("Procedure detected '{0}' at {1}", line, lineNumber);
                continue; // TODO
            }

            var result = -1;
            foreach (var instruction in Instruction.Instructions)
            {
                result = instruction.Process(line, lineNumber, this);
                if (result >= 0) break;
            }
            if (result < 0) throw new NotSupportedException("Couldn't parse line: " + line);

            Log.Verbose("Generated: {0:B16} -> {0:X4}", result);
            if (comments) outputStream.WriteLine($"\n# {line}\n{result:x4}");
            else outputStream.Write($"{result:x4} ");
            Log.Debug("{0}\t{1}\t{2}", lineNumber, $"{result:x4}", line);
            lineNumber++;
        }
        outputStream.WriteLine();
    }

    private void ReadAllLabels(StreamReader inputStream)
    {
        var lineNumber = 1;
        while (inputStream.ReadLine() is { } line)
        {
            line = line.Trim();
            if (line.Length == 0) continue;
            switch (line[0])
            {
                case '@':
                {
                    continue;
                }
                case '.':
                {
                    if (line[^1] != ':') continue;
                    var label = line.Substring(1, line.Length - 2);
                    Log.Verbose("Label '{0}' detected at {1}", label, lineNumber);
                    Labels.Add(label, lineNumber);
                    continue;
                }
            }
            lineNumber++;
        }
        inputStream.BaseStream.Seek(0, SeekOrigin.Begin);
    }
}
