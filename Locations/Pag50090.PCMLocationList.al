page 50090 "PCMLocation List"
{
    AdditionalSearchTerms = 'project pcm location program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Orte', ENU='Locations';
    CardPageID = "PCMLocation";
    PageType = List;
    SourceTable = PCMLocation;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Title; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Locations.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Dieser Wert gibt das Land an, in dem der Ort liegt.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Country', DEU = 'Land';
                }
                field(Latitude; Rec.Latitude)
                {
                    ToolTip = 'Dieser Wert gibt den Breitengrad an, an dem der Ort liegt.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Latitude', DEU = 'Breitengrad';
                }
                field(Longitude; Rec.Longitude)
                {
                    ToolTip = 'Dieser Wert gibt den Längengrad an, an dem der Ort liegt.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Longitude', DEU = 'Längengrad';
                }
            }
        }
    }
}