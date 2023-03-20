pageextension 50101 SOLCustomerListPagExt extends "Customer List"
{

    layout
    {
        addlast(Control1)
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
        { }
    }

}
