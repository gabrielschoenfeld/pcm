table 50020 "Payment Plan"
{
    CaptionML = DEU = 'Zahlungsplan', ENU = 'Payment Plan';
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
            begin
                if (Rec.Customer <> '') and CustomerRec.Get(Rec.Customer) and CustomerRec.ReadPermission then begin
                    Rec.Vendor := '';
                end;
            end;
        }
        field(5; Vendor; Code[20])
        {
            CaptionML = ENU = 'Vendor', DEU = 'Kreditor';
            DataClassification = CustomerContent;
            TableRelation = Vendor;

            trigger OnValidate()
            var
                VendorRec: Record Vendor;
            begin
                if (Rec.Vendor <> '') and VendorRec.Get(Rec.Customer) and VendorRec.ReadPermission then begin
                    Rec.Customer := '';
                end;
            end;
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
        field(9; "Blocked"; Boolean)
        {
            CaptionML = ENU = 'Blocked', DEU = 'Gesperrt';
            DataClassification = CustomerContent;
        }
        field(10; "No. Series"; Code[20])
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
                PCMSetup.TestField("Payment Plan Codes");
                NoSeriesMgt.InitSeries(PCMSetup."Payment Plan Codes", xRec."No. Series", 0D, "Code", "No. Series");
            end else begin
                Message('Please complete the Project Cycle Management Setup first!');
                 Page.Run(50000);
            end; 
        end;
    end;

    var
        PCMSetup: Record "Project Cycle Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure InitNewRecord(var NewPaymentPlanLine: Record "Payment Plan"; ProjectCode: Code[20])
    var
        PaymentPlanLine: Record "Payment Plan";
        NoSeries: Record "No. Series";
    begin
        NewPaymentPlanLine.Copy(Rec);
        PaymentPlanLine.SetRange("Project", NewPaymentPlanLine."Project");
        if PCMSetup.Get() then begin
            PCMSetup.TestField("Project Codes");
            if "No. Series" = '' then begin
                if xRec."No. Series" <> '' then
                    "No. Series" := xRec."No. Series"
                else 
                    "No. Series" := NoSeriesMgt.GetNextNo(PCMSetup."Financing Plan Codes", 0D, true);
            end;
            NewPaymentPlanLine."Project" := ProjectCode;
        end else begin
            Message('Please complete the Project Cycle Management Setup first!');
            Page.Run(50000);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDeleteOnAfterSetPaymentPlanLineFilters(var PaymentPlanLine: Record "Payment Plan")
    begin
    end;
}
