pageextension 50103 SOLCustomerLedgerEntriesPagExt extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Grade"; Rec.Grade)
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
