page 50051 PortfolioList
{

    ApplicationArea = All;
    Caption = 'Portfolio';
    CardPageID = "Portfolio";
    PageType = List;
    SourceTable = Portfolio;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Titel; Rec.Titel)
                {
                    ToolTip = 'Specifies the value of the Titel field.';
                    ApplicationArea = All;
                }
                field(Beschreibung; Rec.Beschreibung)
                {
                    ToolTip = 'Specifies the value of the Beschreibung field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}