using System.Diagnostics.CodeAnalysis;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "InconsistentNaming")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
public class SpAddress(ushort instruction, bool enable, uint stackPointer)
{
    // Inputs
    [Size(16)] public ushort Instruction { get; } = instruction;
    [Size(1)] public bool Enable { get; } = enable;
    [Size(32)] public uint Stack_Pointer { get; } = stackPointer;

    // Outputs
    [Size(1)] public bool Write_Enable => Enable;
    [Size(32)] public uint? New_Stack_Pointer => Enable ? Operation switch
    {
        Operations.ADD => Stack_Pointer + Offset,
        Operations.SUB => Stack_Pointer - Offset,
        _ => null
    } : 0;

    public Operations Operation => (Operations)((Instruction >> 7) & 0b1111_1);
    public uint Offset => (uint)(Instruction & 0b111_1111);

    public static IEnumerable<SpAddress> GetAllCombinations()
    {
        return from Operations operation in Enum.GetValues(typeof(Operations))
            from enable in Conditional.BooleanValues
            from offset in Conditional.ImmTestValues
            from sp in Conditional.ImmTestValues
            select new SpAddress((ushort)((0b1011 << 12) + ((ushort)operation << 7) + (offset & 0b111_1111)), enable, (uint)sp);
    }

    public enum Operations
    {
        ADD = 0b0000_0,
        SUB = 0b0000_1
    }
}
