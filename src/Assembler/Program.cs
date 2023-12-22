using Assembler;

foreach (var input in new DirectoryInfo("shift_add_sub_mov").EnumerateFiles("*.s", SearchOption.AllDirectories))
{
    Console.WriteLine("Processing file {0}", input.FullName);

    try { new AssemblyFile(input).WriteToFile(); }
    catch (Exception e) { Console.WriteLine("Error: {0}", e); }
}
