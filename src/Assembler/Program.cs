using Assembler;

var verbose = false;
var compact = false;
var file = "*.s";

foreach (var arg in args)
{
    switch (arg)
    {
        case "-v":
        case "--verbose":
            verbose = true;
            break;
        case "-c":
        case "--compact":
            compact = true;
            break;
        default:
            if (!arg.StartsWith('-'))
            {
                file = arg;
                break;
            }
            Console.WriteLine("Assembler program made by Evan GALLI, Alban FALCOZ and Theo LASSAUNIERE (© 2023-2024)");
            Console.WriteLine("-v, --verbose:\n\tVerbose mode, logs a lot");
            Console.WriteLine("-c, --compact:\n\tGenerates compact binaries (no comments inside)");
            return;
    }
}

foreach (var input in new DirectoryInfo(".").EnumerateFiles(file, SearchOption.AllDirectories))
{
    Console.WriteLine("Processing file {0}", Path.GetRelativePath(".", input.FullName));

    try { new AssemblyFile(input).WriteToFile(!compact); }
    catch (Exception e) { Console.WriteLine("Error: {0}", e); }
}
