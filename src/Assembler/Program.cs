using Assembler;
using Serilog;
using Serilog.Core;
using Serilog.Events;

var levelSwitch = new LoggingLevelSwitch();
Log.Logger = new LoggerConfiguration()
    .MinimumLevel.ControlledBy(levelSwitch)
    .WriteTo.Console()
    .CreateLogger();

var compact = false;
string? file = null;

foreach (var arg in args)
{
    switch (arg)
    {
        case "-v":
        case "--verbose":
            levelSwitch.MinimumLevel = LogEventLevel.Verbose;
            break;
        case "-d":
        case "--debug":
            levelSwitch.MinimumLevel = LogEventLevel.Debug;
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
            Console.WriteLine("-d, --debug:\n\tDebug mode, logs some more informations");
            Console.WriteLine("-c, --compact:\n\tGenerates compact binaries (no comments inside)");
            return;
    }
}

if (string.IsNullOrWhiteSpace(file)) throw new ArgumentException("Expected a file name/expression");

foreach (var input in new DirectoryInfo(".").EnumerateFiles(file, SearchOption.AllDirectories))
{
    Log.Information("Processing file {File}", Path.GetRelativePath(".", input.FullName));

    try { new AssemblyFile(input).WriteToFile(!compact); }
    catch (Exception e) { Log.Fatal(e, "Error processing file"); }
}

Log.CloseAndFlush();
