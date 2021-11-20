tableextension 50000 "Dimension Value" extends "Dimension Value"
{
    fields
    {
        field(50000; "Resource"; Code[20]) 
        {
            CaptionML = DEU = 'Zuständig', ENU = 'Responsible';
            TableRelation = "Resource";
            DataClassification = CustomerContent;
        }
    }
}