pageextension 50001 "Resource Group" extends "Resource Groups"
{
    layout
    {
        addafter("Name")
        {
            field("Description"; Rec."Description") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die Beschreibung für die Resourcengruppe an.', ENU = 'Specifies the description of resource group.';
            }
            field("Responsible Resource Group"; Rec."Resource Group") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die zuständige Abteilung für die Resourcengruppe an.', ENU = 'Specifies the responsible department of the resource group.';
            }
        }
    }
}