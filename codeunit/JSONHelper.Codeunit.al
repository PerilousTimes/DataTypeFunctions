codeunit 60054 "JSON Helper"
{
    procedure JsonToRec(JsonObject: JsonObject; Rec: Variant): Variant
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        exit(JsonToRec(JsonObject, Ref.Number()));
    end;

    procedure JsonToRec(JsonObject: JsonObject; TableNo: Integer): Variant
    var
        RecRef: RecordRef;
        FldRef: FieldRef;
        FldHash: Dictionary of [Text, Integer];
        i: Integer;
        JsonToken: JsonToken;
        JsonKeyValue: JsonValue;
        JsonKey: Text;
        RecVariant: Variant;
    begin
        RecRef.OPEN(TableNo);
        for i := 1 to RecRef.FieldCount() do begin
            FldRef := RecRef.FieldIndex(i);
            FldHash.Add(GetJsonFieldName(FldRef), FldRef.Number);
        end;
        RecRef.Init();
        foreach JsonKey in JsonObject.Keys() do begin
            if JsonObject.Get(JsonKey, JsonToken) then begin
                if JsonToken.IsValue() then begin
                    JsonKeyValue := JsonToken.AsValue();
                    FldRef := RecRef.Field(FldHash.Get(JsonKey));
                    AssignValueToFieldRef(FldRef, JsonKeyValue);
                end;
            end;
        end;
        RecVariant := RecRef;
        exit(RecVariant);
    end;

    procedure RecToJson(Rec: Variant): JsonObject
    var
        RecRef: RecordRef;
        FldRef: FieldRef;
        i: Integer;
        JsonObject: JsonObject;
    begin
        if not Rec.IsRecord then
            error('Parameter Rec is not a record');
        RecRef.GetTable(Rec);
        for i := 1 to RecRef.FieldCount() do begin
            FldRef := RecRef.FieldIndex(i);
            case FldRef.Class of
                FldRef.Class::Normal:
                    JsonObject.Add(GetJsonFieldName(FldRef), FieldRefToJsonValue(FldRef));
                FldRef.Class::FlowField:
                    begin
                        FldRef.CalcField();
                        JsonObject.Add(GetJsonFieldName(FldRef), FieldRefToJsonValue(FldRef));
                    end;
            end;
        end;
        exit(JsonObject);
    end;

    procedure RecToJsonSchema(Rec: Variant): JsonObject
    var
        RecRef: RecordRef;
        FldRef: FieldRef;
        i: Integer;
        JsonObject: JsonObject;
        Properties: JsonObject;
    begin
        if not Rec.IsRecord then
            error('Parameter Rec is not a record');
        RecRef.GetTable(Rec);

        JsonObject.Add('schema', 'http://json-schema.org/draft-07/schema#');
        JsonObject.Add('type', 'object');

        for i := 1 to RecRef.FieldCount() do begin
            FldRef := RecRef.FieldIndex(i);
            GetRecProperties(Properties, FldRef);
        end;

        JsonObject.Add('properties', Properties);
        exit(JsonObject);
    end;

    local procedure AlDataTypeToJsonDataType(FRef: FieldRef; var returnValue: Text): Boolean
    begin
        case FRef.Type of
            FRef.Type::BigInteger:
                returnValue := 'integer';
            FRef.Type::Boolean:
                returnValue := 'boolean';
            FRef.Type::Code:
                returnValue := 'string';
            FRef.Type::Date:
                returnValue := 'date';
            FRef.Type::DateTime:
                returnValue := 'date-time';
            FRef.Type::Decimal:
                returnValue := 'decimal';
            FRef.Type::Duration:
                returnValue := 'duration';
            FRef.Type::Guid:
                returnValue := 'guid';
            FRef.Type::Integer:
                returnValue := 'integer';
            FRef.Type::Option:
                returnValue := 'string';
            FRef.Type::RecordId:
                returnValue := 'guid';
            FRef.Type::Text:
                returnValue := 'string';
            FRef.Type::Time:
                returnValue := 'time';
            else
                exit(false);
        end;

        exit(true);
    end;

    local procedure AssignValueToFieldRef(var FldRef: FieldRef; JsonKeyValue: JsonValue)
    begin
        case FldRef.Type() of
            FieldType::Code,
            FieldType::Text:
                FldRef.Value := JsonKeyValue.AsText();
            FieldType::Integer:
                FldRef.Value := JsonKeyValue.AsInteger();
            FieldType::Date:
                FldRef.Value := JsonKeyValue.AsDate();
            else
                error('%1 is not a supported field type', FldRef.Type());
        end;
    end;

    local procedure FieldRefToJsonValue(FldRef: FieldRef): JsonValue
    var
        D: Date;
        DT: DateTime;
        V: JsonValue;
        T: Time;
    begin
        case FldRef.Type() of
            FieldType::Date:
                begin
                    D := FldRef.Value;
                    V.SetValue(D);
                end;
            FieldType::Time:
                begin
                    T := FldRef.Value;
                    V.SetValue(T);
                end;
            FieldType::DateTime:
                begin
                    DT := FldRef.Value;
                    V.SetValue(DT);
                end;
            else
                V.SetValue(Format(FldRef.Value, 0, 9));
        end;
        exit(v);
    end;

    local procedure GetJsonFieldName(FldRef: FieldRef): Text
    var
        i: Integer;
        Name: Text;
    begin
        Name := FldRef.Name();
        for i := 1 to Strlen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    local procedure GetRecProperties(var PropertiesOut: JsonObject; FldRef: FieldRef): Boolean
    var
        FieldProperties: JsonObject;
        tType: Text;
    begin
        if not AlDataTypeToJsonDataType(FldRef, tType) then
            exit(false);

        FieldProperties.Add('type', tType);
        PropertiesOut.Add(FldRef.Name(), FieldProperties);
        exit(true);
    end;
}