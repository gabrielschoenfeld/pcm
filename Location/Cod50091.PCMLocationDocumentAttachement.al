codeunit 50091 "Location Document Attachement"
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        PCMLocation: Record "PCMLocation";
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"PCMLocation":
                begin
                    RecRef.Open(DATABASE::"PCMLocation");
                    if PCMLocation.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(PCMLocation);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
    begin
        case RecRef.Number of
            DATABASE::"PCMLocation":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;

}
