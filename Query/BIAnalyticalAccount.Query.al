query 94836 "BI_AnalyticalAccount"
{
    Caption = 'BI Analytical Account';
    QueryType = Normal;

    elements
    {
        dataitem(CostType; "Cost Type")
        {
            column(AL_Account_Code; "No.") { Caption = 'AL Account Code'; }
            column(AL_Account_Name; Name) { Caption = 'AL Account Name'; }
            column(AL_Account_Search_Name; "Search Name") { Caption = 'AL Account Search Name'; }
            column(AL_Account_Type_Code; Type) { Caption = 'AL Account Type Code'; }
            column(AL_Account_Default_Cost_Center_Code; "Cost Center Code") { Caption = 'AL Account Default Cost Center Code'; }
            column(AL_Account_Nature; "TZSI Income/Balance") { Caption = 'AL Account Nature'; }
        }
    }
}
