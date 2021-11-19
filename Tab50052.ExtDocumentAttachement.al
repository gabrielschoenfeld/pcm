tableextension 50052 "Document Attachement" extends "Document Attachment"
{
    fields
    {
        field(50050; "Type"; Code[20]) 
        {
            CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Attachment Type';
            TableRelation = "Attachement Type";
        }
    }
}