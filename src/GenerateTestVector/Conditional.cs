using System.Diagnostics.CodeAnalysis;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "MemberCanBePrivate.Global")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
public class Conditional(bool enable, ushort instruction, bool n, bool z, bool c, bool v)
{
    private readonly bool unconditional = instruction >> 11 == 0b11100;

    // Inputs
    [Size(1)] public bool Enable { get; } = enable;
    [Size(16)] public ushort Instruction { get; } = instruction;
    [Size(1)] public bool N { get; } = n;
    [Size(1)] public bool Z { get; } = z;
    [Size(1)] public bool C { get; } = c;
    [Size(1)] public bool V { get; } = v;

    // Outputs
    [Size(11)] public IEnumerable<bool>? Offset => Enable ? Verified ? GetImm(Instruction, unconditional).ExpendTo(unconditional ? 11 : 8, 11) : null : new bool[11];

    [Size(1)] public bool Verified => Enable && Condition switch
    {
        Conditions.EQ => Z,
        Conditions.NE => !Z,
        Conditions.CS => C,
        Conditions.CC => !C,
        Conditions.MI => N,
        Conditions.PL => !N,
        Conditions.VS => V,
        Conditions.VC => !V,
        Conditions.HI => C && !Z,
        Conditions.LS => !C || Z,
        Conditions.GE => N == V,
        Conditions.LT => N != V,
        Conditions.GT => !Z && N == V,
        Conditions.LE => Z || N != V,
        Conditions.AL => true,
        _ => false
    };

    public Conditions Condition => unconditional ? Conditions.AL : (Conditions)((Instruction >> 8) & 0xf);

    private static int GetImm(int instruction, bool unconditional) => instruction & (unconditional ? 0x7FF : 0x00FF);


    private static readonly bool[] BooleanValues = [false, true];
    private static readonly int[] ImmTestValues = [0x0000, 0x1111, 0xAAAA, 0xCCCC, 0xffff];

    public static IEnumerable<Conditional> GetAllCombinations()
    {
        return from unconditional in BooleanValues
            from Conditions condition in unconditional ? new[] { Conditions.AL } : Enum.GetValues(typeof(Conditions))
            from enable in BooleanValues
            from offset in ImmTestValues
            from negative in BooleanValues
            from zero in BooleanValues
            from carry in BooleanValues
            from overflow in BooleanValues
            select new Conditional(enable, (ushort)((unconditional ? 0xE000 : 0xD000 + ((ushort)condition << 8)) + GetImm(offset, unconditional)), negative, zero, carry, overflow);
    }

    [SuppressMessage("ReSharper", "InconsistentNaming")]
    public enum Conditions
    {
        EQ = 0b0000,
        NE = 0b0001,
        CS = 0b0010,
        CC = 0b0011,
        MI = 0b0100,
        PL = 0b0101,
        VS = 0b0110,
        VC = 0b0111,
        HI = 0b1000,
        LS = 0b1001,
        GE = 0b1010,
        LT = 0b1011,
        GT = 0b1100,
        LE = 0b1101,
        AL = 0b1110
    }
}
