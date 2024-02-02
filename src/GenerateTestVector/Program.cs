using System.Collections;
using System.Reflection;
using GenerateTestVector;

Type[] components = [typeof(Alu), typeof(Conditional), typeof(OpcodeDecoder), typeof(SpAddress), typeof(DataProcessing), typeof(ShiftAddSubMove)];

foreach (var component in components)
{
    Console.WriteLine(component.Name);
    using var file = File.CreateText($"./{component.Name}.txt");

    var properties = component.GetProperties()
        .Where(prop => prop.IsDefined(typeof(SizeAttribute)))
        .Select(prop => (info: prop, size: ((SizeAttribute)prop.GetCustomAttributes(typeof(SizeAttribute), false)[0]).Size)).ToArray();

    file.WriteLine(string.Concat(properties.Select(prop => new string(' ', Math.Max(prop.size - $"{prop.info.Name}[{prop.size}]".Length + 1, 1)) + $"{prop.info.Name}[{prop.size}]")));

    foreach (var testVector in (IEnumerable)component.GetMethod("GetAllCombinations")?.Invoke(null, null)!)
    {
        foreach (var property in properties)
        {
            file.Write(new string(' ', Math.Max($"{property.info.Name}[{property.size}]".Length + 1 - property.size, 1)));
            file.Write(property.info.GetValue(testVector) switch
                {
                    bool bit => bit.ToBinaryChar(),
                    bool[] bits => bits.ToBinaryString(property.size),
                    ushort word => word.ToBinaryString(property.size),
                    uint word => word.ToBinaryString(property.size),
                    Enum enumValue => Convert.ToUInt32(enumValue).ToBinaryString(property.size),
                    _ => new string('x', property.size)
                }
            );
        }
        file.WriteLine();
    }
}
Console.WriteLine("Done");
