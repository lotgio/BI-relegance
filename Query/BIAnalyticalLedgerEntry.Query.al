query 94839 "BI_AnalyticalLedgerEntry"
{
    Caption = 'BI Analytical Ledger Entry';
    QueryType = Normal;

    elements
    {
        dataitem(CostEntry; "Cost Entry")
        {
            column(AL_Entry_ID; "Entry No.") { Caption = 'AL Entry ID'; }
            column(AL_Account_Code; "Cost Type No.") { Caption = 'AL Account Code'; }
            column(AL_Posting_Date_TMP; "Posting Date") { Caption = 'AL Posting Date TMP'; }
            column(Reference_Document_Number; "Document No.") { Caption = 'Reference Document Number'; }
            column(AL_Entry_Description; Description) { Caption = 'AL Entry Description'; }
            column(AL_Entry_Amount; Amount) { Caption = 'AL Entry Amount'; }
            column(AL_Debit_Amount; "Debit Amount") { Caption = 'AL Debit Amount'; }
            column(AL_Credit_Amount; "Credit Amount") { Caption = 'AL Credit Amount'; }
            column(Cost_Center_Code; "Cost Center Code") { Caption = 'Cost Center Code'; }
            column(GL_Entry_ID; "G/L Entry No.") { Caption = 'GL Entry ID'; }
            column(AL_System_Created_Entry_Flag; "System-Created Entry") { Caption = 'AL System-Created Entry Flag'; }
            column(AL_Entry_Creator_User_ID; "User ID") { Caption = 'AL Entry Creator User ID'; }
        }
    }
}
