page 50056 "Contract List"
{
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Verträge', ENU='Contracts';
    CardPageID = "Contract";
    PageType = List;
    SourceTable = Contract;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Contract)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt die Beschreibung eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Vertragspartner.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Contractual partner', DEU = 'Vertragspartner';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Vertrags.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Vertragsbeginn.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Start date', DEU = 'Vertragsbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Vertragsende.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'End date', DEU = 'Vertragsende';
                }
            }
        }
    }
}