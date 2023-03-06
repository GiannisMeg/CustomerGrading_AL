table 50100 "SOL Customer Grade"
{
    Caption = 'SOL Customer Grade';
    DataClassification = ToBeClassified;
    LookupPageId = "SOLCustomerGradingList";
    DrillDownPageId = "SOLCustomerGradingList";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                GradeSetup: Record "SOLCustomerGradeSetupTable";
                NoSeriesManagement: Codeunit NoSeriesManagement;
            begin
                //user change the No. - validate if exists
                if "No." = xRec."No." then
                    exit;
                // validate that the number series that is used to assign the number allows manual numbers
                GradeSetup.Get();
                NoSeriesManagement.TestManual(GradeSetup."Grade No.");
                // set No. Series to blank
                "No. Series" := '';
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description)
        {
        }
        fieldgroup(Brick; "No.", Description)
        {
        }
    }

    //this code executed when a record gets inserted
    trigger OnInsert()
    var
        GradeSetup: Record "SOLCustomerGradeSetupTable";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        //if there is no value in the No.field, assign the next value from the number series that is specified in hte Grade Nos. number in the Grade table.
        if rec."No." = '' then begin
            GradeSetup.Get();
            GradeSetup.TestField("Grade No.");
            NoSeriesManagement.InitSeries(GradeSetup."Grade No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    // in this function enter the code that makes sure ther is a value in the Grade Nos. field in the Grade Setup Table
    procedure AssistEdit(): Boolean
    var
        Grade: Record "SOL Customer Grade";
        GradeSetup: Record "SOLCustomerGradeSetupTable";
        NoSeriesManagements: Codeunit NoSeriesManagement;

    begin
        Grade := Rec;
        GradeSetup.Get();
        // makes sure that is an value in the Grade Nos.
        GradeSetup.TestField("Grade No.");
        // if returns True ; call SetSeries for the COD to set the No.field and return TRUE;
        if NoSeriesManagements.SelectSeries(GradeSetup."Grade No.", xRec."No. Series", Grade."No. Series") then begin
            NoSeriesManagements.SetSeries(Grade."No.");
            Rec := Grade;
            exit(true);
        end;
    end;

}
