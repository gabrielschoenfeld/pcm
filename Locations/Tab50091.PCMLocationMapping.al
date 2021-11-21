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
        field(2; "Location Code"; Code[20])
        {
            CaptionML = DEU = 'Ortscode', ENU = 'Location Code';
            TableRelation = "PCMLocation";
        }
        field(3; Title; Text[255])
        {
            CaptionML = DEU = 'Bezeichnung', ENU = 'Title';
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Title"
            WHERE ("Code"=Field("Location Code")));
        }
        field(4; Description; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Description"
            WHERE ("Code"=Field("Location Code")));
        }
        field(5; "Country"; Code[20])
        {
            CaptionML = ENU = 'Country', DEU = 'Land';
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Country"
            WHERE ("Code"=Field("Location Code")));
        }
        field(6; "Latitude"; Decimal)
        {
            CaptionML = ENU = 'Latitude', DEU = 'Breitengrad';
            FieldClass = FlowField;
            CalcFormula = Lookup("PCMLocation"."Latitude"
            WHERE ("Code"=Field("Location Code")));
        }
        field(7; "Longitude"; Decimal)
        {
            CaptionML = ENU = 'Longitude', DEU = 'Längengrad';
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