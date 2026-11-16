codeunit 94840 "BI App Install"
{
    Subtype = Install;
    Permissions = tabledata "Tenant Web Service" = RIMD;

    trigger OnInstallAppPerDatabase()
    begin
        EnsureWebServicesPublished();
    end;

    procedure EnsureWebServicesPublished()
    var
        AllObjWithCaption: Record AllObjWithCaption;
    begin
        AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Query);
        AllObjWithCaption.SetRange("Object ID", 94831, 94839);

        if not AllObjWithCaption.FindSet() then
            exit;

        repeat
            EnsureQueryWebService(AllObjWithCaption."Object ID", AllObjWithCaption."Object Name");
        until AllObjWithCaption.Next() = 0;
    end;

    local procedure EnsureQueryWebService(ObjectId: Integer; ObjectName: Text[249])
    var
        TenantWebService: Record "Tenant Web Service";
        ServiceName: Text[240];
    begin
        TenantWebService.SetRange("Object Type", TenantWebService."Object Type"::Query);
        TenantWebService.SetRange("Object ID", ObjectId);
        ServiceName := GetServiceName(ObjectId, ObjectName);
        if ServiceName = '' then
            ServiceName := CopyStr(StrSubstNo('BI_Query%1', ObjectId), 1, MaxStrLen(ServiceName));

        if TenantWebService.FindSet() then begin
            repeat
                if (TenantWebService."Service Name" <> ServiceName) or not TenantWebService.Published then begin
                    TenantWebService."Service Name" := ServiceName;
                    TenantWebService.Published := true;
                    TenantWebService.Modify(true);
                end;
            until TenantWebService.Next() = 0;
            exit;
        end;

        TenantWebService.Init();
        TenantWebService."Object Type" := TenantWebService."Object Type"::Query;
        TenantWebService."Object ID" := ObjectId;
        TenantWebService."Service Name" := ServiceName;
        TenantWebService.Published := true;
        TenantWebService.Insert(true);
    end;

    local procedure GetServiceName(ObjectId: Integer; ObjectName: Text[249]): Text[240]
    begin
        case ObjectId of
            94831:
                exit('BI_Vendor');
            94832:
                exit('BI_Customer');
            94833:
                exit('BI_VendorLedgerEntry');
            94834:
                exit('BI_DetailedVendorLedgerEntry');
            94835:
                exit('BI_GLAccount');
            94836:
                exit('BI_AnalyticalAccount');
            94837:
                exit('BI_CostCenter');
            94838:
                exit('BI_GeneralLedgerEntry');
            94839:
                exit('BI_AnalyticalLedgerEntry');
            else
                exit(CopyStr(ObjectName, 1, 240));
        end;
    end;
}
