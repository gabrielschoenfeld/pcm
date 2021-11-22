page 50042 "Documentation ListPart"
{
    AutoSplitKey = true;
    CaptionML = DEU = 'Zeilen', ENU = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Documentation";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Project"; Rec."Project")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the project code.';
                    Visible = false;
                }
                field("ID"; Rec."ID")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ToolTip = 'Specifies the line number.';
                    Visible = false;
                }
                field("Date"; Rec.Date)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Datum einer Dokumentation.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Date', DEU = 'Datum';
                    Editable = not Rec.Blocked;
                }
                field("Description"; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beinhaltet eine Dokumentation.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                    Editable = not Rec.Blocked;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status einer Dokumentation.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                    Editable = false;
                }
                field("Applicant"; Rec.Applicant)
                {
                    ToolTip = 'Dieser Wert bezeichnet einen Antragsteller.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Applicant', DEU = 'Antragsteller';
                    Editable = not Rec.Blocked;
                }
                field("Approver"; Rec."Approver")
                {
                    ToolTip = 'Dieser Wert bezeichnet den Genehmiger.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Approver', DEU = 'Genehmiger';
                    Editable = not Rec.Blocked;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Page")
            {
                Caption = 'Page';

                action(EditInExcel)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Edit in Excel';
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = IsSaaSExcelAddinEnabled;
                    ToolTip = 'Send the data in the sub page to an Excel file for analysis or editing';
                    AccessByPermission = System "Allow Action Export To Excel" = X;

                    trigger OnAction()
                    var
                        EditinExcel: Codeunit "Edit in Excel";
                    begin
                        EditinExcel.EditPageInExcel(
                            'Project_DocumentationLines',
                            CurrPage.ObjectId(false),
                            StrSubstNo('Project eq ''%1''', Rec."Project"),
                            StrSubstNo(ExcelFileNameTxt, Rec."Project"));
                    end;

                }
            }
        }
    }

    trigger OnOpenPage()
    var
        ServerSetting: Codeunit "Server Setting";
    begin
        OnBeforeSetOpenPage();

        IsSaaSExcelAddinEnabled := ServerSetting.GetIsSaasExcelAddinEnabled();
    end;

    var
        IsSaaSExcelAddinEnabled: Boolean;
        ExcelFileNameTxt: Label 'Project %1 - Documentation Lines', Comment = '%1 = Project Code, ex. PRO-1234567';

    [IntegrationEvent(true, false)]
    local procedure OnBeforeSetOpenPage()
    begin
    end;
}