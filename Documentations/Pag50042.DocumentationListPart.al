page 50042 "Documentation ListPart"
{
    PageType = ListPart;
    SourceTable = "Documentation";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Project"; Rec."Project")
                {
                    Visible = false;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Title"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetCurrentKey("Date", "ID");
        Rec.SetAscending("Date", false);
    end;

    trigger OnAfterGetRecord()
    begin
        GetProject();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetProject();
    end;

    local procedure GetProject()
    begin
        if not Pro.Get(Rec."Project") then
            Pro.Init();
        Rec.Project := Pro.Code;
    end;

    var
        Pro: Record Project;
}