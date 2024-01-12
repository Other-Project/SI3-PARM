using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using JetBrains.Annotations;
using Xunit;
using Xunit.Abstractions;

namespace Assembler.Tests;

[TestSubject(typeof(AssemblyFile))]
public class AssemblyFileTest(ITestOutputHelper outputHelper)
{
    private sealed class DataList : IEnumerable<object[]>
    {
        public IEnumerator<object[]> GetEnumerator() =>
            new DirectoryInfo(".")
                .EnumerateFiles("*.s", SearchOption.AllDirectories)
                .Select(assemblyCode => new object[] { new TestData(assemblyCode, Path.ChangeExtension(assemblyCode.FullName, "bin")) }).GetEnumerator();
        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
    }
    public record TestData(FileInfo Input, string ExpectedOutputFile)
    {
        public override string ToString() => Input.Directory?.Name + "/" + Input.Name;
    }

    [Theory, ClassData(typeof(DataList))]
    public void FileConversion(TestData data)
    {
        var output = new StringBuilder();
        using var outputWriter = new StringWriter(output);
        new AssemblyFile(data.Input).ConvertToLogicimBinary(outputWriter, false);
        outputHelper.WriteLine(output.ToString());
        Assert.Equal(File.ReadAllText(data.ExpectedOutputFile).Replace("\r\n", "\n"), output.ToString().Replace("\r\n", "\n"));
    }
}
