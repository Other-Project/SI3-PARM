namespace GenerateTestVector;

public static class BinaryNumber
{
    public static bool[] ExpendTo(this int source, int currentLength, int targetLength) => ExpendTo((long)source, currentLength, targetLength);
    public static bool[] ExpendTo(this long source, int currentLength, int targetLength)
    {
        var raw = source.ToBinary(currentLength);
        var value = raw.SkipLast(1).Select((a, i) => a.FromBinary() * (1 << i)).Sum() - raw[^1].FromBinary() * (1 << (raw.Length - 1));
        return ToBinary(value + (1 << targetLength), targetLength);
    }
    public static uint FromBinary(this bool source) => source ? 1u : 0u;
    public static bool[] ToBinary(this int source, int length) => ToBinary((long)source, length);
    private static bool[] ToBinary(this long source, int length)
    {
        var result = new bool[length];
        for (var i = 0; i < length; i++) result[i] = (source & (1 << i)) != 0;
        return result;
    }

    public static char ToBinaryChar(this bool source) => source ? '1' : '0';
    public static string ToBinaryString(this bool[] source, int length) => new string('0', length - source.Length) + ToBinaryString(source);
    public static string ToBinaryString(this IEnumerable<bool> source) => string.Concat(source.Reverse().Select(bit => bit.ToBinaryChar()));
    public static string ToBinaryString(this ushort source, int length) => ToBinary(source, length).ToBinaryString();
    public static string ToBinaryString(this uint source, int length) => ToBinary(source, length).ToBinaryString();
}
