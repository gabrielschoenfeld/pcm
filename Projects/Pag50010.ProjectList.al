page 50010 "Project List"
{
    AdditionalSearchTerms = 'project pcm Project Project projekt Projekt';
    ApplicationArea = All;
    CaptionML = DEU='Projekte', ENU='Projects';
    CardPageID = "Project";
    PageType = List;
    SourceTable = Project;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert beschribt den Status eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser beschribt den Projektbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Projektbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert beschribt das Projektende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Projektende';
                }
                field(Portfolio; Rec.Portfolio)
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                }
                field(Program; Rec.Program)
                {
                    ToolTip = 'Dieser Wert bezeichnet das Program zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Program', DEU = 'Programm';
                }
            }
        }
    }
}