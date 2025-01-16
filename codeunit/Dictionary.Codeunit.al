codeunit 60050 Dictionary
{
    // HELLO WORLD, I AM UPDATED
    // Same procedures repeated for different data types
    procedure AddIfUnique(var InDict: Dictionary of [Text, Decimal]; NewKey: Text; NewValue: Decimal)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Same procedures repeated for different data types
    procedure AddIfUnique(var InDict: Dictionary of [Text, Text]; NewKey: Text; NewValue: Text)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Same procedures repeated for different data types
    procedure AddIfUnique(var InDict: Dictionary of [Integer, Decimal]; NewKey: Integer; NewValue: Decimal)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Same procedures repeated for different data types
    procedure AddIfUnique(var InDict: Dictionary of [Integer, Integer]; NewKey: Integer; NewValue: Integer)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Same procedures repeated for different data types
    procedure AddIfUnique(var InDict: Dictionary of [Decimal, Decimal]; NewKey: Decimal; NewValue: Decimal)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Text-Boolean
    procedure AddIfUnique(var InDict: Dictionary of [Text, Boolean]; NewKey: Text; NewValue: Boolean)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Integer-Text
    procedure AddIfUnique(var InDict: Dictionary of [Integer, Text]; NewKey: Integer; NewValue: Text)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Decimal-Text
    procedure AddIfUnique(var InDict: Dictionary of [Decimal, Text]; NewKey: Decimal; NewValue: Text)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Boolean-Text
    procedure AddIfUnique(var InDict: Dictionary of [Boolean, Text]; NewKey: Boolean; NewValue: Text)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Boolean-Decimal
    procedure AddIfUnique(var InDict: Dictionary of [Boolean, Decimal]; NewKey: Boolean; NewValue: Decimal)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Boolean-Integer
    procedure AddIfUnique(var InDict: Dictionary of [Boolean, Integer]; NewKey: Boolean; NewValue: Integer)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Boolean-Boolean
    procedure AddIfUnique(var InDict: Dictionary of [Boolean, Boolean]; NewKey: Boolean; NewValue: Boolean)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    // Add Text-Integer
    procedure AddIfUnique(var InDict: Dictionary of [Text, Integer]; NewKey: Text; NewValue: Integer)
    begin
        if not InDict.ContainsKey(NewKey) then
            InDict.Add(NewKey, NewValue);
    end;

    procedure SortByKeys(var InDict: Dictionary of [Text, Decimal]): Boolean
    var
        SortedDict: Dictionary of [Text, Decimal];
        i, j : Integer;
        KeyList: List of [Text];
        KeyTemp: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        // Transfer dictionary keys to KeyList
        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        // Sort KeyList alphabetically using bubble sort
        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    // Swap keys in KeyList
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        // Populate SortedDict using sorted keys
        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        // Replace original dictionary with sorted dictionary
        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Integer, Integer]
    procedure SortByKeys(var InDict: Dictionary of [Integer, Integer]): Boolean
    var
        SortedDict: Dictionary of [Integer, Integer];
        i, j : Integer;
        KeyTemp: Integer;
        KeyList: List of [Integer];
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        // Bubble sort for Integer keys
        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Integer, Text]
    procedure SortByKeys(var InDict: Dictionary of [Integer, Text]): Boolean
    var
        SortedDict: Dictionary of [Integer, Text];
        i, j : Integer;
        KeyTemp: Integer;
        KeyList: List of [Integer];
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Text, Integer]
    procedure SortByKeys(var InDict: Dictionary of [Text, Integer]): Boolean
    var
        SortedDict: Dictionary of [Text, Integer];
        i, j : Integer;
        KeyList: List of [Text];
        KeyTemp: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Text, Date]
    procedure SortByKeys(var InDict: Dictionary of [Text, Date]): Boolean
    var
        SortedDict: Dictionary of [Text, Date];
        i, j : Integer;
        KeyList: List of [Text];
        KeyTemp: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Date, Decimal]
    procedure SortByKeys(var InDict: Dictionary of [Date, Decimal]): Boolean
    var
        KeyTemp: Date;
        SortedDict: Dictionary of [Date, Decimal];
        i, j : Integer;
        KeyList: List of [Date];
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    // Sort a Dictionary of [Date, Text]
    procedure SortByKeys(var InDict: Dictionary of [Date, Text]): Boolean
    var
        KeyTemp: Date;
        SortedDict: Dictionary of [Date, Text];
        i, j : Integer;
        KeyList: List of [Date];
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyTemp in InDict.Keys do
            KeyList.Add(KeyTemp);

        for i := 1 to KeyList.Count() - 1 do
            for j := 1 to KeyList.Count() - i do
                if KeyList.Get(j) > KeyList.Get(j + 1) then begin
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;

        foreach KeyTemp in KeyList do
            SortedDict.Add(KeyTemp, InDict.Get(KeyTemp));

        InDict := SortedDict;
        exit(true);
    end;

    procedure SortByValues(var InDict: Dictionary of [Text, Decimal]): Boolean
    var
        Value: Decimal;
        ValueTemp: Decimal;
        SortedDict: Dictionary of [Text, Decimal];
        i, j : Integer;
        ValueList: List of [Decimal];
        KeyList: List of [Text];
        KeyTemp: Text;
        KeyVal: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        // Transfer dictionary items to KeyList and ValueList
        foreach KeyVal in InDict.Keys do begin
            InDict.Get(KeyVal, Value);
            KeyList.Add(KeyVal);
            ValueList.Add(Value);
        end;

        // Sort ValueList using bubble sort, rearrange KeyList accordingly
        for i := 1 to ValueList.Count() - 1 do begin
            for j := 1 to ValueList.Count() - i do begin
                if ValueList.Get(j) > ValueList.Get(j + 1) then begin
                    // Swap values in ValueList
                    ValueTemp := ValueList.Get(j);
                    ValueList.Set(j, ValueList.Get(j + 1));
                    ValueList.Set(j + 1, ValueTemp);

                    // Swap corresponding keys in KeyList
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;
            end;
        end;

        // Populate SortedDict in the sorted order of values
        foreach KeyVal in KeyList do begin
            InDict.Get(KeyVal, Value);
            SortedDict.Add(KeyVal, Value);
        end;

        InDict := SortedDict;
        exit(true);
    end;

    procedure SortByValues(var InDict: Dictionary of [Integer, Decimal]): Boolean
    var
        Value: Decimal;
        ValueTemp: Decimal;
        SortedDict: Dictionary of [Integer, Decimal];
        i, j : Integer;
        KeyTemp: Integer;
        KeyVal: Integer;
        ValueList: List of [Decimal];
        KeyList: List of [Integer];
    begin
        if InDict.Count() = 0 then
            exit(false);

        // Transfer dictionary items to KeyList and ValueList
        foreach KeyVal in InDict.Keys do begin
            InDict.Get(KeyVal, Value);
            KeyList.Add(KeyVal);
            ValueList.Add(Value);
        end;

        // Sort ValueList using bubble sort, rearrange KeyList accordingly
        for i := 1 to ValueList.Count() - 1 do begin
            for j := 1 to ValueList.Count() - i do begin
                if ValueList.Get(j) > ValueList.Get(j + 1) then begin
                    // Swap values in ValueList
                    ValueTemp := ValueList.Get(j);
                    ValueList.Set(j, ValueList.Get(j + 1));
                    ValueList.Set(j + 1, ValueTemp);

                    // Swap corresponding keys in KeyList
                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;
            end;
        end;

        // Populate SortedDict in the sorted order of values
        foreach KeyVal in KeyList do begin
            InDict.Get(KeyVal, Value);
            SortedDict.Add(KeyVal, Value);
        end;

        InDict := SortedDict;
        exit(true);
    end;

    // Sort by values for Dictionary of [Text, Integer]
    procedure SortByValues(var InDict: Dictionary of [Text, Integer]): Boolean
    var
        SortedDict: Dictionary of [Text, Integer];
        i, j : Integer;
        Value: Integer;
        ValueTemp: Integer;
        ValueList: List of [Integer];
        KeyList: List of [Text];
        KeyTemp: Text;
        KeyVal: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyVal in InDict.Keys do begin
            InDict.Get(KeyVal, Value);
            KeyList.Add(KeyVal);
            ValueList.Add(Value);
        end;

        for i := 1 to ValueList.Count() - 1 do begin
            for j := 1 to ValueList.Count() - i do begin
                if ValueList.Get(j) > ValueList.Get(j + 1) then begin
                    ValueTemp := ValueList.Get(j);
                    ValueList.Set(j, ValueList.Get(j + 1));
                    ValueList.Set(j + 1, ValueTemp);

                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;
            end;
        end;

        foreach KeyVal in KeyList do begin
            InDict.Get(KeyVal, Value);
            SortedDict.Add(KeyVal, Value);
        end;

        InDict := SortedDict;
        exit(true);
    end;

    // Sort by values for Dictionary of [Integer, Text]
    procedure SortByValues(var InDict: Dictionary of [Integer, Text]): Boolean
    var
        SortedDict: Dictionary of [Integer, Text];
        i, j : Integer;
        KeyTemp: Integer;
        KeyVal: Integer;
        KeyList: List of [Integer];
        ValueList: List of [Text];
        Value: Text;
        ValueTemp: Text;
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyVal in InDict.Keys do begin
            InDict.Get(KeyVal, Value);
            KeyList.Add(KeyVal);
            ValueList.Add(Value);
        end;

        for i := 1 to ValueList.Count() - 1 do begin
            for j := 1 to ValueList.Count() - i do begin
                if ValueList.Get(j) > ValueList.Get(j + 1) then begin
                    ValueTemp := ValueList.Get(j);
                    ValueList.Set(j, ValueList.Get(j + 1));
                    ValueList.Set(j + 1, ValueTemp);

                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;
            end;
        end;

        foreach KeyVal in KeyList do begin
            InDict.Get(KeyVal, Value);
            SortedDict.Add(KeyVal, Value);
        end;

        InDict := SortedDict;
        exit(true);
    end;

    // Sort by values for Dictionary of [Date, Integer]
    procedure SortByValues(var InDict: Dictionary of [Date, Integer]): Boolean
    var
        KeyTemp: Date;
        KeyVal: Date;
        SortedDict: Dictionary of [Date, Integer];
        i, j : Integer;
        Value: Integer;
        ValueTemp: Integer;
        KeyList: List of [Date];
        ValueList: List of [Integer];
    begin
        if InDict.Count() = 0 then
            exit(false);

        foreach KeyVal in InDict.Keys do begin
            InDict.Get(KeyVal, Value);
            KeyList.Add(KeyVal);
            ValueList.Add(Value);
        end;

        for i := 1 to ValueList.Count() - 1 do begin
            for j := 1 to ValueList.Count() - i do begin
                if ValueList.Get(j) > ValueList.Get(j + 1) then begin
                    ValueTemp := ValueList.Get(j);
                    ValueList.Set(j, ValueList.Get(j + 1));
                    ValueList.Set(j + 1, ValueTemp);

                    KeyTemp := KeyList.Get(j);
                    KeyList.Set(j, KeyList.Get(j + 1));
                    KeyList.Set(j + 1, KeyTemp);
                end;
            end;
        end;

        foreach KeyVal in KeyList do begin
            InDict.Get(KeyVal, Value);
            SortedDict.Add(KeyVal, Value);
        end;

        InDict := SortedDict;
        exit(true);
    end;
}