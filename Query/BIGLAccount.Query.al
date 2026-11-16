query 94835 "BI_GLAccount"
{
    Caption = 'BI G/L Account';
    QueryType = Normal;

    elements
    {
        dataitem(GLAccount; "G/L Account")
        {
            column(GL_Account_Code; "No.") { Caption = 'GL Account Code'; }
            column(GL_Account_Name; Name) { Caption = 'GL Account Name'; }
            column(GL_Account_Type_Code; "Account Type") { Caption = 'GL Account Type Code'; }
            column(GL_Account_Nature; "Income/Balance") { Caption = 'GL Account Nature'; }
        }
    }
}
