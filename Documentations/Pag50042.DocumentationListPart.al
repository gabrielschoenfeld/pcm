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
}