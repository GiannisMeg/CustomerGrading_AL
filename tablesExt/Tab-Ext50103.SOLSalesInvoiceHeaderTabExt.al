tableextension 50103 SOLSalesInvoiceHeaderTabExt extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Grade"; Code[20])
        {
            Caption = 'Grade';
            DataClassification = CustomerContent;
            TableRelation = "SOL Customer Grade";
            NotBlank = true;


            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // use the calcfield funtion to update the Desription Flowfield
                CalcFields("Grade Description");
            end;

        }
        field(50101; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description.';
            TableRelation = "SOL Customer Grade";
            Editable = false;
            FieldClass = FlowField;
            // add the description and Grade so the user can see both
            //When a Grade No. is updated the Grade Description needs to upadate automatically too.
            CalcFormula = lookup("SOL Customer Grade".Description where("No." = field("Grade")));


        }
    }
}