codeunit 60053 "Text Helper"
{
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

    procedure FuzzyMatchSimilarity(Word1: Text; Word2: Text) Similarity: Decimal
    var
        Math: Codeunit Math;
        CommonChars: Integer;
        MaxLength: Integer;
    begin
        // Calculate the maximum possible length (for normalization)
        MaxLength := Math.Max(StrLen(Word1), StrLen(Word2));
        if MaxLength = 0 then
            exit(0);

        // Calculate number of common characters with position importance
        CommonChars := CountCommonCharactersWithOrder(Word1, Word2);

        // Calculate similarity ratio
        Similarity := ((CommonChars / MaxLength) / 2) * 100;
    end;

    procedure IsAlphabetic(InText: Text): Boolean
    begin
        exit(Letters().Contains(InText));
    end;

    procedure IsNumeric(InText: Text): Boolean
    begin
        exit(Numbers().Contains(InText));
    end;

    local procedure CountCommonCharacters(Word1: Text; Word2: Text) Count: Integer
    var
        i, j : Integer;
        TempWord2: Text;
        Char1, Char2 : Text[1];
    begin
        Count := 0;
        TempWord2 := Word2; // Use a temporary version of Word2 to modify during matching

        for i := 1 to StrLen(Word1) do begin
            Char1 := CopyStr(Word1, i, 1);

            for j := 1 to StrLen(TempWord2) do begin
                Char2 := CopyStr(TempWord2, j, 1);

                if Char1 = Char2 then begin
                    Count += 1;

                    // Remove matched character from TempWord2 by rebuilding it without that character
                    TempWord2 := CopyStr(TempWord2, 1, j - 1) + CopyStr(TempWord2, j + 1);
                    break;
                end;
            end;
        end;
    end;

    local procedure CountCommonCharactersWithOrder(Word1: Text; Word2: Text) MatchCount: Integer
    var
        CharIndex1, CharIndex2, FoundIndex : Integer;
    begin
        MatchCount := 0;
        CharIndex1 := 1;
        CharIndex2 := 1;

        // Loop through each character in Word1
        while CharIndex1 <= StrLen(Word1) do begin
            // Check if we are within bounds for Word2
            if CharIndex2 <= StrLen(Word2) then
                // Exact character match in the same position
                if Word1[CharIndex1] = Word2[CharIndex2] then begin
                    MatchCount += 2; // Reward for exact position match
                    CharIndex2 += 1; // Move to the next character in Word2
                end else begin
                    // Look for the current character of Word1 elsewhere in Word2
                    FoundIndex := StrPos(Word1[CharIndex1], CopyStr(Word2, CharIndex2 + 1, StrLen(Word2)));
                    if FoundIndex > 0 then begin
                        MatchCount += 1; // Penalized reward for out-of-order match
                        CharIndex2 := CharIndex2 + FoundIndex; // Move CharIndex2 to the matched character
                    end;
                end;
            CharIndex1 += 1;
        end;
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