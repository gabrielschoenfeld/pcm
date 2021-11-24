page 50001 "Contact Mapping Card"
{
    AdditionalSearchTerms = 'project pcm Contact program projekt programm';
    CaptionML = DEU='Kontakt Mapping', ENU='Contact Mapping';
    PageType = Card;
    SourceTable = "ContactMapping";

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = DEU = 'Verknüpfung', ENU = 'Verknüpfung';
                field(Project; Rec."Project Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Project', DEU = 'Projekt';
                    Editable = true;
                    Visible = false;
                }
                field(Contact; Rec."Contact Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Contact', DEU = 'Kontakt';
                    Editable = true;
                    Visible = true;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Name', DEU = 'Name';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Type', DEU = 'Typ';
                    Editable = false;
                }
            }
        }
    }
}