tableextension 50095 "Country/Region" extends "Country/Region"
{
    fields
    {
        field(50000; "Alpha3"; Text[3]) 
        {
            CaptionML = DEU = 'ISO Alpha3 Code', ENU = 'ISO Alpha3 Code';
            DataClassification = CustomerContent;
        }
        field(500001; "NumCode"; Text[3]) 
        {
            CaptionML = DEU = 'Numerischer Ländercode', ENU = 'Numeric Number Code';
            DataClassification = CustomerContent;
        }
    }
}