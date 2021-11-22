page 50031 "Financing Plan"
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    CaptionML = DEU='Vertrag', ENU='Financing Plan';
    PageType = Card;
    SourceTable = "Financing Plan";

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
                field(Project; Rec.Project)
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
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Dieser Wert beschreibt den Beginn des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Dieser Wert beschreibt das Ende des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                }
            }
            group(Contract) 
            {
                CaptionML = DEU = 'Verträge', ENU = 'Contracts';
                part("ContractFP ListPart"; "ContractFP Mapping List")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Financing Plan Code" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
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