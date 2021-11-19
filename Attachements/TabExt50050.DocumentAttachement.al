tableextension 50050 "Document Attachement" extends "Document Attachment"
{
    fields
    {
        field(50050; "File Title"; Text[255]) 
        {
            CaptionML = DEU = 'Title', ENU = 'Title';
            DataClassification = CustomerContent;
        }
        field(50051; "File Description"; Text[2048]) 
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            DataClassification = CustomerContent;
        }
        field(50052; "File Label"; Code[20]) 
        {
            CaptionML = DEU = 'Begleitdokumenttyp', ENU = 'Document Attachement Label';
            TableRelation = "Document Attachement Label";
            DataClassification = CustomerContent;
        }

        field(50053; "Contract"; Code[20]) 
        {
            CaptionML = DEU = 'Vertrag', ENU = 'Contract';
            TableRelation = "Contract";
            DataClassification = CustomerContent;
        }
    }
}