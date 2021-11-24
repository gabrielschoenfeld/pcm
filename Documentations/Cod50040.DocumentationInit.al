codeunit 50040 DocumentationInit
{
    trigger OnRun()
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnSendDocumentationsforApproval(var Doc: Record Documentation);
    begin
    end;

    procedure IsDocumentationEnabled(var Doc: Record Documentation): Boolean
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit DocumentationCode;
    begin
        exit(WFMngt.CanExecuteWorkflow(Doc, WFCode.RunWorkflowOnSendDocumentationApprovalCode()))
    end;

    local procedure CheckWorkflowEnabled(): Boolean
    var
        Doc: Record Documentation;
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', DEU = 'Workflows sind für diesen Record nicht eingerichtet';
    begin
        if not IsDocumentationEnabled(Doc) then
            Error(NoWorkflowEnb);
    end;
}