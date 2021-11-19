tableextension 50050 "Document Attachement" extends "Document Attachment"
{
    fields
    {
        field(50050; "Document Attachement Label"; Code[20]) 
        {
            CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Document Attachement Label';
            TableRelation = "Document Attachement Label";
            DataClassification = CustomerContent;
            NotBlank = true;
        }
    }
}