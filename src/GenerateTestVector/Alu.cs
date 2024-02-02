using System.Diagnostics.CodeAnalysis;
using System.Numerics;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "InconsistentNaming")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
[SuppressMessage("ReSharper", "MemberCanBePrivate.Global")]
public class Alu(uint a, uint b, ushort shift, bool carryIn, ushort codeOp)
{
    // Inputs
    [Size(32)] public uint A { get; } = a;
    [Size(32)] public uint B { get; } = b;
    [Size(5)] public ushort Shift { get; } = shift;
    [Size(1)] public bool CarryIn { get; } = carryIn;
    [Size(4)] public ushort Codop { get; } = codeOp;

    // Outputs
    [Size(32)] public uint S => Operation is Operations.TST or Operations.CMP or Operations.CMN ? B : Result;
    [Size(4)] public Flags Flags
    {
        get
        {
            var flags = Flags.None;
            if (Result >> 31 == 1) flags |= Flags.Negative;
            if (Result == 0) flags |= Flags.Zero;
            if ((Operation switch
                {
                    Operations.LSL => B >> ((0 - Shift) & 0b11111),
                    Operations.LSR or Operations.ASR => B >> ((Shift - 1) & 0b11111),
                    Operations.ROR => Result >> 31,
                    Operations.ADC => ((long)A + B + CarryIn.FromBinary()) >> 32,
                    Operations.CMN => ((long)A + B) >> 32,
                    Operations.SBC => ((long)~A + B + CarryIn.FromBinary()) >> 32,
                    Operations.CMP => ((long)~A + 1 + B) >> 32,
                    Operations.RSB => ((long)~A + 1) >> 32,
                    _ => 0
                } & 1) == 1) flags |= Flags.Carry;
            if (Operation switch
                {
                    Operations.ADC or Operations.CMN => A >> 31 == B >> 31 && B >> 31 != Result >> 31,
                    Operations.SBC or Operations.CMP => A >> 31 != B >> 31 && B >> 31 != Result >> 31,
                    _ => false
                }) flags |= Flags.Overflow;
            return flags;
        }
    }

    private uint Result => Operation switch
    {
        Operations.AND or Operations.TST => A & B,
        Operations.EOR => A ^ B,
        Operations.LSL => B << Shift,
        Operations.LSR => B >>> Shift,
        Operations.ASR => (uint)((int)B >> Shift),
        Operations.ADC => A + B + CarryIn.FromBinary(),
        Operations.SBC => B - A + CarryIn.FromBinary() - 1,
        Operations.ROR => BitOperations.RotateRight(B, Shift),
        Operations.RSB => ~A + 1, // Complément à deux
        Operations.CMP => B - A,
        Operations.CMN => A + B,
        Operations.ORR => A | B,
        Operations.MUL => A * B,
        Operations.BIC => B & ~A,
        Operations.MVN => ~A,
        _ => B
    };
    public Operations Operation => (Operations)Codop;

    public static IEnumerable<Alu> GetAllCombinations()
    {
        return from Operations operation in Enum.GetValues<Operations>()
            from carry in Conditional.BooleanValues
            from a in Conditional.ImmTestValues
            from b in Conditional.ImmTestValues
            from shift in Conditional.ImmTestValues
            select new Alu(a, b, (ushort)(shift & 0b11111), carry, (ushort)operation);
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
