tableextension 50001 "Resource Group" extends "Resource Group"
{
    fields
    {
        field(50000; "Resource Group"; Code[20]) 
        {
            CaptionML = DEU = 'Zuständig', ENU = 'Responsible';
            TableRelation = "Resource Group";
            DataClassification = CustomerContent;
        }
        field(500001; "Description"; Text[2048]) 
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            DataClassification = CustomerContent;
        }
    }
}