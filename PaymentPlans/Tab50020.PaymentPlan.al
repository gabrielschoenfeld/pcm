table 50020 "Payment Plan"
{
    CaptionML = DEU='Vertrag', ENU='Payment Plan';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            CaptionML = ENU = 'Code', DEU = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Project; Code[20])
        {
            CaptionML = ENU = 'Project', DEU = 'Projekt';
            DataClassification = CustomerContent;
//            TableRelation = Project;
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
            OptionCaptionML = ENU = 'Open,Completed', DEU = 'Offen,Abgeschlossen';
        }
        field(7; "Date"; Date)
        {
            CaptionML = ENU = 'Date', DEU = 'Datum';
            DataClassification = CustomerContent;
        }
        field(8; "Amount"; Decimal)
        {
            CaptionML = ENU = 'Amount', DEU = 'Betrag';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(FK; "Project") { }
    }
}
