table 50102 "SOL History Grade"
{
    Caption = 'SOL History Grade';
    DataClassification = CustomerContent;
    LookupPageId = "Grade History List";
    DrillDownPageId = "Grade History List";




    fields
    {
        field(1; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Document Type"; Text[100])
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No,';
            DataClassification = CustomerContent;
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(5; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            // we added the field customer No but we need to make a relation with the table to get the nummer we need for the field
            TableRelation = Customer;
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            //get the name from the flowfield 
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(7; "DateTime"; DateTime)
        {
            Caption = 'DateTime';
            DataClassification = CustomerContent;
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = CustomerContent;
        }
        field(9; Grade; Code[20])
        {
            Caption = 'Grade';
            DataClassification = CustomerContent;
        }
        field(10; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
            FieldClass = FlowField;
            // get description grade by looking to the No of the grade
            CalcFormula = lookup("SOL Customer Grade".Description where("No." = field(Grade)));
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()

    begin

    end;

    // local procedure je kan aleeen roepen in de object zelf is niet glebal om global te maken moet je procedure noemen.

    procedure Insertintogradehistory(CustomerNo: Code[20]; Date: Date; DocType: Text[100]; DocNo: Code[20]; Grade: Code[20])
    begin
        if rec.FindLast() then
            // IncStr wordt gebruikt voor increment bij 1 of verminderen bij 1
            rec."Entry No." := IncStr(rec."Entry No.")
        else
            // we kunnen value 1 geven met formlat() want code[20] is ook een string format
            rec."Entry No." := Format(1);

        rec."Customer No." := CustomerNo;
        rec."Document Date" := Date;
        rec."Document Type" := DocType;
        rec.Grade := Grade;
        rec.DateTime := CurrentDateTime;
        rec."User ID" := CopyStr(UserId(), 1, MaxStrLen(rec."User ID"));
        rec.Insert();
    end;
}
