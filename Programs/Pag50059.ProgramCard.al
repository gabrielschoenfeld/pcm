page 50059 Program
{
    AdditionalSearchTerms = 'project pcm Program program projekt programm';
    CaptionML = DEU='Programm', ENU='Program';
    PageType = Card;
    SourceTable = Program;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', DEU = 'Allgemein';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Programs.';
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
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Programs.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beschreibt ein Program näher.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Programms.';
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
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Programmbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Programmbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Programmende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Programmende';
                }
            }
            group(Relation)
            {
                CaptionML = DEU = 'Zuordnung', ENU = 'Portfolio';
                field("Portfolio"; Rec."Portfolio")
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Programm gehört.';
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