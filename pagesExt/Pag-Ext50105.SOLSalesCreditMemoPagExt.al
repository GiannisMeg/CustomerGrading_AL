pageextension 50105 SOLSalesCreditMemoPagExt extends "Sales Credit Memo"
{
    layout
    {
        addlast(General)
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
            part(GradeHistory; "History Factbox")
            {
                Caption = 'GradeHistory';
                SubPageLink = "Customer No." = field("Bill-to Customer No.");
            }
        }
    }
}
