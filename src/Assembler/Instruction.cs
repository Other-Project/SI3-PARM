using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;
using Serilog;

namespace Assembler;

public record Instruction(string RegexPattern, int BinaryPrefix, params Argument[] BinaryArgs)
{
    /// <summary>All supported instructions</summary>
    /// <remarks>For more information refer to Arm v7-M manual, section A5.2 16-bit Thumb instruction encoding</remarks>
    // ReSharper disable CommentTypo
    // ReSharper disable StringLiteralTypo
    public static IEnumerable<Instruction> Instructions { get; } =
    [
        // A5.2.1 - 00xxxx - Shift (immediate), add, subtract, move, and compare
        new Instruction("LSLS r{Rd}, r{Rm}, #{imm}", 0b00_000, Argument.Imm5, Argument.Rm, Argument.Rd),
        new Instruction("LSRS r{Rd}, r{Rm}, #{imm}", 0b00_001, Argument.Imm5, Argument.Rm, Argument.Rd),
        new Instruction("ASRS r{Rd}, r{Rm}, #{imm}", 0b00_010, Argument.Imm5, Argument.Rm, Argument.Rd),
        new Instruction("ADDS r{Rd}, r{Rn}, r{Rm}", 0b00_011_00, Argument.Rm, Argument.Rn, Argument.Rd),
        new Instruction("SUBS r{Rd}, r{Rn}, r{Rm}", 0b00_011_01, Argument.Rm, Argument.Rn, Argument.Rd),
        new Instruction("ADDS r{Rd}, r{Rn}, #{imm}", 0b00_011_10, Argument.Imm3, Argument.Rn, Argument.Rd),
        new Instruction("SUBS r{Rd}, r{Rn}, #{imm}", 0b00_011_11, Argument.Imm3, Argument.Rn, Argument.Rd),
        new Instruction("MOVS r{Rd}, #{imm}", 0b00_100, Argument.Rd, Argument.Imm8),
        new Instruction("CMP r{Rd}, #{imm}", 0b00_101, Argument.Rd, Argument.Imm8),
        new Instruction("ADDS r{Rdn}, #{imm}", 0b00_110, Argument.Rdn, Argument.Imm8),
        new Instruction("SUBS r{Rdn}, #{imm}", 0b00_111, Argument.Rdn, Argument.Imm8),

        // A5.2.2 - 010000 - Data processing
        new Instruction("ANDS r{Rdn}, r{Rm}", 0b010000_0000, Argument.Rm, Argument.Rdn),
        new Instruction("EORS r{Rdn}, r{Rm}", 0b010000_0001, Argument.Rm, Argument.Rdn),
        new Instruction("LSLS r{Rdn}, r{Rm}", 0b010000_0010, Argument.Rm, Argument.Rdn),
        new Instruction("LSRS r{Rdn}, r{Rm}", 0b010000_0011, Argument.Rm, Argument.Rdn),
        new Instruction("ASRS r{Rdn}, r{Rm}", 0b010000_0100, Argument.Rm, Argument.Rdn),
        new Instruction("ADCS r{Rdn}, r{Rm}", 0b010000_0101, Argument.Rm, Argument.Rdn),
        new Instruction("SBCS r{Rdn}, r{Rm}", 0b010000_0110, Argument.Rm, Argument.Rdn),
        new Instruction("RORS r{Rdn}, r{Rm}", 0b010000_0111, Argument.Rm, Argument.Rdn),
        new Instruction("TST r{Rn}, r{Rm}", 0b010000_1000, Argument.Rm, Argument.Rn),
        new Instruction("RSBS r{Rd}, r{Rn}", 0b010000_1001, Argument.Rn, Argument.Rd),
        new Instruction("CMP r{Rn}, r{Rm}", 0b010000_1010, Argument.Rm, Argument.Rn),
        new Instruction("CMN r{Rn}, r{Rm}", 0b010000_1011, Argument.Rm, Argument.Rn),
        new Instruction("ORRS r{Rdn}, r{Rm}", 0b010000_1100, Argument.Rm, Argument.Rdn),
        new Instruction("MULS r{Rdm}, r{Rn}, r{Rdm}", 0b010000_1101, Argument.Rn, Argument.Rdm),
        new Instruction("BICS r{Rdn}, r{Rm}", 0b010000_1110, Argument.Rm, Argument.Rdn),
        new Instruction("MVNS r{Rd}, r{Rm}", 0b010000_1111, Argument.Rm, Argument.Rd),

        // A5.2.3 - 010001 - Special data instructions and branch and exchange
        new Instruction("MOVS r{Rd}, r{Rm}", 0b00_000, Argument.Imm5, Argument.Rm, Argument.Rd), // LSLS <Rd>,<Rm>,#<imm5> with imm5=0

        // A5.2.4 - 100xxx - Load/store single data item
        new Instruction("STR r{Rt}, \\[r{Rn}, r{Rm}]", 0b0101_000, Argument.Rm, Argument.Rn, Argument.Rt),
        new Instruction("LDR r{Rt}, \\[r{Rn}, r{Rm}]", 0b0101_100, Argument.Rm, Argument.Rn, Argument.Rt),
        new Instruction("STR r{Rt}, \\[SP(?:, #{imm})?]", 0b1001_0, Argument.Rt, Argument.Imm8Shift2),
        new Instruction("LDR r{Rt}, \\[SP(?:, #{imm})?]", 0b1001_1, Argument.Rt, Argument.Imm8Shift2),

        // A7.7.5 - 10101x - Generate SP-relative address
        new Instruction("ADD r{Rd}, SP, #{imm}", 0b1010_1, Argument.Rd, Argument.Imm8Shift2),

        // A5.2.5 - 1011xx - Miscellaneous 16-bit instructions
        new Instruction("ADD SP(?:, SP)?, #{imm}", 0b1011_00000, Argument.Imm7Shift2),
        new Instruction("SUB SP(?:, SP)?, #{imm}", 0b1011_00001, Argument.Imm7Shift2),

        // A5.2.6 - 1101xx - Conditional branch, and Supervisor Call
        new Instruction("BEQ \\.{label}", 0b1101_0000, Argument.Label8),
        new Instruction("BNE \\.{label}", 0b1101_0001, Argument.Label8),
        new Instruction("B(?:CS|HS) \\.{label}", 0b1101_0010, Argument.Label8),
        new Instruction("B(?:CC|LO) \\.{label}", 0b1101_0011, Argument.Label8),
        new Instruction("BMI \\.{label}", 0b1101_0100, Argument.Label8),
        new Instruction("BPL \\.{label}", 0b1101_0101, Argument.Label8),
        new Instruction("BVS \\.{label}", 0b1101_0110, Argument.Label8),
        new Instruction("BVC \\.{label}", 0b1101_0111, Argument.Label8),
        new Instruction("BHI \\.{label}", 0b1101_1000, Argument.Label8),
        new Instruction("BLS \\.{label}", 0b1101_1001, Argument.Label8),
        new Instruction("BGE \\.{label}", 0b1101_1010, Argument.Label8),
        new Instruction("BLT \\.{label}", 0b1101_1011, Argument.Label8),
        new Instruction("BGT \\.{label}", 0b1101_1100, Argument.Label8),
        new Instruction("BLE \\.{label}", 0b1101_1101, Argument.Label8),
        new Instruction("BAL \\.{label}", 0b1110_0, Argument.Label11), // See note p206 of the ARM manual (section A7.7.12)

        // A7.7.12 - 11100x - Unconditional Branch (B)
        new Instruction("B \\.{label}", 0b1110_0, Argument.Label11)
    ];
    // ReSharper restore StringLiteralTypo
    // ReSharper restore CommentTypo

    private string RegexPattern { get; } = Argument.Arguments
        .Aggregate(RegexPattern, (pseudoRegex, argument) => pseudoRegex.Replace($"{{{argument.Name}}}", argument.Regex)).Replace(" ", " ?");

    private int BinaryPrefix { get; } = BinaryPrefix;

    [SuppressMessage("ReSharper", "ReturnTypeCanBeEnumerable.Local")]
    private Argument[] BinaryArgs { get; } = BinaryArgs;

    public int Process(string line, int programCounter, AssemblyFile assemblyFile)
    {
        var regex = Regex.Match(line, RegexPattern, RegexOptions.IgnoreCase);
        if (!regex.Success) return -1;
        var args = regex.Groups;
        Log.Verbose("{Instruction} instruction detected (PC #{PC}), parsed {Arguments}", RegexPattern, programCounter,
            string.Join(", ", args.Values.Select(arg => arg.Name + ":\"" + arg.Value + "\"")));

        var shift = 0;
        var binary = 0;
        foreach (var arg in BinaryArgs.Reverse())
        {
            arg.SetValue(args[arg.Name].Value, programCounter, assemblyFile);
            binary |= arg.BinaryValue << shift;
            shift += arg.Size;
        }
        binary += BinaryPrefix << shift;

        Log.Debug("{PC:D5}\t{InstructionCode:x4} ({InstructionCodeBin:b16})\t{AssemblyLine}\t\t{Arguments}",
            programCounter, binary, binary, line, string.Join(", ", BinaryArgs.Select(arg => arg.ToString())));
        return binary;
    }
}
