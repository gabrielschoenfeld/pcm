page 50030 "Financing Plan ListPart"
{
    PageType = ListPart;
    SourceTable = "Financing Plan";
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Zahlungsplanzeilen', ENU='Financing Plan Lines';
    CardPageID = "Financing Plan";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater("Financing Plan")
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschreibt den Code einer Zahlungsplanzeile.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Project; Rec.Project)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschreibt das zur Zahlungsplanzeile gehörige Projekt.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Project', DEU = 'Projekt';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Dieser Wert beschreibt den Beginn des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Dieser Wert beschreibt das Ende des Verausgabungszeitraums.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                }
                field("Amount"; Rec."Amount")
                {
                    ToolTip = 'Dieser Wert beschreibt den Betrag.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Amount', DEU = 'Betrag';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Dieser Wert entspricht der Beschreibung einer Zahlungsplanzeile.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert beschreibt den Status einer Zahlungsplanzeile.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
                field(Customer; Rec.Customer)
                {
                    ToolTip = 'Dieser Wert beschreibt den Geldgeber.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Donor', DEU = 'Geldgeber';
                }
                field(Vendor; Rec.Vendor)
                {
                    ToolTip = 'Dieser Wert beschreibt den Implementierungspartner.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Implementation partner', DEU = 'Implementierungspartner';
                }
            }
        }
    }
}