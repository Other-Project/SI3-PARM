namespace Assembler;

public record Rx(string Name, int Size) : Argument(Name, @$"(?<{Name}>\d+)", Size, Sign.Unsigned)
{
    public override string ToString() => base.ToString();
}
