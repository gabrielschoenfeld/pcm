pageextension 50001 "Resource Group" extends "Resource Groups"
{
    layout
    {
        addafter("Name")
        {
            field("Description"; Rec."Description") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die Beschreibung für die Ressourcengruppe an.', ENU = 'Specifies the description of resource group.';
            }
            field("Resource responsible"; Rec."Resource") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die zuständige Ressource an.', ENU = 'Specifies the responsible resource.';
            }
            field("Resource Group responsible"; Rec."Resource Group") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die zuständige Resourcengruppe an.', ENU = 'Specifies the responsible resource group.';
            }
        }
    }
}