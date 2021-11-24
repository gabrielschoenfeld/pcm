table 50030 "Financing Plan"
{
    CaptionML = DEU='Finanzierungsplan', ENU='Financing Plan';
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
            TableRelation = Project;
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
            OptionMembers = "Planning","Approved","Active","Received","Inactive","Rejected";
            OptionCaptionML = ENU = 'Planning,Approved,Active,Received,Inactive,Rejected', DEU = 'Planung,Genehmigt,Aktiv,Erhalten,Inaktiv,Abgelehnt';
        }
        field(7; "Start Date"; Date)
        {
            CaptionML = ENU = 'Start date', DEU = 'Startdatum';
            DataClassification = CustomerContent;
        }
        field(8; "End Date"; Date)
        {
            CaptionML = ENU = 'End date', DEU = 'Enddatum';
            DataClassification = CustomerContent;
        }
        field(9; "Amount"; Decimal)
        {
            CaptionML = ENU = 'Amount', DEU = 'Betrag';
            DataClassification = CustomerContent;
        }
        field(10; "Blocked"; Boolean)
        {
            CaptionML = ENU = 'Blocked', DEU = 'Gesperrt';
            DataClassification = CustomerContent;
        }
        field(11; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
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
        if ("Code" = '') or ("Blocked" = true) then begin
            Error('Dieser Datensatz kann nicht gelöscht werden.');
        end;
    end;

    trigger OnInsert()
    begin
        if "Code" = '' then begin
            if PCMSetup.Get() then begin
                PCMSetup.Get();
                PCMSetup.TestField("Financing Plan Codes");
                NoSeriesMgt.InitSeries(PCMSetup."Financing Plan Codes", xRec."No. Series", 0D, "Code", "No. Series");
            end else begin
                Message('Please complete the Project Cycle Management Setup first!');
            end; 
        end;
    end;

    var
        PCMSetup: Record "Project Cycle Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure InitNewRecord(var NewFinancingPlanLine: Record "Financing Plan"; ProjectCode: Code[20])
    var
        FinancingPlanLine: Record "Financing Plan";
        NoSeries: Record "No. Series";
    begin
        NewFinancingPlanLine.Copy(Rec);
        FinancingPlanLine.SetRange("Project", NewFinancingPlanLine."Project");
        if PCMSetup.Get() then begin
            PCMSetup.TestField("Project Codes");
            if "No. Series" = '' then begin
                if xRec."No. Series" <> '' then
                    "No. Series" := xRec."No. Series"
                else 
                    "No. Series" := NoSeriesMgt.GetNextNo(PCMSetup."Financing Plan Codes", 0D, true);
            end;
            NewFinancingPlanLine."Project" := ProjectCode;
        end else begin
            Message('Please complete the Project Cycle Management Setup first!');
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDeleteOnAfterSetFinancingPlanLineFilters(var FinancingPlanLine: Record "Financing Plan")
    begin
    end;
}
