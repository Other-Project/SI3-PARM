using System.Diagnostics;

namespace Assembler;

public record AssemblyFile(FileInfo AssemblyFileInfo)
{
    public void WriteToFile()
    {
        using var outputFileStream = File.OpenWrite(Path.ChangeExtension(AssemblyFileInfo.FullName, "bin"));
        using var outputStream = new StreamWriter(outputFileStream);
        ConvertToLogicimBinary(outputStream);
    }

    public void ConvertToLogicimBinary(TextWriter outputStream, bool comments = true)
    {
        using var inputStream = AssemblyFileInfo.OpenText();
        outputStream.WriteLine("v2.0 raw");
        if (comments)
        {
            outputStream.WriteLine($"# Automatically generated from {AssemblyFileInfo.Name}");
            outputStream.WriteLine($"# Program made by Evan GALLI, Alban FALCOZ and Theo LAUSSAUNIERE (2023-2024)\n");
        }
        while (inputStream.ReadLine() is { } line)
        {
            if (line.Length == 0) continue;

            Debug.WriteLine("Processing {0}", line);
            if (line[0] == '@')
            {
                Debug.WriteLine("Comment detected: {0}", line);
                if (comments) outputStream.WriteLine($"# {line[1..]}");
                continue;
            }

            var result = -1;
            foreach (var instruction in Instruction.Instructions)
            {
                result = instruction.Process(line);
                if (result >= 0) break;
            }
            if (result < 0) throw new NotSupportedException("Couldn't parse line: " + line);

            Debug.WriteLine("Generated: {0:B16} -> {0:X4}", result);
            if (comments) outputStream.WriteLine($"\n# {line}\n{result:x4}");
            else outputStream.Write($"{result:x4} ");
        }
        outputStream.WriteLine();
    }
}
