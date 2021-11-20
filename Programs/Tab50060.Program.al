table 50060 Program
{
    CaptionML = DEU='Programm', ENU='Program';
    DataClassification = CustomerContent;
    DrillDownPageID = "Program List";
    LookupPageID = "Program List";
    
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
                    NoSeriesMgt.TestManual(PCMSetup."Program Codes");
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
            OptionMembers = "Planning","Active","Inactive","Completed";
            OptionCaptionML = ENU = 'Planing,Active,Inactive,Completed', DEU = 'Planung,Aktiv,Inaktiv,Abgeschlossen';
        }
        field(5; "Start date"; Date)
        {
            CaptionML = ENU = 'Start date', DEU = 'Programmbeginn';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Programmende darf nicht vor dem Programmbeginn liegen.')
                end;
            end;
        }
        field(6; "End date"; Date)
        {
            CaptionML = ENU = 'End date', DEU = 'Programmende';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if (Rec."Start date" <> 0D) and (Rec."End date" <> 0D) then begin
                    if (Rec."Start date" > Rec."End date") then
                        Error('Das Programmende darf nicht vor dem Programmbeginn liegen.')
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
        DimMgt.DeleteDefaultDim(DATABASE::Program, "Code");
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
                PCMSetup.TestField("Program Codes");
                NoSeriesMgt.InitSeries(PCMSetup."Program Codes", xRec."No. Series", 0D, "Code", "No. Series");
            end;

        DimMgt.UpdateDefaultDim(
          DATABASE::Program, "Code",
          "Global Dimension 1 Code", "Global Dimension 2 Code");
    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(DATABASE::Program, xRec."Code", "Code");
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

        if PCMSetup.Get() then
            PCMSetup.TestField("Program Codes");
            if NoSeriesMgt.SelectSeries(PCMSetup."Program Codes", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("Code");
                exit(true);
            end
        else
            Message('Please complete the Project Cycle Management Setup first!');
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);

        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        if not IsTemporary then begin
            DimMgt.SaveDefaultDim(DATABASE::Program, "Code", FieldNumber, ShortcutDimCode);
            Modify;
        end;

        OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShortcutDimCode(var Program: Record Program; var xProgram: Record Program; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var Program: Record Program; xProgram: Record Program; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var Program: Record Program; var xProgram: Record Program; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateShortcutDimCode(var Program: Record Program; var xProgram: Record Program; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
    end;
}
