pageextension 50102 SOLSalesOrderPagExt extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Grade"; Rec."Grade")
            {
                ApplicationArea = All;
                ToolTip = 'Grade';
            }
            field("Grade Description"; Rec."Grade Description")
            {
                ApplicationArea = All;
                ToolTip = 'Description Grade';
            }
        }
        addfirst(factboxes)
        {

        }
    }
}
