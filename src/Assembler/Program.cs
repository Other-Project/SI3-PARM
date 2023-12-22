// See https://aka.ms/new-console-template for more information

string[] lines = File.ReadAllLines(@"data_processing\1-4_instructions.s");
foreach (string line in lines)
{
    System.Console.WriteLine(line);
    if (line.Length == 0 || line[0] == '@') continue;
    string[] lineSplit = line.Split(' ', 2);
    string instruction = lineSplit[0];
    string[] arguments = lineSplit[1].Split(',').Select(arg => arg.Trim()).ToArray();
    System.Console.WriteLine(instruction);
    foreach(var item in arguments)
    {
        Console.WriteLine(item.ToString());
    }
    
}