using System;
using JetBrains.Annotations;
using Xunit;

namespace Assembler.Tests;

[TestSubject(typeof(Argument))]
public class ArgumentValueTest
{
    [Fact]
    public void RxRangeTest()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => new Rx("Rm", 3).SetValue("-1", 0, null!));
        Assert.Throws<ArgumentOutOfRangeException>(() => new Rx("Rm", 3).SetValue("8", 0, null!));
        Assert.Null(Record.Exception(() => new Rx("Rm", 3).SetValue("0", 0, null!)));
        Assert.Null(Record.Exception(() => new Rx("Rm", 3).SetValue("7", 0, null!)));
    }

    [Fact]
    public void ImmRangeTest()
    {
        Assert.Throws<ArgumentOutOfRangeException>(() => new Imm(5).SetValue("-17", 0, null!));
        Assert.Throws<ArgumentOutOfRangeException>(() => new Imm(5).SetValue("32", 0, null!));
        Assert.Null(Record.Exception(() => new Imm(5).SetValue("0", 0, null!)));
        Assert.Null(Record.Exception(() => new Imm(5).SetValue("31", 0, null!)));
        Assert.Null(Record.Exception(() => new Imm(5).SetValue("-16", 0, null!)));
        Assert.Null(Record.Exception(() => new Imm(5).SetValue("15", 0, null!)));
    }
}
