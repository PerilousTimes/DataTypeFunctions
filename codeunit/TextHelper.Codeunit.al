codeunit 60053 "Text Helper"
{
    procedure ExtractAlphanumeric(InputText: Text): Text
    var
        CharIndex: Integer;
        ResultText: Text;
        CurrentChar: Text[1];
    begin
        for CharIndex := 1 to StrLen(InputText) do begin
            CurrentChar := CopyStr(InputText, CharIndex, 1);

            if IsAlphanumeric(CurrentChar) then
                ResultText += CurrentChar; // Append alphanumeric character to result
        end;

        exit(ResultText);
    end;

    procedure IsAlphanumeric(InText: Text): Boolean
    var
        AlphanumericChars: List of [Text];
    begin
        AlphanumericChars.Add('0');
        AlphanumericChars.Add('1');
        AlphanumericChars.Add('2');
        AlphanumericChars.Add('3');
        AlphanumericChars.Add('4');
        AlphanumericChars.Add('5');
        AlphanumericChars.Add('6');
        AlphanumericChars.Add('7');
        AlphanumericChars.Add('8');
        AlphanumericChars.Add('9');

        exit(AlphanumericChars.Contains(InText));
    end;
}