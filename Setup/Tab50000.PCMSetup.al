table 50000 "Project Cycle Management Setup"
{
    CaptionML = ENU = 'Project Cycle Management Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Portfolio Codes"; Code[20])
        {
            CaptionML = ENU = 'Portfolio Codes', DEU = 'Portfolio Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Program Codes"; Code[20])
        {
            CaptionML = ENU = 'Program Codes', DEU = 'Programm Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(4; "Project Codes"; Code[20])
        {
            CaptionML = ENU = 'Project Codes', DEU = 'Projekt Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(5; "Location Codes"; Code[20])
        {
            CaptionML = ENU = 'Location Codes', DEU = 'Ort Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    
}
