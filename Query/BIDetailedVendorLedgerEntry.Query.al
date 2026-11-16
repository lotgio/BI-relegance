query 94834 "BI_DetailedVendorLedgerEntry"
{
    Caption = 'BI Detailed Vendor Ledger Entry';
    QueryType = Normal;

    elements
    {
        dataitem(DetailedVendorLedgerEntry; "Detailed Vendor Ledg. Entry")
        {
            column(VL_Details_Entry_ID; "Entry No.") { Caption = 'VL Details Entry ID'; }
            column(VL_Entry_ID; "Vendor Ledger Entry No.") { Caption = 'VL Entry ID'; }
            column(VL_Details_Entry_Type; "Entry Type") { Caption = 'VL Details Entry Type'; }
            column(VL_Details_Posting_Date_TMP; "Posting Date") { Caption = 'VL Details Posting Date TMP'; }
            column(VL_Details_Reference_Document_Type; "Document Type") { Caption = 'VL Details Reference Document Type'; }
            column(VL_Details_Reference_Document_Number; "Document No.") { Caption = 'VL Details Reference Document Number'; }
            column(VL_Details_Amount; "Amount (LCY)") { Caption = 'VL Details Amount'; }
            column(Vendor_ID; "Vendor No.") { Caption = 'Vendor ID'; }
            column(VL_Details_Entry_Creator_User_ID; "User ID") { Caption = 'VL Details Entry Creator User ID'; }
            column(VL_Entry_Transaction_Number; "Transaction No.") { Caption = 'VL Entry Transaction Number'; }
            column(Reason_Code; "Reason Code") { Caption = 'Reason Code'; }
            column(VL_Details_Debit_Amount; "Debit Amount (LCY)") { Caption = 'VL Details Debit Amount'; }
            column(VL_Details_Credit_Amount; "Credit Amount (LCY)") { Caption = 'VL Details Credit Amount'; }
        }
    }
}
