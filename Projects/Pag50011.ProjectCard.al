page 50011 Project
{
    AdditionalSearchTerms = 'project pcm Project Project projekt Projekt';
    CaptionML = DEU='Projekt', ENU='Project';
    PageType = Card;
    SourceTable = Project;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', DEU = 'Allgemein';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Projects.';
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
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Projects.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beschreibt ein Project näher.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
            }
            group(Validity)
            {
                CaptionML = DEU = 'Gültigkeit', ENU = 'Validity';
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Projektbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Projektbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Projektende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Projektende';
                }
            }
            group(Relation)
            {
                CaptionML = DEU = 'Zuordnung', ENU = 'Portfolio';
                field("Portfolio"; Rec."Portfolio")
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                }
            }
        }
        area(FactBoxes) {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', DEU = 'Begleitdokument';
                SubPageLink = "Table ID" = CONST(50059),
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