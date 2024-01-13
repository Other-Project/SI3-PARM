namespace Assembler;

public record Imm(int Size) : Argument("imm", @"(?<imm>\d+)", Size, Sign.Unknown)
{
    public override string ToString() => base.ToString();
}
