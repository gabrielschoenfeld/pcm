page 50021 "Payment Plan"
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    CaptionML = DEU='Vertrag', ENU='Payment Plan';
    PageType = Card;
    SourceTable = "Payment Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = DEU = 'Allgemein', ENU = 'General';
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
                    ToolTip = 'Dieser Wert beschreibt den Geldgeber.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Donor', DEU = 'Geldgeber';
                }
                field(Vendor; Rec.Vendor)
                {
                    ToolTip = 'Dieser Wert beschreibt den Implementierungspartner.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Implementation partner', DEU = 'Implementierungspartner';
                }
            }
            group(Validity)
            {
                CaptionML = DEU = 'Gültigkeit', ENU = 'Validity';
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Dieser beschreibt das Datum der Zahlung.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
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