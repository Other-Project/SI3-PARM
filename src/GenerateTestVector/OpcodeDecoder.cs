using System.Diagnostics.CodeAnalysis;

namespace GenerateTestVector;

[SuppressMessage("ReSharper", "InconsistentNaming")]
[SuppressMessage("ReSharper", "UnusedMember.Global")]
public class OpcodeDecoder(byte opcode)
{
    // Inputs
    [Size(6)] public ushort Opcode { get; } = opcode;

    // Outputs
    [Size(1)] public bool Shift => Opcode >> 4 == 0b00;
    [Size(1)] public bool Data_Processing => Opcode == 0b010000;
    [Size(1)] public bool? Load_Store => Opcode >> 3 == 0b011 || Opcode >> 3 == 0b100 ? null : Opcode >> 2 == 0b1001; // The two other opcode aren't supported by P-ARM
    [Size(1)] public bool SP_Address => Opcode >> 2 == 0b1011;
    [Size(1)] public bool Conditional => Opcode >> 2 == 0b1101 || Opcode >> 1 == 0b11100;


    public static IEnumerable<OpcodeDecoder> GetAllCombinations()
    {
        for (byte code = 0; code >> 6 == 0; code++)
            yield return new OpcodeDecoder(code);
    }
}
