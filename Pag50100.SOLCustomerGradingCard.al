page 50100 SOLCustomerGradingCard
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'SOLCustomerGradingCard';
    SourceTable = "SOLCustomerGradeSetupTable";
    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("No."; Rec."Grade No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Grade No.';

                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        If not rec.Get() then
            rec.Insert();
    end;
}
