using Assembler;

foreach (var input in new DirectoryInfo(".").EnumerateFiles("*.s", SearchOption.AllDirectories))
{
    Console.WriteLine("Processing file {0}", input.FullName);

    try { new AssemblyFile(input).WriteToFile(); }
    catch (Exception e) { Console.WriteLine("Error: {0}", e); }
}
