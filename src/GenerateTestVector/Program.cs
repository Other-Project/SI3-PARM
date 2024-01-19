﻿using System.Collections;
using System.Reflection;
using GenerateTestVector;

Type[] components = [typeof(Conditional), typeof(OpcodeDecoder), typeof(SpAddress)];

foreach (var component in components)
{
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
                    bool[] bits => bits.ToBinaryString(),
                    ushort word => word.ToBinaryString(property.size),
                    uint word => word.ToBinaryString(property.size),
                    _ => new string('x', property.size)
                }
            );
        }
        file.WriteLine();
    }
}
