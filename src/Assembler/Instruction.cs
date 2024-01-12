using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;
using Serilog;

namespace Assembler;

public record Instruction(string RegexPattern, int BinaryPrefix, params Argument[] BinaryArgs)
{
    [SuppressMessage("ReSharper", "StringLiteralTypo"),
     SuppressMessage("ReSharper", "ReturnTypeCanBeEnumerable.Global")]
    public static Instruction[] Instructions { get; } =
    {
        // Shift, add, sub, mov
        new("LSLS r{Rd}, r{Rm}, #{imm}", 0b00_000, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("LSRS r{Rd}, r{Rm}, #{imm}", 0b00_001, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("ASRS r{Rd}, r{Rm}, #{imm}", 0b00_010, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("ADDS r{Rd}, r{Rn}, r{Rm}", 0b00_011_00, Argument.Rm, Argument.Rn, Argument.Rd),
        new("SUBS r{Rd}, r{Rn}, r{Rm}", 0b00_011_01, Argument.Rm, Argument.Rn, Argument.Rd),
        new("ADDS r{Rd}, r{Rn}, #{imm}", 0b00_011_10, Argument.Imm3, Argument.Rn, Argument.Rd),
        new("SUBS r{Rd}, r{Rn}, #{imm}", 0b00_011_11, Argument.Imm3, Argument.Rn, Argument.Rd),
        new("MOVS r{Rd}, #{imm}", 0b00_100, Argument.Rd, Argument.Imm8),
        new("CMP r{Rd}, #{imm}", 0b00_101, Argument.Rd, Argument.Imm8),
        new("ADDS r{Rdn}, #{imm}", 0b00_110, Argument.Rdn, Argument.Imm8),
        new("SUBS r{Rdn}, #{imm}", 0b00_111, Argument.Rdn, Argument.Imm8),

        // Data processing
        new("ANDS r{Rdn}, r{Rm}", 0b010000_0000, Argument.Rm, Argument.Rdn),
        new("EORS r{Rdn}, r{Rm}", 0b010000_0001, Argument.Rm, Argument.Rdn),
        new("LSLS r{Rdn}, r{Rm}", 0b010000_0010, Argument.Rm, Argument.Rdn),
        new("LSRS r{Rdn}, r{Rm}", 0b010000_0011, Argument.Rm, Argument.Rdn),
        new("ASRS r{Rdn}, r{Rm}", 0b010000_0100, Argument.Rm, Argument.Rdn),
        new("ADCS r{Rdn}, r{Rm}", 0b010000_0101, Argument.Rm, Argument.Rdn),
        new("SBCS r{Rdn}, r{Rm}", 0b010000_0110, Argument.Rm, Argument.Rdn),
        new("RORS r{Rdn}, r{Rm}", 0b010000_0111, Argument.Rm, Argument.Rdn),
        new("TST r{Rn}, r{Rm}", 0b010000_1000, Argument.Rm, Argument.Rn),
        new("RSBS r{Rd}, r{Rn}", 0b010000_1001, Argument.Rn, Argument.Rd),
        new("CMP r{Rn}, r{Rm}", 0b010000_1010, Argument.Rm, Argument.Rn),
        new("CMN r{Rn}, r{Rm}", 0b010000_1011, Argument.Rm, Argument.Rn),
        new("ORRS r{Rdn}, r{Rm}", 0b010000_1100, Argument.Rm, Argument.Rdn),
        new("MULS r{Rdm}, r{Rn}, r{Rdm}", 0b010000_1101, Argument.Rn, Argument.Rdm),
        new("BICS r{Rdn}, r{Rm}", 0b010000_1110, Argument.Rm, Argument.Rdn),
        new("MVNS r{Rd}, r{Rm}", 0b010000_1111, Argument.Rm, Argument.Rd),

        // Load/Store
        new("STR r{Rt}, \\[SP(, #{imm})?]", 0b1001_0, Argument.Rt, Argument.Imm8Shift2),
        new("LDR r{Rt}, \\[SP(, #{imm})?]", 0b1001_1, Argument.Rt, Argument.Imm8Shift2),

        // Miscellaneous 16-bit instructions
        new("ADD SP(, SP)?, #{imm}", 0b1011_00000, Argument.Imm7Shift2),
        new("SUB SP(, SP)?, #{imm}", 0b1011_00001, Argument.Imm7Shift2),

        // Branch
        new("BEQ \\.{label}", 0b1101_0000, Argument.Label8),
        new("BNE \\.{label}", 0b1101_0001, Argument.Label8),
        new("BCS \\.{label}", 0b1101_0010, Argument.Label8),
        new("BCC \\.{label}", 0b1101_0011, Argument.Label8),
        new("BMI \\.{label}", 0b1101_0100, Argument.Label8),
        new("BPL \\.{label}", 0b1101_0101, Argument.Label8),
        new("BVS \\.{label}", 0b1101_0110, Argument.Label8),
        new("BVC \\.{label}", 0b1101_0111, Argument.Label8),
        new("BHI \\.{label}", 0b1101_1000, Argument.Label8),
        new("BLS \\.{label}", 0b1101_1001, Argument.Label8),
        new("BGE \\.{label}", 0b1101_1010, Argument.Label8),
        new("BLT \\.{label}", 0b1101_1011, Argument.Label8),
        new("BGT \\.{label}", 0b1101_1100, Argument.Label8),
        new("BLE \\.{label}", 0b1101_1101, Argument.Label8),
        new("BAL \\.{label}", 0b1110_0, Argument.Label11), // See note p206 of the ARM manual (section A7.7.12)
        new("B \\.{label}", 0b1110_0, Argument.Label11)
    };

    private string RegexPattern { get; } = Argument.Arguments
        .Aggregate(RegexPattern, (current, argument) => argument.GetRegex(current)).Replace(" ", " ?");

    private int BinaryPrefix { get; } = BinaryPrefix;

    [SuppressMessage("ReSharper", "ReturnTypeCanBeEnumerable.Local")]
    private Argument[] BinaryArgs { get; } = BinaryArgs;

    public int Process(string line, int lineNumber, AssemblyFile assemblyFile)
    {
        var regex = Regex.Match(line, RegexPattern, RegexOptions.IgnoreCase);
        if (!regex.Success) return -1;
        var args = regex.Groups;
        Log.Verbose("{0} instruction detected, parsed {1}", RegexPattern,
            string.Join(", ", args.Values.Select(arg => arg.Name + ":\"" + arg.Value + "\"")));
        var shift = 0;
        var binary = 0;
        foreach (var arg in BinaryArgs.Reverse())
        {
            var argValue = 0;
            if (args[arg.Arg].Success)
            {
                var argValueStr = args[arg.Arg].Value;
                if (arg.Arg == "label")
                {
                    argValue = assemblyFile.Labels[argValueStr] - lineNumber - 4;
                    Log.Verbose("{0} label found at {1}, difference {2}", argValueStr,
                        assemblyFile.Labels[argValueStr], argValue);
                }
                else if (!int.TryParse(argValueStr, out argValue)) return -1;

                argValue = arg.GetValue(argValue);
                if (argValue < 0) argValue += 1 << arg.Size; // Complement to 2 on the right number of bits
            }

            binary |= argValue << shift;
            shift += arg.Size;
        }

        return binary + (BinaryPrefix << shift);
    }
}