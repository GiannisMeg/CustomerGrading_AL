pageextension 50100 SOLCustomerCardPagExt extends "Customer Card"
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
        // adding a factbos by placing the factbox name in the addfirst()
        // adding a part woth the name of tha factbox following byt the actual name 
        // SubpageLink to link the box with the page by register the PK keys.
        addfirst(factboxes)
        {
            part(GradeHistory; "History Factbox")
            {
                ApplicationArea = all;
                Caption = 'GradeHist';
                SubPageLink = "Customer No." = field("No.");
            }
        }
    }
}
