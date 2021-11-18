table 50050 Portfolio
{
    Caption = 'Portfolio';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Titel; Text[255])
        {
            Caption = 'Titel';
            DataClassification = CustomerContent;
        }
        field(3; Beschreibung; Text[2048])
        {
            Caption = 'Beschreibung';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
    
}
