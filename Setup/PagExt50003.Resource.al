pageextension 50003 "Resource" extends "Resource Card"
{
    layout
    {
        addafter("Name")
        {
            field("Description"; Rec."Description") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib die Beschreibung für die Ressource an.', ENU = 'Specifies the description of resource.';
            }
        }
    }
}