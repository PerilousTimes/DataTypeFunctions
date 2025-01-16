codeunit 60001 "List"
{
    // Same procedures repeated for different data types

    procedure AddIfUnique(var InList: List of [Text]; NewValue: Text)
    begin
        if (not InList.Contains(NewValue)) and (StrLen(NewValue) > 0) then
            InList.Add(NewValue);
    end;

    procedure AddIfUnique(var InList: List of [Decimal]; NewValue: Decimal)
    begin
        if not InList.Contains(NewValue) then
            InList.Add(NewValue);
    end;

    // Integer AddIfUnique
    procedure AddIfUnique(var InList: List of [Integer]; NewValue: Integer)
    begin
        if not InList.Contains(NewValue) then
            InList.Add(NewValue);
    end;

    // Date AddIfUnique
    procedure AddIfUnique(var InList: List of [Date]; NewValue: Date)
    begin
        if not InList.Contains(NewValue) then
            InList.Add(NewValue);
    end;

    // Finds the intersection of two Lists of Text (values that exist in both lists)
    procedure IntersectLists(InList1: List of [Text]; InList2: List of [Text]; var OutList: List of [Text])
    var
        Value: Text;
    begin
        foreach Value in InList1 do
            if InList2.Contains(Value) then
                AddIfUnique(OutList, Value);
    end;

    // Text JoinList
    procedure JoinList(InList: List of [Text]; Delimiter: Text): Text
    var
        ExitText: Text;
        ListValue: Text;
    begin
        foreach ListValue in InList do
            if ExitText = '' then
                ExitText := ListValue
            else
                ExitText := ExitText + Delimiter + ListValue;

        exit(ExitText);
    end;

    // Decimal JoinList
    procedure JoinList(InList: List of [Decimal]; Delimiter: Text): Text
    var
        ListValue: Decimal;
        ExitText: Text;
    begin
        foreach ListValue in InList do
            if ExitText = '' then
                ExitText := Format(ListValue)
            else
                ExitText := ExitText + Delimiter + Format(ListValue);

        exit(ExitText);
    end;

    // Integer JoinList
    procedure JoinList(InList: List of [Integer]; Delimiter: Text): Text
    var
        ListValue: Integer;
        ExitText: Text;
    begin
        foreach ListValue in InList do
            if ExitText = '' then
                ExitText := Format(ListValue)
            else
                ExitText := ExitText + Delimiter + Format(ListValue);

        exit(ExitText);
    end;

    // Date JoinList
    procedure JoinList(InList: List of [Date]; Delimiter: Text): Text
    var
        ListValue: Date;
        ExitText: Text;
    begin
        foreach ListValue in InList do
            if ExitText = '' then
                ExitText := Format(ListValue)
            else
                ExitText := ExitText + Delimiter + Format(ListValue);

        exit(ExitText);
    end;

    // Text JoinLists
    procedure JoinLists(var OutList: List of [Text]; var InList: List of [Text]): Boolean
    var
        ListValue: Text;
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach ListValue in InList do
            if not OutList.Contains(ListValue) then
                OutList.Add(ListValue);

        exit(true);
    end;

    // Decimal JoinLists
    procedure JoinLists(var OutList: List of [Decimal]; var InList: List of [Decimal]): Boolean
    var
        ListValue: Decimal;
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach ListValue in InList do
            if not OutList.Contains(ListValue) then
                OutList.Add(ListValue);

        exit(true);
    end;

    // Integer JoinLists
    procedure JoinLists(var OutList: List of [Integer]; var InList: List of [Integer]): Boolean
    var
        ListValue: Integer;
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach ListValue in InList do
            if not OutList.Contains(ListValue) then
                OutList.Add(ListValue);

        exit(true);
    end;

    // Date JoinLists
    procedure JoinLists(var OutList: List of [Date]; var InList: List of [Date]): Boolean
    var
        ListValue: Date;
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach ListValue in InList do
            if not OutList.Contains(ListValue) then
                OutList.Add(ListValue);

        exit(true);
    end;

    // Decimal FindMax
    procedure Max(InList: List of [Decimal]): Decimal
    var
        MaxValue: Decimal;
        Value: Decimal;
    begin
        if InList.Count() = 0 then
            exit(0); // Return 0 if list is empty

        MaxValue := InList.Get(1);
        foreach Value in InList do
            if Value > MaxValue then
                MaxValue := Value;

        exit(MaxValue);
    end;

    // Integer FindMax
    procedure Max(InList: List of [Integer]): Integer
    var
        MaxValue: Integer;
        Value: Integer;
    begin
        if InList.Count() = 0 then
            exit(0); // Return 0 if list is empty

        MaxValue := InList.Get(1);
        foreach Value in InList do
            if Value > MaxValue then
                MaxValue := Value;

        exit(MaxValue);
    end;

    // Date FindMax
    procedure Max(InList: List of [Date]): Date
    var
        MaxValue: Date;
        Value: Date;
    begin
        if InList.Count() = 0 then
            exit(0D); // Return empty date if list is empty

        MaxValue := InList.Get(1);
        foreach Value in InList do
            if Value > MaxValue then
                MaxValue := Value;

        exit(MaxValue);
    end;

    // Decimal FindMin
    procedure Min(InList: List of [Decimal]): Decimal
    var
        MinValue: Decimal;
        Value: Decimal;
    begin
        if InList.Count() = 0 then
            exit(0); // Return 0 if list is empty

        MinValue := InList.Get(1);
        foreach Value in InList do
            if Value < MinValue then
                MinValue := Value;

        exit(MinValue);
    end;

    // Integer FindMin
    procedure Min(InList: List of [Integer]): Integer
    var
        MinValue: Integer;
        Value: Integer;
    begin
        if InList.Count() = 0 then
            exit(0); // Return 0 if list is empty

        MinValue := InList.Get(1);
        foreach Value in InList do
            if Value < MinValue then
                MinValue := Value;

        exit(MinValue);
    end;

    // Date FindMin
    procedure Min(InList: List of [Date]): Date
    var
        MinValue: Date;
        Value: Date;
    begin
        if InList.Count() = 0 then
            exit(0D); // Return empty date if list is empty

        MinValue := InList.Get(1);
        foreach Value in InList do
            if Value < MinValue then
                MinValue := Value;

        exit(MinValue);
    end;

    // Text Remove Duplicates
    procedure RemoveDuplicates(var InList: List of [Text]): Boolean
    var
        UniqueList: List of [Text];
        Value: Text;
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach Value in InList do
            AddIfUnique(UniqueList, Value);

        InList := UniqueList;
        exit(true);
    end;

    // Decimal RemoveDuplicates
    procedure RemoveDuplicates(var InList: List of [Decimal]): Boolean
    var
        Value: Decimal;
        UniqueList: List of [Decimal];
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach Value in InList do
            AddIfUnique(UniqueList, Value);

        InList := UniqueList;
        exit(true);
    end;

    // Integer RemoveDuplicates
    procedure RemoveDuplicates(var InList: List of [Integer]): Boolean
    var
        Value: Integer;
        UniqueList: List of [Integer];
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach Value in InList do
            AddIfUnique(UniqueList, Value);

        InList := UniqueList;
        exit(true);
    end;

    // Date RemoveDuplicates
    procedure RemoveDuplicates(var InList: List of [Date]): Boolean
    var
        Value: Date;
        UniqueList: List of [Date];
    begin
        if InList.Count() = 0 then
            exit(false);

        foreach Value in InList do
            AddIfUnique(UniqueList, Value);

        InList := UniqueList;
        exit(true);
    end;

    // Decimal Sort
    procedure Sort(var InList: List of [Decimal]): Boolean
    var
        TempDecimal: Decimal;
        i, j : Integer;
    begin
        if InList.Count() = 0 then
            exit(false);

        for i := 1 to InList.Count() - 1 do begin
            for j := 1 to InList.Count() - 1 do begin
                if InList.Get(j) > InList.Get(j + 1) then begin
                    // Swap the values
                    TempDecimal := InList.Get(j);
                    InList.Set(j, InList.Get(j + 1));
                    InList.Set(j + 1, TempDecimal);
                end;
            end;
        end;

        exit(true);
    end;

    // Text Sort
    procedure Sort(var InList: List of [Text]): Boolean
    var
        i, j : Integer;
        TempText: Text;
    begin
        if InList.Count() = 0 then
            exit(false);

        for i := 1 to InList.Count() - 1 do begin
            for j := i + 1 to InList.Count() do begin
                if InList.Get(i) > InList.Get(j) then begin
                    TempText := InList.Get(i);
                    InList.Set(i, InList.Get(j));
                    InList.Set(j, TempText);
                end;
            end;
        end;

        exit(true);
    end;

    // Integer Sort
    procedure Sort(var InList: List of [Integer]): Boolean
    var
        i, j : Integer;
        TempValue: Integer;
    begin
        if InList.Count() = 0 then
            exit(false);

        for i := 1 to InList.Count() - 1 do begin
            for j := i + 1 to InList.Count() do begin
                if InList.Get(i) > InList.Get(j) then begin
                    TempValue := InList.Get(i);
                    InList.Set(i, InList.Get(j));
                    InList.Set(j, TempValue);
                end;
            end;
        end;

        exit(true);
    end;

    // Date Sort
    procedure Sort(var InList: List of [Date]): Boolean
    var
        TempValue: Date;
        i, j : Integer;
    begin
        if InList.Count() = 0 then
            exit(false);

        for i := 1 to InList.Count() - 1 do begin
            for j := i + 1 to InList.Count() do begin
                if InList.Get(i) > InList.Get(j) then begin
                    TempValue := InList.Get(i);
                    InList.Set(i, InList.Get(j));
                    InList.Set(j, TempValue);
                end;
            end;
        end;
        exit(true);
    end;

    // Finds the union of two Lists of Text (all unique values from both lists)
    procedure UnionLists(InList1: List of [Text]; InList2: List of [Text]; var OutList: List of [Text]): Boolean
    var
        Value: Text;
    begin
        if (InList1.Count() = 0) and (InList2.Count() = 0) then
            exit(false);

        exit((JoinLists(OutList, InList1)) and (JoinLists(OutList, InList2)));
    end;

    // Decimal UnionLists
    procedure UnionLists(InList1: List of [Decimal]; InList2: List of [Decimal]; var OutList: List of [Decimal]): Boolean
    var
        Value: Decimal;
    begin
        if (InList1.Count() = 0) and (InList2.Count() = 0) then
            exit(false);

        exit((JoinLists(OutList, InList1)) and (JoinLists(OutList, InList2)));
    end;

    // Integer UnionLists
    procedure UnionLists(InList1: List of [Integer]; InList2: List of [Integer]; var OutList: List of [Integer]): Boolean
    var
        Value: Integer;
    begin
        if (InList1.Count() = 0) and (InList2.Count() = 0) then
            exit(false);

        exit((JoinLists(OutList, InList1)) and (JoinLists(OutList, InList2)));
    end;

    // Date UnionLists
    procedure UnionLists(InList1: List of [Date]; InList2: List of [Date]; var OutList: List of [Date]): Boolean
    var
        Value: Date;
    begin
        if (InList1.Count() = 0) and (InList2.Count() = 0) then
            exit(false);

        exit((JoinLists(OutList, InList1)) and (JoinLists(OutList, InList2)));
    end;
}