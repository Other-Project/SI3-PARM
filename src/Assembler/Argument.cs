using Serilog;

namespace Assembler;

public enum Sign { Signed, Unknown, Unsigned }
public abstract record Argument(string Name, string Regex, int Size, Sign ValueSign)
{
    public static Argument Rd { get; } = new Rx("Rd", 3);
    public static Argument Rm { get; } = new Rx("Rm", 3);
    public static Argument Rn { get; } = new Rx("Rn", 3);
    public static Argument Rdm { get; } = new Rx("Rdm", 3);
    public static Argument Rdn { get; } = new Rx("Rdn", 3);
    public static Argument Rt { get; } = new Rx("Rt", 3);
    public static Argument Imm3 { get; } = new Imm(3);
    public static Argument Imm5 { get; } = new Imm(5);
    public static Argument Imm5Shift2 { get; } = new Imm(5) { GetValue = val => val >> 2 };
    public static Argument Imm7Shift2 { get; } = new Imm(7) { GetValue = val => val >> 2 };
    public static Argument Imm8 { get; } = new Imm(8);
    public static Argument Imm8Shift2 { get; } = new Imm(8) { GetValue = val => val >> 2 };
    public static Argument Label8 { get; } = new Label(8);
    public static Argument Label11 { get; } = new Label(11);

    public static IEnumerable<Argument> Arguments { get; } = [Rd, Rm, Rn, Rdm, Rdn, Rt, Imm3, Label8];
    private Func<int, int> GetValue { get; init; } = val => val;


    protected int? ProgramCounter { get; private set; }
    protected AssemblyFile? AssemblyFile { get; private set; }
    protected string? StringValue { get; private set; }
    private int DecimalValue { get; set; }
    public int BinaryValue => ValueSign == Sign.Unsigned || DecimalValue >= 0 ? DecimalValue : DecimalValue + (1 << Size); // Complement to 2 on the right number of bits

    private int MinValue => ValueSign switch
    {
        Sign.Signed => -(1 << (Size - 1)), // -2^(n-1)
        Sign.Unknown => DecimalValue < 0 ? -(1 << (Size - 1)) : 0, // -2^(n-1) if signed else 0
        _ => 0
    };
    private int MaxValue => ValueSign switch
    {
        Sign.Signed => (1 << (Size - 1)) - 1, // (2^(n-1))-1
        Sign.Unknown => DecimalValue < 0 ? (1 << (Size - 1)) - 1 : (1 << Size) - 1, // (2^(n-1))-1 if signed else (2^n)-1
        _ => (1 << Size) - 1 // (2^n)-1
    };

    public void SetValue(string? strValue, int programCounter, AssemblyFile assemblyFile)
    {
        StringValue = string.IsNullOrWhiteSpace(strValue) ? null : strValue;
        ProgramCounter = programCounter;
        AssemblyFile = assemblyFile;
        DecimalValue = Parse();
        if (DecimalValue < MinValue || DecimalValue > MaxValue)
            throw new ArgumentOutOfRangeException(nameof(strValue), DecimalValue, $"Value is out of authorized range ({MinValue} - {MaxValue})");
        Log.Verbose("{ArgName} : Parsed {DecimalValue} ({BinaryValue}) from {StringValue}", Name, DecimalValue, BinaryValue.ToString($"b{Size}"), StringValue);
    }

    protected virtual int Parse()
    {
        if (StringValue == null) return 0;
        if (int.TryParse(StringValue, out var value)) return GetValue(value);
        throw new FormatException("Invalid argument value " + StringValue);
    }

    public override string ToString() => $"{Name} (\"{StringValue}\") = {BinaryValue.ToString($"b{Size}")} ({DecimalValue})";
}
