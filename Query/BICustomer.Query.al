query 94832 "BI_Customer"
{
    Caption = 'BI Customer';
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Customer_ID; "No.") { Caption = 'Customer ID'; }
            column(Customer_Name; Name) { Caption = 'Customer Name'; }
        }
    }
}
