query 94838 "BI_GeneralLedgerEntry"
{
    Caption = 'BI General Ledger Entry';
    QueryType = Normal;

    elements
    {
        dataitem(GLEntry; "G/L Entry")
        {
            column(GL_Entry_ID; "Entry No.") { Caption = 'GL Entry ID'; }
            column(GL_Account_Code; "G/L Account No.") { Caption = 'GL Account Code'; }
            column(GL_Posting_Date_TMP; "Posting Date") { Caption = 'GL Posting Date TMP'; }
            column(GL_Document_Type; "Document Type") { Caption = 'GL Document Type'; }
            column(GL_Document_Number; "Document No.") { Caption = 'GL Document Number'; }
            column(GL_Entry_Description; Description) { Caption = 'GL Entry Description'; }
            column(Balancing_Account_Code; "Bal. Account No.") { Caption = 'Balancing Account Code'; }
            column(GL_Entry_Amount; Amount) { Caption = 'GL Entry Amount'; }
            column(GL_Entry_Creator_User_ID; "User ID") { Caption = 'GL Entry Creator User ID'; }
            column(GL_System_Created_Entry_Flag; "System-Created Entry") { Caption = 'GL System-Created Entry Flag'; }
            column(GL_Entry_Quantity; Quantity) { Caption = 'GL Entry Quantity'; }
            column(GL_Entry_VAT_Amount; "VAT Amount") { Caption = 'GL Entry VAT Amount'; }
            column(GL_Entry_Transaction_Number; "Transaction No.") { Caption = 'GL Entry Transaction Number'; }
            column(GL_Debit_Amount; "Debit Amount") { Caption = 'Debit Amount'; }
            column(GL_Credit_Amount; "Credit Amount") { Caption = 'Credit Amount'; }
            column(GL_Document_Date; "Document Date") { Caption = 'GL Document Date'; }
            column(External_Document_Number; "External Document No.") { Caption = 'External Document Number'; }
            column(Source_Type; "Source Type") { Caption = 'Source Type'; }
            column(Source_No; "Source No.") { Caption = 'Source No.'; }
        }
    }
}
