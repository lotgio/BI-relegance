codeunit 94841 "BI App Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerDatabase()
    var
        BIAppInstall: Codeunit "BI App Install";
    begin
        BIAppInstall.EnsureWebServicesPublished();
    end;
}
