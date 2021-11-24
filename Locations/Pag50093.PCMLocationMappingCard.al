page 50093 "PCMLocation Mapping Card"
{
    AdditionalSearchTerms = 'project pcm location program projekt programm';
    CaptionML = DEU='Ort Mapping', ENU='Location Mapping';
    PageType = Card;
    SourceTable = "PCMLocationMapping";

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
                field(Location; Rec."Location Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Location', DEU = 'Ort';
                    Editable = true;
                    Visible = true;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                    Editable = false;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Country', DEU = 'Land';
                    Editable = false;
                }
                field(Latitude; Rec.Latitude)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Latitude', DEU = 'Breitengrad';
                    Editable = false;
                }
                field(Longitude; Rec.Longitude)
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Longitude', DEU = 'Längengrad';
                    Editable = false;
                }
            }
        }
    }
}