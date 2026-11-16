query 94831 "BI_Vendor"
{
    Caption = 'BI Vendor';
    QueryType = Normal;

    elements
    {
        dataitem(Vendor; Vendor)
        {
            column(Vendor_ID; "No.") { Caption = 'Vendor ID'; }
            column(Vendor_Name; Name) { Caption = 'Vendor Name'; }
            column(Vendor_Main_Address; Address) { Caption = 'Vendor Main Address'; }
            column(Vendor_Main_Address_City; City) { Caption = 'Vendor Main Address City'; }
            column(Vendor_Main_Address_County; County) { Caption = 'Vendor Main Address County'; }
            column(Vendor_Main_Address_Postal_Code; "Post Code") { Caption = 'Vendor Main Address Postal Code'; }
            column(Blocked_Vendor_Status; Blocked) { Caption = 'Blocked Vendor Status'; }
            column(Vendor_VAT_Number; "VAT Registration No.") { Caption = 'Vendor VAT Number'; }
            column(Vendor_Fiscal_Code; "Fiscal Code") { Caption = 'Vendor Fiscal Code'; }
        }
    }
}
