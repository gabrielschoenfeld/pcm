page 50040 "Documentation List"
{
    AdditionalSearchTerms = 'project pcm Documentation Documentation projekt Dokumentation';
    ApplicationArea = All;
    CaptionML = DEU='Dokumentationen', ENU='Documentations';
    CardPageID = "Documentation";
    PageType = List;
    SourceTable = Documentation;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Titel; Rec.Date)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Datum einer Dokumentation.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beinhaltet eine Dokumentation.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Dokumentations.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                    Editable = false;
                }
                field("Applicant"; Rec.Applicant)
                {
                    ToolTip = 'Dieser Wert bezeichnet einen Antragsteller.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Applicant', DEU = 'Antragsteller';
                }
                field("Approver"; Rec."Approver")
                {
                    ToolTip = 'Dieser Wert bezeichnet den Genehmiger.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Approver', DEU = 'Genehmiger';
                }
            }
        }
    }
}