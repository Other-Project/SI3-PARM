using System.Diagnostics.CodeAnalysis;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "InconsistentNaming")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
[SuppressMessage("ReSharper", "MemberCanBePrivate.Global")]
public class DataProcessing(ushort instruction, bool enable)
{
    // Inputs
    [Size(16)] public ushort Instruction { get; } = instruction;
    [Size(1)] public bool Enable { get; } = enable;

    // Outputs
    [Size(4)] public bool[] ALU_Opcode => Enable ? ((int)Operation).ToBinary(4) : new bool[4];
    [Size(3)] public bool[]? Rm => Enable ? Operation switch
    {
        Operations.RSB => null,
        Operations.MUL => Rd,
        _ => ((Instruction >> 3) & 0b111).ToBinary(3)
    } : new bool[3];
    [Size(3)] public bool[]? Rn => Enable ? Operation switch
    {
        Operations.TST or Operations.CMP or Operations.CMN => (Instruction & 0b111).ToBinary(3),
        Operations.RSB or Operations.MUL => ((Instruction >> 3) & 0b111).ToBinary(3),
        Operations.MVN => null,
        _ => Rd
    } : new bool[3];
    [Size(3)] public bool[]? Rd => Enable ? Operation is Operations.TST or Operations.CMP or Operations.CMN ? null : (Instruction & 0b111).ToBinary(3) : new bool[3];
    [Size(4)] public Flags Flags_Update_Mask => Enable ? Flags.Negative | Flags.Zero | Operation switch
    {
        Operations.MUL => Flags.None,
        Operations.ADC or Operations.SBC or Operations.RSB or Operations.CMP or Operations.CMN => Flags.Carry | Flags.Overflow,
        _ => Flags.Carry
    } : Flags.None;

    public Operations Operation => (Operations)((Instruction >> 6) & 0xf);

    public static IEnumerable<DataProcessing> GetAllCombinations()
    {
        return from Operations operation in Enum.GetValues(typeof(Operations))
            from enable in Conditional.BooleanValues
            from rx1 in Enumerable.Range(0, 7)
            from rx2 in Enumerable.Range(0, 7)
            select new DataProcessing((ushort)((0b01_0000 << 10) + ((ushort)operation << 6) + (rx1 << 3) + rx2), enable);
    }

    public enum Operations
    {
        AND = 0x0,
        EOR = 0x1,
        LSL = 0x2,
        LSR = 0x3,
        ASR = 0x4,
        ADC = 0x5,
        SBC = 0x6,
        ROR = 0x7,
        TST = 0x8,
        RSB = 0x9,
        CMP = 0xA,
        CMN = 0xB,
        ORR = 0xC,
        MUL = 0xD,
        BIC = 0xE,
        MVN = 0xF,
    }
}
