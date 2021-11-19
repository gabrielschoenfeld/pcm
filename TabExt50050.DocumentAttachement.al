tableextension 50050 "Document Attachement" extends "Document Attachment"
{
    fields
    {
        field(50050; "Document label"; Code[20]) 
        {
            CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Document label';
            TableRelation = "Document Attachement Label";
            DataClassification = CustomerContent;
            NotBlank = true;
        }
    }
}