pageextension 50050 "Document Attachement Details" extends "Document Attachment Details"
{
    layout
    {
        addafter("Name")
        {
            field("Document Attachement Label"; Rec."Document Attachement Label") 
            {
                ApplicationArea = Basic, Suite;;
                CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Attachement type';
                ToolTipML = DEU = 'Gibt den Dokumenttyp an.', ENU = 'Specifies the attachement type.';
            }
        }
    }
}