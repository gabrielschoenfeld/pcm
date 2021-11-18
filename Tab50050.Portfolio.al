table 50050 Portfolio
{
    CaptionML = DEU='Portfolio', ENU='Portfolio';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            CaptionML = DEU = 'Code', ENU = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Titel; Text[255])
        {
            CaptionML = DEU = 'Titel', ENU = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Beschreibung; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
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
