page 50101 SOLCustomerGradingList
{
    ApplicationArea = All;
    Caption = 'SOLCustomerGradingList';
    PageType = List;
    SourceTable = "SOL Customer Grade";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
    }
}
