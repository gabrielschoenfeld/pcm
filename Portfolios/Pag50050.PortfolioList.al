page 50050 "Portfolio List"
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Portfolios', ENU='Portfolios';
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
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Portfolios.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Portfolios.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
            }
        }
    }
}