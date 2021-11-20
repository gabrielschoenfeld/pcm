tableextension 50002 "Contact" extends "Contact"
{
    fields
    {
        field(50000; "Resource Group"; Code[20]) 
        {
            CaptionML = DEU = 'Zuständig', ENU = 'Responsible';
            TableRelation = "Resource Group";
            DataClassification = CustomerContent;
        }
    }
}