table 50002 ContactMapping
{
    CaptionML = DEU='Kontakt Mapping', ENU='Contact Mapping';
    DataClassification = CustomerContent;
    DrillDownPageID = "Contact ListPart";
    LookupPageID = "Contact ListPart";
    
    fields
    {
        field(1; "Project Code"; Code[20])
        {
            CaptionML = DEU = 'Projektcode', ENU = 'Project Code';
            TableRelation = "Project".Code;
        }
        field(2; "Contact Code"; Code[20])
        {
            CaptionML = DEU = 'Kontaktcode', ENU = 'Contact Code';
            TableRelation = "Contact"."No.";
        }
        field(3; Name; Text[255])
        {
            CaptionML = DEU = 'Name', ENU = 'Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."Name"
            WHERE ("No."=Field("Contact Code")));
        }
        field(4; Description; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."Description"
            WHERE ("No."=Field("Contact Code")));
        }
        field(5; "Type"; Enum "Contact Type")
        {
            CaptionML = ENU = 'Type', DEU = 'Typ';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contact"."Type"
            WHERE ("No."=Field("Contact Code")));
        }
    }
    keys
    {
        key(PK; "Project Code", "Contact Code")
        {
            Clustered = true;
        }
    }
}