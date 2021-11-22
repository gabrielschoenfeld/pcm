page 50082 "ContractFP Mapping List"
{
    AdditionalSearchTerms = 'project pcm location program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Vertrags-Finanzierugnsplan-Mapping', ENU='Contract Finance Plan Mapping';
    CardPageID = "Contract";
    PageType = ListPart;
    SourceTable = "ContractFPMapping";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                    Editable = false;
                }
            }
        }
    }
}