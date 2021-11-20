page 50081 "Contract"
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    CaptionML = DEU='Vertrag', ENU='Contract';
    PageType = Card;
    SourceTable = Contract;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = DEU = 'Allgemein', ENU = 'General';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt die Beschreibung eines Vertrags.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
            }
            group(Partner)
            {
                CaptionML = DEU = 'Partner', ENU = 'Partner';
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Vertragspartner.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Contractual partner', DEU = 'Vertragspartner';
                }
            }
            group(Validity)
            {
                CaptionML = DEU = 'Gültigkeit', ENU = 'Validity';
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Vertragsbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Vertragsbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Vertragsende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Vertragsende';
                }
            }
        }
        area(FactBoxes) {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', DEU = 'Begleitdokument';
                SubPageLink = "Table ID" = CONST(50057),
                              "No." = FIELD("Code");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}