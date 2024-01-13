using Serilog;

namespace Assembler;

public record Label(int Size) : Argument("label", @"(?<label>\S+)", Size, Sign.Signed)
{
    protected override int Parse()
    {
        if (StringValue == null || AssemblyFile == null || ProgramCounter == null) return 0;
        var value = AssemblyFile.Labels[StringValue] - ProgramCounter.Value - 3;
        Log.Verbose("{Label} label found at PC #{Line}, offset {Offset}", StringValue, AssemblyFile.Labels[StringValue], value);
        return value;
    }
    public override string ToString() => base.ToString();
}
