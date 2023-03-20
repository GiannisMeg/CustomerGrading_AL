pageextension 50104 SOLSalesInvoicePagExt extends "Sales Invoice"
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
                ToolTip = 'Grade Description';
            }
        }
        addfirst(factboxes)
        {

        }
    }
}
