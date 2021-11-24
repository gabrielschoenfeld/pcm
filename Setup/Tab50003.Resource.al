table 50003 ResourceMapping
{
    CaptionML = DEU='Ressource Mapping', ENU='Resource Mapping';
    DataClassification = CustomerContent;
    DrillDownPageID = "Resource ListPart";
    LookupPageID = "Resource ListPart";
    
    fields
    {
        field(1; "Project Code"; Code[20])
        {
            CaptionML = DEU = 'Projektcode', ENU = 'Project Code';
            TableRelation = "Project".Code;
        }
        field(2; "Resource Code"; Code[20])
        {
            CaptionML = DEU = 'Ressourcencode', ENU = 'Resource Code';
            TableRelation = "Resource"."No.";
        }
        field(3; Name; Text[255])
        {
            CaptionML = DEU = 'Name', ENU = 'Name';
            FieldClass = FlowField;
            CalcFormula = Lookup("Resource"."Name"
            WHERE ("No."=Field("Resource Code")));
        }
        field(4; Description; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            FieldClass = FlowField;
            CalcFormula = Lookup("Resource"."Description"
            WHERE ("No."=Field("Resource Code")));
        }
        field(5; "Type"; Enum "Resource Type")
        {
            CaptionML = ENU = 'Type', DEU = 'Typ';
            FieldClass = FlowField;
            CalcFormula = Lookup("Resource"."Type"
            WHERE ("No."=Field("Resource Code")));
        }
    }
    keys
    {
        key(PK; "Project Code", "Resource Code")
        {
            Clustered = true;
        }
    }
}