tableextension 50003 "Resource" extends "Resource"
{
    fields
    {
        field(500000; "Description"; Text[2048]) 
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            DataClassification = CustomerContent;
        }
        // User ID has been neglected in favor of Time Sheet Owner (same purpose)
    }
}