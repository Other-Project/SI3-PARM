namespace Assembler;

public record Argument(string Arg, int Size)
{
    public static Argument Rd { get; } = new("Rd", 3);
    public static Argument Rm { get; } = new("Rm", 3);
    public static Argument Rn { get; } = new("Rn", 3);
    public static Argument Rdm { get; } = new("Rdm", 3);
    public static Argument Rdn { get; } = new("Rdn", 3);
    public static Argument Rt { get; } = new("Rt", 3);
    public static Argument Imm3 { get; } = new("imm3", 3);
    public static Argument Imm5 { get; } = new("imm5", 5);
    public static Argument Imm7 { get; } = new("imm7", 7);
    public static Argument Imm8 { get; } = new("imm8", 8);

    public static Argument[] Arguments { get; } = { Rd, Rm, Rn, Rdm, Rdn, Rt, Imm3, Imm5, Imm7, Imm8 };
}
