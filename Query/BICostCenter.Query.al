query 94837 "BI_CostCenter"
{
    Caption = 'BI Cost Center';
    QueryType = Normal;

    elements
    {
        dataitem(CostCenter; "Cost Center")
        {
            column(Cost_Center_Code; Code) { Caption = 'Cost Center Code'; }
            column(Cost_Center_Name; Name) { Caption = 'Cost Center Name'; }
            column(Cost_Center_Responsible; "Responsible Person") { Caption = 'Cost Center Responsible'; }
        }
    }
}
