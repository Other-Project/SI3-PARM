using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;

namespace Assembler;

public record Instruction(string RegexPattern, int BinaryPrefix, params Argument[] BinaryArgs)
{
    [SuppressMessage("ReSharper", "StringLiteralTypo"), SuppressMessage("ReSharper", "ReturnTypeCanBeEnumerable.Global")]
    public static Instruction[] Instructions { get; } =
    {
        // Shift, add, sub, mov
        new("LSLS r{Rd}, r{Rm}, #{imm5}", 0b00_000, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("LSRS r{Rd}, r{Rm}, #{imm5}", 0b00_001, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("ASRS r{Rd}, r{Rm}, #{imm5}", 0b00_010, Argument.Imm5, Argument.Rm, Argument.Rd),
        new("ADDS r{Rd}, r{Rn}, r{Rm}", 0b00_011_00, Argument.Rm, Argument.Rn, Argument.Rd),
        new("SUBS r{Rd}, r{Rn}, r{Rm}", 0b00_011_01, Argument.Rm, Argument.Rn, Argument.Rd),
        new("ADDS r{Rd}, r{Rn}, #{imm3}", 0b00_011_10, Argument.Imm3, Argument.Rn, Argument.Rd),
        new("SUBS r{Rd}, r{Rn}, #{imm3}", 0b00_011_11, Argument.Imm3, Argument.Rn, Argument.Rd),
        new("MOVS r{Rd}, #{imm8}", 0b00_100, Argument.Rd, Argument.Imm8),
        new("CMP r{Rd}, #{imm8}", 0b00_101, Argument.Rd, Argument.Imm8),
        new("ADDS r{Rdn}, #{imm8}", 0b00_110, Argument.Rdn, Argument.Imm8),
        new("SUBS r{Rdn}, #{imm8}", 0b00_111, Argument.Rdn, Argument.Imm8)
    };

    private string RegexPattern { get; } = Argument.Arguments.Aggregate(RegexPattern, (current, argument) => current.Replace($"{{{argument.Arg}}}", @$"(?<{argument.Arg}>\d+)"));
    private int BinaryPrefix { get; } = BinaryPrefix;
    [SuppressMessage("ReSharper", "ReturnTypeCanBeEnumerable.Local")] private Argument[] BinaryArgs { get; } = BinaryArgs;

    public int Process(string line)
    {
        var regex = Regex.Match(line, RegexPattern, RegexOptions.IgnoreCase);
        if (!regex.Success) return -1;
        var args = regex.Groups;
        Debug.WriteLine("{0} instruction detected, parsed {1}", RegexPattern, string.Join(", ", args.Values.Select(arg => arg.Name + ":\"" + arg.Value + "\"")));
        var shift = 0;
        var binary = 0;
        foreach (var arg in BinaryArgs.Reverse())
        {
            if (!int.TryParse(args[arg.Arg].Value, out var argValue)) return -1;
            binary |= argValue << shift;
            shift += arg.Size;
        }

        return binary + (BinaryPrefix << shift);
    }
}
