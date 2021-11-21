tableextension 50001 "Resource Group" extends "Resource Group"
{
    fields
    {
        field(50000; "Resource Group"; Code[20]) 
        {
            CaptionML = DEU = 'Ressourcengruppe zuständig', ENU = 'Resource group responsible';
            TableRelation = "Resource Group";
            DataClassification = CustomerContent;
        }
        field(500001; "Description"; Text[2048]) 
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            DataClassification = CustomerContent;
        }
        field(50002; "Resource"; Code[20]) 
        {
            CaptionML = DEU = 'Ressource zuständig', ENU = 'Resource responsible';
            TableRelation = "Resource";
            DataClassification = CustomerContent;
        }
    }
}