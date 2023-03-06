page 50101 SOLCustomerGradingList
{
    ApplicationArea = All;
    Caption = 'SOLCustomerGradingList';
    PageType = List;
    SourceTable = "SOL Customer Grade";
    UsageCategory = None;
    Editable = false;
    CardPageId = "AAD Application Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(RecordLinks; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
}
