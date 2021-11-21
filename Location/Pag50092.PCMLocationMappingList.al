page 50092 "PCMLocation Mapping List"
{
    AdditionalSearchTerms = 'project pcm location program projekt programm';
    ApplicationArea = All;
    CaptionML = DEU='Ort Mapping', ENU='Location Mapping';
    CardPageID = "PCMLocation";
    PageType = List;
    SourceTable = "PCMLocationMapping";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Project; Rec."Project Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Project Code', DEU = 'Projektcode';
                    Editable = false;
                }
                field(PCMLocation; Rec."Location Code")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Location Code', DEU = 'Ortscode';
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