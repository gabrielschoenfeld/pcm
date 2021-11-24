codeunit 50041 DocumentationCode
{
    trigger OnRun()
    begin

    end;

    var
        WFMngt: Codeunit "Workflow Management";
        AppMgmt: Codeunit "Approvals Mgmt.";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        SendDocumentationReq: TextConst ENU = 'Approval Request for Documentation is requested', ENG = 'Approval Request for Documentation is requested';
        AppReqDocumentation: TextConst ENU = 'Approval Request for Documentation is approved', ENG = 'Approval Request for Documentation is approved';
        RejReqDocumentation: TextConst ENU = 'Approval Request for Documentation is rejected', ENG = 'Approval Request for Documentation is rejected';
        DelReqDocumentation: TextConst ENU = 'Approval Request for Documentation is delegated', ENG = 'Approval Request for Documentation is delegated';
        SendForPendAppTxt: TextConst ENU = 'Status of Documentation changed to Pending approval', ENG = 'Status of Documentation changed to Pending approval';
        ReleaseDocumentationTxt: TextConst ENU = 'Release Documentation', ENG = 'Release Documentation';
        ReOpenDocumentationTxt: TextConst ENU = 'ReOpen Documentation', ENG = 'ReOpen Documentation';

    procedure RunWorkflowOnSendDocumentationApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendDocumentationApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::DocumentationInit, 'OnSendDocumentationsforApproval', '', false, false)]
    procedure RunWorkflowOnSendDocumentationApproval(var Doc: Record Documentation)
    begin
        WFMngt.HandleEvent(RunWorkflowOnSendDocumentationApprovalCode(), Doc);
    end;

    procedure RunWorkflowOnApproveDocumentationApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnApproveDocumentationApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', false, false)]
    procedure RunWorkflowOnApproveDocumentationApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveDocumentationApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnRejectDocumentationApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnRejectDocumentationApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    procedure RunWorkflowOnRejectDocumentationApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectDocumentationApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure RunWorkflowOnDelegateDocumentationApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnDelegateDocumentationApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnDelegateApprovalRequest', '', false, false)]
    procedure RunWorkflowOnDelegateDocumentationApproval(var ApprovalEntry: Record "Approval Entry")
    begin
        WFMngt.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateDocumentationApprovalCode(), ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    procedure SetStatusToPendingApprovalCodeDocumentation(): Code[128]
    begin
        exit(UpperCase('SetStatusToPendingApprovalDocumentation'));
    end;

    procedure SetStatusToPendingApprovalDocumentation(var Variant: Variant)
    var
        RecRef: RecordRef;
        Documentation: Record Documentation;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::Documentation:
                begin
                    RecRef.SetTable(Documentation);
                    Documentation.Validate("Status", Documentation."Status"::"Applied");
                    Documentation.Modify();
                    Variant := Documentation;
                end;
        end;
    end;

    procedure ReleaseDocumentationCode(): Code[128]
    begin
        exit(UpperCase('ReleaseDocumentation'));
    end;

    procedure ReleaseDocumentation(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Documentation: Record Documentation;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseDocumentation(Variant);
                end;
            DATABASE::Documentation:
                begin
                    RecRef.SetTable(Documentation);
                    Documentation.Validate("Status", Documentation."Status"::Released);
                    Documentation.Modify();
                    Variant := Documentation;
                end;
        end;
    end;

    procedure ReOpenDocumentationCode(): Code[128]
    begin
        exit(UpperCase('ReOpenDocumentation'));
    end;

    procedure ReOpenDocumentation(var Variant: Variant)
    var
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
        Documentation: Record Documentation;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number() of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReOpenDocumentation(Variant);
                end;
            DATABASE::Documentation:
                begin
                    RecRef.SetTable(Documentation);
                    Documentation.Validate("Status", Documentation."Status"::Applied);
                    Documentation.Modify();
                    Variant := Documentation;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    procedure AddDocumentationEventToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendDocumentationApprovalCode(), Database::Documentation, SendDocumentationReq, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveDocumentationApprovalCode(), Database::"Approval Entry", AppReqDocumentation, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectDocumentationApprovalCode(), Database::"Approval Entry", RejReqDocumentation, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateDocumentationApprovalCode(), Database::"Approval Entry", DelReqDocumentation, 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    procedure AddDocumentationRespToLibrary()
    begin
        WorkflowResponseHandling.AddResponseToLibrary(SetStatusToPendingApprovalCodeDocumentation(), 0, SendForPendAppTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReleaseDocumentationCode(), 0, ReleaseDocumentationTxt, 'GROUP 0');
        WorkflowResponseHandling.AddResponseToLibrary(ReOpenDocumentationCode(), 0, ReOpenDocumentationTxt, 'GROUP 0');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    procedure ExeRespForDocumentation(var ResponseExecuted: Boolean; Variant: Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowResponse: Record "Workflow Response";
    begin
        IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN 
            case WorkflowResponse."Function Name" of
                SetStatusToPendingApprovalCodeDocumentation():
                    begin
                        SetStatusToPendingApprovalDocumentation(Variant);
                        ResponseExecuted := true;
                    end;
                ReleaseDocumentationCode():
                    begin
                        ReleaseDocumentation(Variant);
                        ResponseExecuted := true;
                    end;
                ReOpenDocumentationCode():
                    begin
                        ReOpenDocumentation(Variant);
                        ResponseExecuted := true;
                    end;
            end;
    end;
}