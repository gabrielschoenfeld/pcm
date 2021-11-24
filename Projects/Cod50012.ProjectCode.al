codeunit 50012 ProjectCode
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::Project, 'OnAfterGetCurrRecordEvent', '', true, true)]
    local procedure getCurrent(Rec: Record Project)
    var
        PCMLocMap: Record PCMLocationMapping;
        ContactMap: Record ContactMapping;
        ResourceMap: Record ResourceMapping;
    begin
        PCMLocMap.SetRange("Project Code", Rec.Code);
        ContactMap.SetRange("Project Code", Rec.Code);
        ResourceMap.SetRange("Resource Code", Rec.Code);
    end;
}