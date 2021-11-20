page 50051 Portfolio
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    CaptionML = DEU='Portfolio', ENU='Portfolio';
    PageType = Card;
    SourceTable = Portfolio;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Portfolios.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit;
                    end;
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Portfolios.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beschreibt ein Portfolio näher.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
            }
            group(Programs)
            {
                CaptionML = ENU = 'Programs', DEU = 'Programme';
                part("Program ListPart"; "Program ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Portfolio" = FIELD("Code");
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes) {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', DEU = 'Begleitdokument';
                SubPageLink = "Table ID" = CONST(50051),
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