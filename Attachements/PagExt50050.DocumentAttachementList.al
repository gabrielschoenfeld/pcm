pageextension 50050 "Document Attachement Details" extends "Document Attachment Details"
{
    layout
    {
        addafter("Name")
        {
            field("File Title"; Rec."File Title") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gibt den Titel an.', ENU = 'Specifies the document title.';
            }
            field("File Description"; Rec."File Description") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gibt eine Beschreibung an.', ENU = 'Specifies a description.';
            }
            field("File Label"; Rec."File Label") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gibt den Dokumenttyp an.', ENU = 'Specifies the attachement type.';
            }
            /*
            field("Contract"; Rec."Contract") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Verknüpft das Dokument mit einem zugehörigen Vertrag.', ENU = 'Links the attachement to a contract.';
            }
            */
        }
    }
}