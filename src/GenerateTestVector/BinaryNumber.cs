namespace GenerateTestVector;

public static class BinaryNumber
{
    public static bool[] ExpendTo(this int source, int currentLength, int targetLength)
    {
        var raw = source.ToBinary(currentLength);
        var value = raw.SkipLast(1).Select((a, i) => a.FromBinary() * (1 << i)).Sum() - raw[^1].FromBinary() * (1 << (raw.Length - 1));
        return (value + (1 << targetLength)).ToBinary(targetLength);
    }
    private static int FromBinary(this bool source) => source ? 1 : 0;
    private static bool[] ToBinary(this int source, int length)
    {
        var result = new bool[length];
        for (var i = 0; i < length; i++) result[i] = (source & (1 << i)) != 0;
        return result;
    }

    public static char ToBinaryChar(this bool source) => source ? '1' : '0';
    public static string ToBinaryString(this IEnumerable<bool> source) => string.Concat(source.Reverse().Select(bit => bit.ToBinaryChar()));
    public static string ToBinaryString(this ushort source) => ToBinary(source, 16).ToBinaryString();
}
