page 50102 SOLGradeSetupPage
{
    ApplicationArea = All;
    Caption = 'SOLGradeSetupPage';
    PageType = Card;
    SourceTable = SOLCustomerGradeSetupTable;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade Nos. field.';

                    trigger OnAssistEdit()
                    begin
                        // if Rec.AssistEdit() then
                        // CurrPage.Update();
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        //This code needs to insert an empty record, when there are no records in the table  
    end;
}
