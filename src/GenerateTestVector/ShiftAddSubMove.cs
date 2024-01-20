using System.Diagnostics.CodeAnalysis;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "InconsistentNaming")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
[SuppressMessage("ReSharper", "MemberCanBePrivate.Global")]
public class ShiftAddSubMove(ushort instruction, bool enable)
{
    // Inputs
    [Size(16)] public ushort Instruction { get; } = instruction;
    [Size(1)] public bool Enable { get; } = enable;

    // Outputs
    [Size(4)] public DataProcessing.Operations ALU_Opcode => Enable ? Operation switch
    {
        Operations.LSLi => DataProcessing.Operations.LSL,
        Operations.LSRi => DataProcessing.Operations.LSR,
        Operations.ASRi => DataProcessing.Operations.ASR,
        Operations.ADDr => DataProcessing.Operations.ADC,
        Operations.SUBr => DataProcessing.Operations.SBC,
        Operations.ADDi3 => DataProcessing.Operations.ADC,
        Operations.SUBi3 => DataProcessing.Operations.SBC,
        Operations.MOVi => DataProcessing.Operations.RSB,
        Operations.CMPi => DataProcessing.Operations.CMP,
        Operations.ADDi8 => DataProcessing.Operations.ADC,
        Operations.SUBi8 => DataProcessing.Operations.SBC,
        _ => 0
    } : 0;
    [Size(3)] public bool[]? Rm => Enable ? Operation switch
    {
        Operations.LSLi or Operations.LSRi or Operations.ASRi => ((Instruction >> 3) & 0b111).ToBinary(3),
        Operations.ADDr or Operations.SUBr => ((Instruction >> 6) & 0b111).ToBinary(3),
        _ => null
    } : new bool[3];
    [Size(3)] public bool[]? Rn => Enable ? Operation switch
    {
        Operations.ADDi3 or Operations.SUBi3 or Operations.ADDr or Operations.SUBr => ((Instruction >> 3) & 0b111).ToBinary(3),
        _ => null
    } : new bool[3];
    [Size(3)] public bool[] Rd => Enable ? (Instruction >> Operation switch
    {
        Operations.MOVi or Operations.CMPi or Operations.ADDi8 or Operations.SUBi8 => 8,
        _ => 0
    } & 0b111).ToBinary(3) : new bool[3];
    [Size(4)] public Flags Flags_Update_Mask => Enable ? Flags.Negative | Flags.Zero | Operation switch
    {
        Operations.MOVi => Flags.None,
        Operations.LSLi or Operations.LSRi or Operations.ASRi => Flags.Carry,
        _ => Flags.Carry | Flags.Overflow
    } : Flags.None;

    [Size(1)] public bool Carry => Enable && Operation is Operations.SUBi3 or Operations.SUBi8 or Operations.SUBr;
    [Size(1)] public bool Imm32_Enable => Enable && Operation is Operations.MOVi or Operations.CMPi or Operations.ADDi8 or Operations.SUBi8 or Operations.ADDi3 or Operations.SUBi3;
    [Size(5)] public bool[]? Imm5 => Enable ? Operation is Operations.LSLi or Operations.LSRi or Operations.ASRi ? ((Instruction >> 6) & 0b11111).ToBinary(5) : null : new bool[5];
    [Size(32)] public bool[]? Imm32 => Enable ? Operation switch
    {
        Operations.MOVi => (-(Instruction & 0xff)).ToBinary(32),
        Operations.CMPi or Operations.ADDi8 or Operations.SUBi8 => (Instruction & 0xff).ToBinary(32),
        Operations.ADDi3 or Operations.SUBi3 => ((Instruction >> 6) & 0b111).ToBinary(32),
        _ => null
    } : new bool[32];

    public Operations Operation
    {
        get
        {
            var op = (Operations)((Instruction >> 9) & 0b11100);
            if (op == Operations.ADDr) return (Operations)((Instruction >> 9) & 0b11111);
            return op;
        }
    }

    public static IEnumerable<ShiftAddSubMove> GetAllCombinations()
    {
        foreach (Operations operation in Enum.GetValues(typeof(Operations)))
        foreach (var enabled in Conditional.BooleanValues)
            for (var rd = 0; rd < 8; rd++)
            {
                var inst = (ushort)operation << 9;
                if (operation is Operations.MOVi or Operations.CMPi or Operations.ADDi8 or Operations.SUBi8)
                    for (var imm = 0; imm < 256; imm++)
                        yield return new ShiftAddSubMove((ushort)(inst + (rd << 8) + imm), enabled);
                else
                    for (var rx = 0; rx < 8; rx++)
                        for (var imm = 0; imm < (operation is Operations.LSLi or Operations.LSRi or Operations.ASRi ? 32 : 8); imm++)
                            yield return new ShiftAddSubMove((ushort)(inst + (imm << 6) + (rx << 3) + rd), enabled);
            }
    }

    public enum Operations
    {
        LSLi = 0b000_00,
        LSRi = 0b001_00,
        ASRi = 0b010_00,
        ADDr = 0b011_00,
        SUBr = 0b011_01,
        ADDi3 = 0b011_10,
        SUBi3 = 0b011_11,
        MOVi = 0b100_00,
        CMPi = 0b101_00,
        ADDi8 = 0b110_00,
        SUBi8 = 0b111_00,
    }
}
