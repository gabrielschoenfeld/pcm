table 50082 ContractFPMapping
{
    CaptionML = DEU='Finanzierungsplan-Vertrags-Mapping', ENU='Finance Plan Contract Mapping';
    DataClassification = CustomerContent;
    DrillDownPageID = "ContractFP Mapping List";
    LookupPageID = "ContractFP Mapping List";
    
    fields
    {
        field(1; "Financing Plan Code"; Code[20])
        {
            CaptionML = DEU = 'Finanzierungsplan Code', ENU = 'Financing Plan Code';
            TableRelation = "Financing Plan";
        }
        field(2; "Contract Code"; Code[20])
        {
            CaptionML = DEU = 'Vertragscode', ENU = 'Contract Code';
            TableRelation = "Contract";
        }
        field(3; Title; Text[255])
        {
            CaptionML = DEU = 'Bezeichnung', ENU = 'Title';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contract"."Title"
            WHERE ("Code"=Field("Contract Code")));
        }
        field(4; Description; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            FieldClass = FlowField;
            CalcFormula = Lookup("Contract"."Description"
            WHERE ("Code"=Field("Contract Code")));
        }
    }
    keys
    {
        key(PK; "Financing Plan Code", "Contract Code")
        {
            Clustered = true;
        }
    }
}