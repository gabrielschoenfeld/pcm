page 50010 "Project List"
{
    AdditionalSearchTerms = 'project pcm Project Project projekt Projekt';
    ApplicationArea = All;
    CaptionML = DEU='Projekte', ENU='Projects';
    CardPageID = "Project";
    PageType = List;
    SourceTable = Project;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert beschribt den Status eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser beschribt den Projektbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Projektbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert beschribt das Projektende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Projektende';
                }
                field(Portfolio; Rec.Portfolio)
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                }
                field(Program; Rec.Program)
                {
                    ToolTip = 'Dieser Wert bezeichnet das Program zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Program', DEU = 'Programm';
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Dimensions)
            {
                Caption = 'Dimensions';
                Image = Dimensions;
                action("Dimensions-Single")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions-Single';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(50010),
                                      "No." = FIELD("Code");
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                }
                action("Dimensions-&Multiple")
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions-&Multiple';
                    Image = DimensionSets;
                    ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                    trigger OnAction()
                    var
                        Project: Record Project;
                        DefaultDimMultiple: Page "Default Dimensions-Multiple";
                    begin
                        CurrPage.SetSelectionFilter(Project);
                        DefaultDimMultiple.SetMultiRecord(Project, Rec.FieldNo("Code"));
                        DefaultDimMultiple.RunModal;
                    end;
                }
            }
        }
    }
    trigger OnOpenPage() 
    var
        PCMSetup: Record "Project Cycle Management Setup";
        Project: Record Project;
    begin
        if not PCMSetup.Get() then begin
            PCMSetup."Portfolio Codes" := 'PORTFOLIO';
            PCMSetup."Program Codes" := 'PORTFOLIO';
            PCMSetup."Project Codes" := 'PORTFOLIO';
            PCMSetup."Location Codes" := 'ORT';
            PCMSetup."Financing Plan Codes" := 'FP';
            PCMSetup."Payment Plan Codes" := 'ZP';
            PCMSetup.Insert();

            Project.Code := 'PRO-0000023';
            Project.Title := 'Humanitarian Aid Project';
            Project.Description := 'This project is concerned with humanitarian';
            Project."Start date" := DMY2DATE(1,11,2021);
            Project."End date" := DMY2DATE(30,11,2021);
            Project.Insert();
        end;
    end;
}