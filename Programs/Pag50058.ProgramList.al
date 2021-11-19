page 50058 "Program List"
{
    AdditionalSearchTerms = 'project pcm program program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Programme', ENU='Programs';
    CardPageID = "Program";
    PageType = List;
    SourceTable = Program;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Programms.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Programms.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert beschribt den Status eines Programms.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser beschribt den Programmbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Programmbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert beschribt das Programmende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Programmende';
                }
                field(Portfolio; Rec.Portfolio)
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Programm gehört.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                }
            }
        }
    }
}