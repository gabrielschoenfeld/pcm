table 50052 "Project Cycle Management Setup"
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
            Caption = 'Portfolio Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "Program Codes"; Code[20])
        {
            Caption = 'Program Codes';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(4; "Project Codes"; Code[20])
        {
            Caption = 'Project Codes';
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
