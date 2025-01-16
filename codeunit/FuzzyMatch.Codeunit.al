codeunit 60002 "Fuzzy Match"
{
    procedure FuzzyMatchReturnRatio(Word1: Text; Word2: Text): Decimal
    var
        Math: Codeunit Math;
        SimilarityRatio: Decimal;
        CommonChars: Integer;
        MaxLength: Integer;
    begin
        // Calculate the maximum possible length (for normalization)
        MaxLength := Math.Max(StrLen(Word1), StrLen(Word2));
        if MaxLength = 0 then
            exit(0);

        // Calculate number of common characters with position importance
        CommonChars := CalculateCommonCharactersWithOrder(Word1, Word2);

        // Calculate similarity ratio
        SimilarityRatio := ((CommonChars / MaxLength) / 2) * 100;

        // Check if similarity ratio is above the threshold
        exit(SimilarityRatio);
    end;

    local procedure CalculateCommonCharacters(Word1: Text; Word2: Text): Integer
    var
        Count: Integer;
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

        exit(Count);
    end;

    // Local function to calculate common characters with order consideration
    // Local function to calculate common characters with order consideration
    local procedure CalculateCommonCharactersWithOrder(Word1: Text; Word2: Text): Integer
    var
        CharIndex1, CharIndex2, FoundIndex : Integer;
        MatchCount: Integer;
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
        exit(MatchCount);
    end;
}