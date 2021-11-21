pageextension 50002 "Contact Card" extends "Contact Card"
{
    layout
    {
        addafter("Name")
        {
            field("Description"; Rec."Description") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib eine Beschreibung an.', ENU = 'Specifies a description.';
            }
        }
        addafter("Salesperson Code")
        {
            field("Responsible Resource Group"; Rec."Resource Group") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die zuständige Abteilung an.', ENU = 'Specifies the responsible department.';
            }
        }
    }
    actions
    {
        addafter("Create as") 
        { 
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    CaptionML = ENU = 'Dimensions', DEU = 'Vorgabedimensionen';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5050),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Alt+D';
                    ToolTipML = ENU = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.', DEU = 'Vorgabedimensionen anzeigen oder bearbeiten, z.B. Bereich, Projekt oder Abteilung.';
                }
        }
    }
}