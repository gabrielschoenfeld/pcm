table 50010 Project
{
    CaptionML = DEU='Projekt', ENU='Project';
    DataClassification = CustomerContent;
    DrillDownPageID = "Project List";
    LookupPageID = "Project List";
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            CaptionML = DEU = 'Code', ENU = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
            
            trigger OnValidate()
            begin
                if "Code" <> xRec."Code" then begin
                    if PCMSetup.Get() then begin
                    NoSeriesMgt.TestManual(PCMSetup."Project Codes");
                    "No. Series" := '';
                    end;
                end;
            end;
        }
        field(2; Title; Text[255])
        {
            CaptionML = DEU = 'Titel', ENU = 'Title';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(3; Description; Text[2048])
        {
            CaptionML = DEU = 'Beschreibung', ENU = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; Status; Option)
        {
            CaptionML = ENU = 'Status', DEU = 'Status';
            DataClassification = CustomerContent;
            OptionMembers = "Idea","Planning","Application (internal)","Pre-approval","Approval (internal)","Application (external)","Implementation","Completion","Review (internal)","Review (external)","Rejected","Completed","Archived";
            OptionCaptionML = ENU = 'Idea,Planning,Application (internal),Pre-approval,Approval (internal),Application (external),Implementation,Completion,Review (internal),Review (external),Rejected,Completed,Archived', DEU = 'Idee,Planung,Beantragung (intern),Vorgenehmigung,Genehmigung (intern),Beantragung (extern),Durchführung,Fertigstellung,Prüfung (intern),Prüfung (extern),Abgelehnt,Abgeschlossen,Archiviert';
        }
        field(5; "Start date"; Date)
        {
            CaptionML = ENU = 'Start date', DEU = 'Projektbeginn';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Projektende darf nicht vor dem Projektbeginn liegen.')
                end;
            end;
        }
        field(6; "End date"; Date)
        {
            CaptionML = ENU = 'End date', DEU = 'Projektende';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Projektende darf nicht vor dem Projektbeginn liegen.')
                end;
            end;
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; "Portfolio"; Code[20])
        {
            CaptionML = DEU = 'Portfolio', ENU = 'Portfolio';
            DataClassification = CustomerContent;
            TableRelation = "Portfolio";
        }
        field(11; "Program"; Code[20])
        {
            CaptionML = DEU = 'Programm', ENU = 'Program';
            DataClassification = CustomerContent;
            TableRelation = "Program";
        }
        field(12; "ResourceGroup"; Code[20])
        {
            CaptionML = DEU = 'Abteilung', ENU = 'Department';
            DataClassification = CustomerContent;
            TableRelation = "Resource Group";
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        DimMgt.DeleteDefaultDim(DATABASE::Project, "Code");
    end;

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnInsert(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        if PCMSetup.Get() then
            if "Code" = '' then begin
                PCMSetup.TestField("Project Codes");
                NoSeriesMgt.InitSeries(PCMSetup."Project Codes", xRec."No. Series", 0D, "Code", "No. Series");
            end;

        DimMgt.UpdateDefaultDim(
          DATABASE::Project, "Code",
          "Global Dimension 1 Code", "Global Dimension 2 Code");
    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(DATABASE::Project, xRec."Code", "Code");
    end;

    var
        PCMSetup: Record "Project Cycle Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;

    procedure AssistEdit() Result: Boolean
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, xRec, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if PCMSetup.Get() then begin
            PCMSetup.TestField("Project Codes");
            if NoSeriesMgt.SelectSeries(PCMSetup."Project Codes", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("Code");
                exit(true);
            end;
        end else begin
            Message('Please complete the Project Cycle Management Setup first!');
            Page.Run(50000);
        end;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);

        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        if not IsTemporary then begin
            DimMgt.SaveDefaultDim(DATABASE::Project, "Code", FieldNumber, ShortcutDimCode);
            Modify;
        end;

        OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShortcutDimCode(var Project: Record Project; var xProject: Record Project; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var Project: Record Project; xProject: Record Project; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var Project: Record Project; var xProject: Record Project; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateShortcutDimCode(var Project: Record Project; var xProject: Record Project; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
    end;
}
