page 50004 "Resource ListPart"
{
    PageType = ListPart;
    SourceTable = "ResourceMapping";
    AdditionalSearchTerms = 'project pcm portfolio program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Ressourcenverknüpfung', ENU='Resource Mapping';
    CardPageID = "Resource Mapping Card";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater("Resource")
            {
                field(Project; Rec."Project Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Project', DEU = 'Projekt';
                    Editable = false;
                    Visible = false;
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