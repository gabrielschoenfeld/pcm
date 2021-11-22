page 50020 "Payment Plan ListPart"
{
    PageType = ListPart;
    SourceTable = "Payment Plan";
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Zahlungsplanzeilen', ENU='Payment Plan Lines';
    CardPageID = "Payment Plan";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater("Payment Plan")
            {
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Dieser beschreibt das Datum der Zahlung.';
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
                    Editable = false;
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