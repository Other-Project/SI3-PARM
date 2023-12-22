namespace Assembler;

public class SASM
{
    const string opcodePrefix = "00";

    public string getBinary(string instruction, string[] arguments)
         => opcodePrefix + instruction switch
        {
            "LSLS" =>  "000" + concatArgs(arguments, 2,1,0),
            "LSRS" =>  "001" + concatArgs(arguments, 2,1,0),
            "ASRS" => "010" + concatArgs(arguments, 2,1,0),
            "ADDS" => "01100" + concatArgs(arguments, 2,1,0),
            "SUBS" => "01101" + concatArgs(arguments, 2,1,0),
            //todo: duplication ADDS et SUBS
        };

    public string concatArgs(string[] arguments, params int[] indexes)
    {
        string endOfResult = "";
        foreach (int index in indexes)
        {
            endOfResult += arguments[index];
        }
        return endOfResult;
    }
}