table 50101 SOLCustomerGradeSetupTable
{
    Caption = 'SOLCustomerGradeSetupTable';
    DataClassification = SystemMetadata;


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Grade No."; Code[20])
        {
            Caption = 'Grade No.';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }

    }
    keys
    {
        key(PK; "Primary Key", "Grade No.")
        {
            Clustered = true;
        }
    }
}
