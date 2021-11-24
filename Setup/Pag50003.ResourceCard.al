page 50003 "Resource Mapping Card"
{
    AdditionalSearchTerms = 'project pcm Resource program projekt programm';
    CaptionML = DEU='Ressource Mapping', ENU='Resource Mapping';
    PageType = Card;
    SourceTable = "ResourceMapping";

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
                field(Resource; Rec."Resource Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Resource', DEU = 'Ressource';
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