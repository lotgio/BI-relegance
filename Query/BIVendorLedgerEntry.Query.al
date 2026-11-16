query 94833 "BI_VendorLedgerEntry"
{
    Caption = 'BI Vendor Ledger Entry';
    QueryType = Normal;

    elements
    {
        dataitem(VendorLedgerEntry; "Vendor Ledger Entry")
        {
            column(VL_Entry_ID; "Entry No.") { Caption = 'VL Entry ID'; }
            column(Vendor_ID; "Vendor No.") { Caption = 'Vendor ID'; }
            column(VL_Posting_Date_TMP; "Posting Date") { Caption = 'VL Posting Date TMP'; }
            column(Reference_Document_Type; "Document Type") { Caption = 'Reference Document Type'; }
            column(Reference_Document_Number; "Document No.") { Caption = 'Reference Document Number'; }
            column(VL_Entry_Description; Description) { Caption = 'VL Entry Description'; }
            column(VL_Entry_Creator_User_ID; "User ID") { Caption = 'VL Entry Creator User ID'; }
            column(Open_Flag; Open) { Caption = 'Open Flag'; }
            column(VL_Due_Date_TMP; "Due Date") { Caption = 'VL Due Date TMP'; }
            column(Closed_By_VL_Entry_ID; "Closed by Entry No.") { Caption = 'Closed By VL Entry ID'; }
            column(VL_Closed_at_Date_TMP; "Closed at Date") { Caption = 'VL Closed at Date TMP'; }
            column(VL_Entry_Transaction_Number; "Transaction No.") { Caption = 'VL Entry Transaction Number'; }
            column(Closed_By_Amount_LCY; "Closed by Amount (LCY)") { Caption = 'Closed by Amount (LCY)'; }
            column(Reference_Document_Date_TMP; "Document Date") { Caption = 'Reference Document Date TMP'; }
            column(Vendor_Document_Number; "External Document No.") { Caption = 'Vendor Document Number'; }
        }
    }
}
