table 50092 PCMLocationMapping
{
    CaptionML = DEU='Ort Mapping', ENU='Location Mapping';
    DataClassification = CustomerContent;
    DrillDownPageID = "PCMLocation Mapping List";
    LookupPageID = "PCMLocation Mapping List";
    
    fields
    {
        field(1; "Project Code"; Code[20])
        {
            CaptionML = DEU = 'Projektcode', ENU = 'Project Code';
        //    TableRelation = ""
        }
        field(5; "Location Code"; Code[20])
        {
            CaptionML = DEU = 'Ortscode', ENU = 'Location Code';
            TableRelation = "PCMLocation";
        }
        field(6; "Latitude"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Latitude"
            WHERE ("Code"=Field("Location Code")));
        }
        field(7; "Longitude"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Longitude"
            WHERE ("Code"=Field("Location Code")));
        }
    }
    keys
    {
        key(PK; "Project Code", "Location Code")
        {
            Clustered = true;
        }
    }
}