page 50104 "History Factbox"
{
    ApplicationArea = All;
    Caption = 'Factbox Page';
    PageType = ListPart;
    SourceTable = "SOL History Grade";
    Editable = false;
    DataCaptionFields = "Customer No.", "Customer Name";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Name';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer No.';
                }
                field("Datetime"; Rec.DateTime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Datetime';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Date';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Type';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No.';
                }
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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'User ID';
                }

            }

            // part("Customer No.")
            // {

            // }
            // part("Grade Description")
            // {

            // }

        }
    }
}
