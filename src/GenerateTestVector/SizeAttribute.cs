namespace GenerateTestVector;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Parameter)]
public class SizeAttribute(int size) : Attribute
{
    public int Size { get; } = size;
}
