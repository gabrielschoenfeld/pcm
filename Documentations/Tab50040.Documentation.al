table 50040 Documentation
{
    CaptionML = DEU = 'Dokumentation', ENU = 'Documentation';
    DataClassification = CustomerContent;
    DrillDownPageID = "Documentation List";
    LookupPageID = "Documentation List";

    fields
    {
        field(1; "ID"; BigInteger)
        {
            CaptionML = ENU = 'ID', DEU = 'ID';
            DataClassification = ToBeClassified;
            NotBlank = true;

            trigger OnValidate()
            var 
                LastRec: Record Documentation;
            begin
                if (ID <> xRec.ID) then begin
                    if LastRec.FindLast() then
                        ID := LastRec.ID + 1
                    else
                        ID := 0;
                end;
            end;
        }
        field(2; Project; Code[20])
        {
            CaptionML = DEU = 'Projekt', ENU = 'Project';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = "Project";

            trigger OnValidate()
            begin
                if ("Project" <> xRec."Project") or ("Project" = '') then begin
                    Error('Die Dokumentation konnte keinem Projekt zugeordnet werden.');
                end;
            end;
            
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
            OptionMembers = "Planned","Applied","Approved","Disapproved";
            OptionCaptionML = ENU = 'Planned,Applied,Approved,Disapproved', DEU = 'Geplant,Beantragt,Genehmigt,Abgelehnt';
        }
        field(5; "Applicant"; Code[50])
        {
            CaptionML = ENU = 'Applicant', DEU = 'Antragsteller';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
            Editable = false;
        }
        field(6; "Approver"; Code[50])
        {
            CaptionML = ENU = 'Approver', DEU = 'Genehmiger';
            DataClassification = CustomerContent;
            TableRelation = "User Setup";
            Editable = false;
        }
        field(7; "Date"; Date)
        {
            CaptionML = ENU = 'Date', DEU = 'Datum';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(8; "Blocked"; Boolean)
        {
            CaptionML = ENU = 'Blocked', DEU = 'Gesperrt';
            NotBlank = true;
            
            trigger OnValidate()
            begin
                if (Rec.Blocked <> true) then
                    Rec.Blocked := false;
            end;
        }
    }
    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
        key (SORT; "Date") {}
    }
}
