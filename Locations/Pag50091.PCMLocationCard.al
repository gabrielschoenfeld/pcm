page 50091 PCMLocation
{
    AdditionalSearchTerms = 'project pcm location program projekt programm';
    CaptionML = DEU='Ort', ENU='Location';
    PageType = Card;
    SourceTable = PCMLocation;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'Location', DEU = 'Ort';
                field(Title; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt die Bezeichnung eines Orts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Bezeichnung';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beschreibt einen Ort näher.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
            }
            group(Geography)
            {
                CaptionML = ENU = 'Geography', DEU = 'Geographie';
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
        area(FactBoxes) {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', DEU = 'Begleitdokument';
                SubPageLink = "Table ID" = CONST(50051),
                              "No." = FIELD("Code");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
}