pageextension 50095 "Countries/Regions" extends "Countries/Regions"
{
    layout
    {
        addafter("Name")
        {
            field("NumCode"; Rec."NumCode") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib den Organisationsinternen Nummercode an.', ENU = 'Specifies the organization specific number code.';
            }
            field("Alpha3"; Rec."Alpha3") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gib den Alpha3 Code an.', ENU = 'Specifies the Alpha3 Code.';
            }
        }
    }
}