codeunit 60053 "Text Tools"
{
    // Updated
    procedure ExtractAlphabetic(InputText: Text) ResultText: Text
    var
        CharIndex: Integer;
        CurrentChar: Text[1];
    begin
        for CharIndex := 1 to StrLen(InputText) do begin
            CurrentChar := CopyStr(InputText, CharIndex, 1);

            if IsAlphabetic(CurrentChar) then
                ResultText += CurrentChar;
        end;
    end;

    procedure ExtractNumeric(InputText: Text) ResultText: Text
    var
        CharIndex: Integer;
        CurrentChar: Text[1];
    begin
        for CharIndex := 1 to StrLen(InputText) do begin
            CurrentChar := CopyStr(InputText, CharIndex, 1);

            if IsNumeric(CurrentChar) then
                ResultText += CurrentChar;
        end;
    end;

    procedure IsAlphabetic(InText: Text): Boolean
    begin
        exit(Letters().Contains(InText));
    end;

    procedure IsNumeric(InText: Text): Boolean
    begin
        exit(Numbers().Contains(InText));
    end;

    local procedure Letters() Chars: List of [Text]
    begin
        Chars.Add('A');
        Chars.Add('B');
        Chars.Add('C');
        Chars.Add('D');
        Chars.Add('E');
        Chars.Add('F');
        Chars.Add('G');
        Chars.Add('H');
        Chars.Add('I');
        Chars.Add('J');
        Chars.Add('K');
        Chars.Add('L');
        Chars.Add('M');
        Chars.Add('N');
        Chars.Add('O');
        Chars.Add('P');
        Chars.Add('Q');
        Chars.Add('R');
        Chars.Add('S');
        Chars.Add('T');
        Chars.Add('U');
        Chars.Add('V');
        Chars.Add('W');
        Chars.Add('X');
        Chars.Add('Y');
        Chars.Add('Z');
        Chars.Add('a');
        Chars.Add('b');
        Chars.Add('c');
        Chars.Add('d');
        Chars.Add('e');
        Chars.Add('f');
        Chars.Add('g');
        Chars.Add('h');
        Chars.Add('i');
        Chars.Add('j');
        Chars.Add('k');
        Chars.Add('l');
        Chars.Add('m');
        Chars.Add('n');
        Chars.Add('o');
        Chars.Add('p');
        Chars.Add('q');
        Chars.Add('r');
        Chars.Add('s');
        Chars.Add('t');
        Chars.Add('u');
        Chars.Add('v');
        Chars.Add('w');
        Chars.Add('x');
        Chars.Add('y');
        Chars.Add('z');
    end;

    local procedure Numbers() Chars: List of [Text]
    begin
        Chars.Add('0');
        Chars.Add('1');
        Chars.Add('2');
        Chars.Add('3');
        Chars.Add('4');
        Chars.Add('5');
        Chars.Add('6');
        Chars.Add('7');
        Chars.Add('8');
        Chars.Add('9');
    end;
}