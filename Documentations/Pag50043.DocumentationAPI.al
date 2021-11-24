page 50043 DocumentationApi
{
    PageType = API;
    CaptionML = DEU = 'Dokumentation API', ENU = 'Documentation API';
    APIPublisher = 'adra';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'documentation';
    EntitySetName = 'documentations';
    SourceTable = Documentation;
    DelayedInsert = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Date"; Rec.Date)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Datum einer Dokumentation.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                    Editable = not Rec.Blocked;
                }
                field("Description"; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beinhaltet eine Dokumentation.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                    Editable = not Rec.Blocked;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Dokumentations.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                    Editable = false;
                }
                field("Applicant"; Rec.Applicant)
                {
                    ToolTip = 'Dieser Wert bezeichnet einen Antragsteller.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Applicant', DEU = 'Antragsteller';
                    Editable = not Rec.Blocked;
                }
                field("Approver"; Rec."Approver")
                {
                    ToolTip = 'Dieser Wert bezeichnet den Genehmiger.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Approver', DEU = 'Genehmiger';
                    Editable = not Rec.Blocked;
                }
            }
        }
    }
}