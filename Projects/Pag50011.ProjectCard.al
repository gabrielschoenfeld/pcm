page 50011 Project
{
    AdditionalSearchTerms = 'project pcm Project Project projekt Projekt';
    CaptionML = DEU='Projekt', ENU='Project';
    PageType = Card;
    SourceTable = Project;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU = 'General', DEU = 'Allgemein';
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Code eines Projects.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Code', DEU = 'Code';

                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit;
                    end;
                }
                field(Titel; Rec.Title)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Titel eines Projects.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Title', DEU = 'Titel';
                }
                field(Beschreibung; Rec.Description)
                {
                    ToolTip = 'Dieser Wert beschreibt ein Project näher.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Description', DEU = 'Beschreibung';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Status eines Projekts.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                    CaptionML = ENU = 'Status', DEU = 'Status';
                }
            }
            group(Validity)
            {
                CaptionML = DEU = 'Gültigkeit', ENU = 'Validity';
                field("Start date"; Rec."Start date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt den Projektbeginn.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Start date', DEU = 'Projektbeginn';
                }
                field("End date"; Rec."End date")
                {
                    ToolTip = 'Dieser Wert wird benötigt. Er beschribt das Projektende.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'End date', DEU = 'Projektende';
                }
            }
            group(Relation)
            {
                CaptionML = DEU = 'Zuordnung', ENU = 'Relation';
                field("Portfolio"; Rec."Portfolio")
                {
                    ToolTip = 'Dieser Wert bezeichnet das Portfolio zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Portfolio', DEU = 'Portfolio';
                }
                field("Program"; Rec."Program")
                {
                    ToolTip = 'Dieser Wert bezeichnet das Programm zu dem das Projekt gehört.';
                    ApplicationArea = All;
                    CaptionML = ENU = 'Program', DEU = 'Programm';
                }
            }
            group(FinancingPlan)
            {
                CaptionML = ENU = 'Financing Plan', DEU = 'Finanzierungsplan';
                part("Financing Plan ListPart"; "Financing Plan ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
            group(PaymentPlan)
            {
                CaptionML = ENU = 'Payment Plan', DEU = 'Zahlungsplan';
                part("Payment Plan ListPart"; "Payment Plan ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
            group(Documentation)
            {
                CaptionML = ENU = 'Documentation', DEU = 'Dokumentation';
                part("Documentation ListPart"; "Documentation ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
            group(Location)
            {
                CaptionML = ENU = 'Location', DEU = 'Ort';
                part("PCMLocation ListPart"; "PCMLocation Mapping List")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project Code" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
            group(Stakeholder)
            {
                CaptionML = ENU = 'Stakeholder', DEU = 'Stakeholder';
                part("Contact ListPart"; "Contact ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project Code" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
            group(Team)
            {
                CaptionML = ENU = 'Team', DEU = 'Team';
                part("Resource ListPart"; "Resource ListPart")
                {
                    CaptionML = ENU = 'Edit', DEU = 'Bearbeiten';
                    SubPageLink = "Project Code" = FIELD("Code");
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                }
            }
        }
        area(FactBoxes) {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Attachments', DEU = 'Begleitdokument';
                SubPageLink = "Table ID" = CONST(50010),
                              "No." = FIELD("Code");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(AttachmentsGroup)
            {
                CaptionML = DEU = 'Anhänge', ENU = 'Attachements';
                Image = Attachments;
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group("&Project")
            {
                CaptionML = ENU = '&Project';
                Image = Job;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5200),
                                  "No." = FIELD("Code");
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        NewDocumentationLine: Record Documentation;
        NewFinancingPlanLine: Record "Financing Plan";
        NewPaymentPlanLine:  Record "Payment Plan";
    begin
        DocumentationLine.InitNewRecord(NewDocumentationLine, Rec.Code);
        FinancingPlanLine.InitNewRecord(NewFinancingPlanLine, Rec.Code);
        PaymentPlanLine.InitNewRecord(NewPaymentPlanLine, Rec.Code);
    end;

    var DocumentationLine: Record Documentation;
    var FinancingPlanLine: Record "Financing Plan";
    var PaymentPlanLine: Record "Payment Plan";
}