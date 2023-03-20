codeunit 50100 "SOLGradeMngt"
{
    TableNo = "SOL History Grade";
    Permissions = Tabledata "Sales Invoice Header" = Rm,
                  Tabledata "Sales Cr.Memo Header" = Rm,
                  Tabledata "Cust. Ledger Entry" = Rm;




    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Grade', false, false)]
    local procedure AssignGradeToCustomer(CurrFieldNo: Integer; var Rec: Record Customer; var xRec: Record Customer)
    var
        Gradehistory: Record "SOL History Grade";
    begin
        Gradehistory.Insertintogradehistory(Rec."No.", Today(), 'Customer', Rec."No.", Rec.Grade);
    end;



    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignToSalesHeader(var Rec: Record "Sales Header")
    var
        Gradehistory: Record "SOL History Grade";
        Customer: Record Customer;
    begin
        if Rec."Bill-to Customer No." = '' then
            exit;
        Clear(Customer);

        if not Customer.Get(Rec."Bill-to Customer No.") then
            exit;

        if Customer.Grade = '' then
            exit;

        Rec.Grade := Customer.Grade;

        Gradehistory.Insertintogradehistory(Rec."Bill-to Customer No.", Rec."Posting Date", 'Sales' + Format(Rec."Document Type"), Rec."No.", Rec.Grade);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignToCustomerLedger(var Rec: Record "Cust. Ledger Entry")
    var
        Gradehistory: Record "SOL History Grade";
        Customer: Record Customer;
    begin

        if Rec."Document No." = '' then
            exit;

        Clear(Customer);
        If not Customer.Get(Rec."Customer No.") then
            exit;

        if Customer.Grade = '' then
            exit;

        Rec.Grade := Customer.Grade;
        if rec.Modify() then
            Gradehistory.Insertintogradehistory(Rec."Customer No.", Rec."Posting Date", 'Customer Ledger Entry', Format(Rec."Entry No."), Rec.Grade);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure AssignGradeDuringSalesPost(CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; RetRcpHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesShptHdrNo: Code[20];
         var CustLedgerEntry: Record "Cust. ledger Entry";
         var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
         var SalesHeader: Record "Sales Header"; Whsereceiv: Boolean; WhseShip: Boolean)
    var
        Gradehistory: Record "SOL History Grade";
        Customer: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin

        if Salesheader."Bill-To Customer No." = '' then
            exit;

        Clear(Customer);
        if not Customer.Get(Salesheader."Bill-To Customer No.") then
            exit;

        if Customer.Grade = '' then
            exit;

        if SalesInvHdrNo <> '' then begin
            Clear(SalesInvoiceHeader);
            SalesInvoiceHeader.Get(Salesinvhdrno);
            SalesInvoiceHeader.Grade := Customer.Grade;
            SalesInvoiceHeader.Modify();

            Gradehistory.Insertintogradehistory(SalesInvoiceHeader."Bill-To Customer No.", SalesInvoiceHeader."Posting Date", 'Posted Sales Invoice', SalesInvoiceHeader."No.", SalesInvoiceHeader.Grade);
        end;

        If SalesCrMemoHdrNo <> '' Then Begin
            Clear(SalesCrMemoHeader);
            SalesCrMemoHeader.Get(Salescrmemohdrno);
            SalesCrMemoHeader.Grade := Customer.Grade;
            SalesCrMemoHeader.Modify();



            Gradehistory.Insertintogradehistory(SalesCrMemoHeader."Bill-To Customer No.",
            SalesCrMemoHeader."Posting Date",
            'Posted Sales Cr. Memo',
            SalesCrMemoHeader."No.",
            SalesCrMemoHeader.Grade);
        end;

    end;



}
