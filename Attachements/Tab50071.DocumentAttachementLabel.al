table 50071 "Document Attachement Label"
{
    CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Attachement Type';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            CaptionML = DEU = 'Code', ENU = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Title; Text[255])
        {
            CaptionML = DEU = 'Titel', ENU = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[2046])
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
