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
            part(GradeHistory; "History Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Customer No." = field("Bill-to Customer No.");
            }
        }
    }
}
