page 50071 "Document Attachement Label"
{
    AdditionalSearchTerms = 'attachement anhang beleg document dokument type typ label';
    CaptionML = DEU='Begleitdokumenttyp', ENU='Document Attachement Label';
    PageType = Card;
    SourceTable = "Document Attachement Label";
    
    layout
    {
        area(content)
        {
            group(Document)
            {
                CaptionML = DEU='Dokumenttyp', ENU='Document Label';
                field("Code"; Rec."Code")
                {
                    ToolTipML = ENU = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ToolTipML = ENU = 'Specifies the value of the Title field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTipML = ENU = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    CaptionML = DEU='Erstellt am', ENU='Created at';
                    ToolTipML = ENU = 'Specifies the value of the SystemCreatedAt field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    CaptionML = DEU='Verändert am', ENU='Modified at';
                    ToolTipML = ENU = 'Specifies the value of the SystemModifiedAt field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
