page 50052 "Project Cycle Management Setup"
{
    AdditionalSearchTerms = 'project pcm setup';
    ApplicationArea = Jobs;
    CaptionML = ENU = 'Project Cycle Management Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Project Cycle Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Portfolio Codes"; Rec."Portfolio Codes")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code to use when assigning codes to portfolios.';
                }
                field("Program Codes"; Rec."Program Codes")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code to use when assigning codes to programs.';
                }
                field("Project Codes"; Rec."Project Codes")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number series code to use when assigning codes to projects.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}