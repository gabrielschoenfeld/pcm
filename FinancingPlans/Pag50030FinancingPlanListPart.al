page 50030 "Financing Plan ListPart"
{
    PageType = ListPart;
    SourceTable = "Financing Plan";
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Finanzierungsplanzeilen', ENU='Financing Plan Lines';
    CardPageID = "Financing Plan";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater("Financing Plan")
            {
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Dieser Wert beschreibt den Geldgeber.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Donor', DEU = 'Geldgeber';
                }
                field("Amount"; Rec."Amount")
                {
                    ToolTip = 'Dieser Wert beschreibt den Betrag.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Amount', DEU = 'Betrag';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Dieser Wert entspricht der Beschreibung einer Finanzierungsplanzeile.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Dieser Wert beschreibt den Beginn des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Exp. Period Start Date', DEU = 'Verausg. Stardatum';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Dieser Wert beschreibt das Ende des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Exp. Period End Date', DEU = 'Verausg. Enddatum';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert beschreibt den Status einer Finanzierungsplanzeile.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
            }
        }
    }
}