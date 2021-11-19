pageextension 50050 "Document Attachement Details" extends "Document Attachment Details"
{
    layout
    {
        addafter("Name")
        {
            field("Type"; Rec.Type) 
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Attachement type';
                ToolTipML = DEU = 'Gibt den Dokumenttyp an.', ENU = 'Specifies the attachement type.';
            }
        }
    }
}