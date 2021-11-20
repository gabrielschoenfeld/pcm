table 50080 Contract
{
    CaptionML = DEU='Vertrag', ENU='Contract';
    DataClassification = CustomerContent;
    DrillDownPageID = "Contract List";
    LookupPageID = "Contract List";
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            CaptionML = ENU = 'Code', DEU = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Title; Text[255])
        {
            CaptionML = ENU = 'Title', DEU = 'Titel';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[2048])
        {
            CaptionML = ENU = 'Description', DEU = 'Beschreibung';
            DataClassification = CustomerContent;
        }
        field(4; Customer; Code[20])
        {
            CaptionML = ENU = 'Customer', DEU = 'Debitor';
            DataClassification = CustomerContent;
            TableRelation = Customer;

            trigger OnValidate()
            var
                CustomerRec: Record Customer;
                VendorRec: Record Vendor;
                VendorCode: Text;
            begin
                if (Rec.Customer <> '') and CustomerRec.Get(Rec.Customer) and CustomerRec.ReadPermission then begin
                    // Solution for prototype - for productive use Record "Contact Business Relation"
                    VendorCode := '8' + Format(CustomerRec."No.").Substring(2);
                    if VendorRec.Get(VendorCode) and VendorRec.ReadPermission then
                        Rec.Vendor := VendorCode
                    else 
                        Rec.Vendor := '';
                end;
            end;
        }
        field(5; Vendor; Code[20])
        {
            CaptionML = ENU = 'Vendor', DEU = 'Kreditor';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(6; Status; Option)
        {
            CaptionML = ENU = 'Status', DEU = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = "Planning","Active","Inactive","Completed";
            OptionCaptionML = ENU = 'Planing,Active,Inactive,Completed', DEU = 'Planung,Aktiv,Inaktiv,Abgeschlossen';
        }
        field(7; "Start date"; Date)
        {
            CaptionML = ENU = 'Start date', DEU = 'Vertragsbeginn';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Vertragsende darf nicht vor dem Vertragsbeginn liegen.')
                end;
            end;
        }
        field(8; "End date"; Date)
        {
            CaptionML = ENU = 'End date', DEU = 'Vertragsende';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Vertragsende darf nicht vor dem Vertragsbeginn liegen.')
                end;
            end;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
