using Serilog;

namespace Assembler;

public record Argument(string Arg, int Size)
{
    public static Argument Rd { get; } = new("Rd", 3);
    public static Argument Rm { get; } = new("Rm", 3);
    public static Argument Rn { get; } = new("Rn", 3);
    public static Argument Rdm { get; } = new("Rdm", 3);
    public static Argument Rdn { get; } = new("Rdn", 3);
    public static Argument Rt { get; } = new("Rt", 3);
    public static Argument Imm3 { get; } = new("imm", 3);
    public static Argument Imm5 { get; } = new("imm", 5);
    public static Argument Imm7Shift2 { get; } = new("imm", 7) { GetValue = val => val >> 2 };
    public static Argument Imm8 { get; } = new("imm", 8);
    public static Argument Imm8Shift2 { get; } = new("imm", 8) { GetValue = val => val >> 2 };
    public static Argument Label8 { get; } = new("label", 8) { GetRegex = pseudoRegex => pseudoRegex.Replace("{label}", @"(?<label>\S+)") };
    public static Argument Label11 { get; } = new("label", 11) { GetRegex = pseudoRegex => pseudoRegex.Replace("{label}", @"(?<label>\S+)") };

    public static IEnumerable<Argument> Arguments { get; } = [Rd, Rm, Rn, Rdm, Rdn, Rt, Imm3, Label8];

    public Func<string, string> GetRegex { get; private init; } = pseudoRegex => pseudoRegex.Replace($"{{{Arg}}}", @$"(?<{Arg}>\d+)");
    public Func<int, int> GetValue { get; private init; } = val => val;


    public int Process(string strValue, int programCounter, AssemblyFile assemblyFile)
    {
        int argValue;
        if (Arg == "label")
        {
            argValue = assemblyFile.Labels[strValue] - programCounter - 3;
            Log.Verbose("{Label} label found at PC #{Line}, offset {Offset}", strValue, assemblyFile.Labels[strValue], argValue);
        }
        else if (!int.TryParse(strValue, out argValue)) throw new ArgumentException("Invalid argument value " + strValue, nameof(strValue));

        argValue = GetValue(argValue);
        if (argValue < 0) argValue += 1 << Size; // Complement to 2 on the right number of bits

        return argValue;
    }
}
