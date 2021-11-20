pageextension 50000 "Dimension Values" extends "Dimension Values"
{
    layout
    {
        addafter("Name")
        {
            field("Resource"; Rec."Resource") 
            {
                ApplicationArea = Basic, Suite;
                ToolTipML = DEU = 'Gibt den Dimensionleiter für den Dimensionswert an.', ENU = 'Specifies the person in charge of this dimension value.';
            }
        }
    }
}