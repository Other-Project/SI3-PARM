using System.Diagnostics;

namespace Assembler;

public record AssemblyFile(FileInfo AssemblyFileInfo)
{
    public Dictionary<string, int> Labels { get; } = new();

    public void WriteToFile()
    {
        using var outputStream = File.CreateText(Path.ChangeExtension(AssemblyFileInfo.FullName, "bin"));
        ConvertToLogicimBinary(outputStream);
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

            Debug.WriteLine("Processing {0} at {1}", line, lineNumber);
            switch (line[0])
            {
                case '#':
                case '@':
                {
                    Debug.WriteLine("Comment detected '{0}' at {1}", line, lineNumber);
                    if (comments) outputStream.WriteLine($"# {line[1..]}");
                    continue;
                }
                case '.':
                {
                    if (line[^1] != ':') continue; // TODO: Symbols are ignored
                    var label = line.Substring(1, line.Length - 2);
                    Debug.WriteLine("Label '{0}' detected at {1}", label, lineNumber);
                    if (comments) outputStream.WriteLine($"\n# GOTO LABEL '{label}'");
                    continue;
                }
            }
            if (line[^1] == ':') // Procedure
            {
                continue; // TODO
            }

            var result = -1;
            foreach (var instruction in Instruction.Instructions)
            {
                result = instruction.Process(line, lineNumber, this);
                if (result >= 0) break;
            }
            if (result < 0) throw new NotSupportedException("Couldn't parse line: " + line);

            Debug.WriteLine("Generated: {0:B16} -> {0:X4}", result);
            if (comments) outputStream.WriteLine($"\n# {line}\n{result:x4}");
            else outputStream.Write($"{result:x4} ");
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
                    Labels.Add(label, lineNumber);
                    continue;
                }
            }
            lineNumber++;
        }
        inputStream.BaseStream.Seek(0, SeekOrigin.Begin);
    }
}
