namespace GenerateTestVector;

[Flags]
public enum Flags
{
    None = 0b0000,
    Negative = 0b1000,
    Zero = 0b0100,
    Carry = 0b0010,
    Overflow = 0b0001
}
