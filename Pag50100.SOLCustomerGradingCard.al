page 50100 SOLCustomerGradingCard
{
    ApplicationArea = All;
    Caption = 'SOLCustomerGradingCard';
    PageType = Card;
    SourceTable = "SOL Customer Grade";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
    }
}
