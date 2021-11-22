table 50030 "Financing Plan"
{
    CaptionML = DEU='Finanzierungsplan', ENU='Financing Plan';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "ID"; Integer)
        {
            CaptionML = ENU = 'ID', DEU = 'ID';
            DataClassification = CustomerContent;
        }
        field(2; "Code"; Code[20])
        {
            CaptionML = ENU = 'Code', DEU = 'Code';
            DataClassification = CustomerContent;
        }
        field(3; Project; Code[20])
        {
            CaptionML = ENU = 'Project', DEU = 'Projekt';
            DataClassification = CustomerContent;
            TableRelation = Project;
        }
        field(4; Description; Text[2048])
        {
            CaptionML = ENU = 'Description', DEU = 'Beschreibung';
            DataClassification = CustomerContent;
        }
        field(5; Customer; Code[20])
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
        field(6; Vendor; Code[20])
        {
            CaptionML = ENU = 'Vendor', DEU = 'Kreditor';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(7; Status; Option)
        {
            CaptionML = ENU = 'Status', DEU = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = "Planning","Approved","Active","Received","Inactive","Rejected";
            OptionCaptionML = ENU = 'Planning,Approved,Active,Received,Inactive,Rejected', DEU = 'Planung,Genehmigt,Aktiv,Erhalten,Inaktiv,Abgelehnt';
        }
        field(8; "Start Date"; Date)
        {
            CaptionML = ENU = 'Start date', DEU = 'Startdatum';
            DataClassification = CustomerContent;
        }
        field(9; "End Date"; Date)
        {
            CaptionML = ENU = 'End date', DEU = 'Enddatum';
            DataClassification = CustomerContent;
        }
        field(10; "Amount"; Decimal)
        {
            CaptionML = ENU = 'Amount', DEU = 'Betrag';
            DataClassification = CustomerContent;
        }
        field(11; "Blocked"; Boolean)
        {
            CaptionML = ENU = 'Blocked', DEU = 'Gesperrt';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Project", "Code")
        {
            Clustered = true;
        }
        key(FK; "Project") { }
    }
    trigger OnDelete()
    begin
        if ("ID" = 0) or ("Blocked" = true) then begin
            Error('Dieser Datensatz kann nicht gelöscht werden.');
        end;
    end;

    procedure InitNewRecord(var NewFinancingPlanLine: Record "Financing Plan"; ProjectCode: Code[20])
    var
        FinancingPlanLine: Record "Financing Plan";
    begin
        NewFinancingPlanLine.Copy(Rec);
        FinancingPlanLine.SetRange("Project", NewFinancingPlanLine."Project");
        if FinancingPlanLine.FindLast then
            NewFinancingPlanLine."ID" := FinancingPlanLine."ID" + 10
        else
            NewFinancingPlanLine."ID" := 0;
            NewFinancingPlanLine."Project" := ProjectCode;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDeleteOnAfterSetFinancingPlanLineFilters(var FinancingPlanLine: Record "Financing Plan")
    begin
    end;
}
