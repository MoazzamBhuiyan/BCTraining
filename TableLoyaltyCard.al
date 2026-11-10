table 89100 "Loyalty Card"
{
    Caption = 'Loyalty Card';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Card No."; Code[20])
        {
            Caption = 'Card No.';
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer."No.";
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }

        field(10; TotalSales; decimal)
        {
            Caption = 'Total Sales';
            FieldClass = FlowField;
            CalcFormula = Sum("Ledger Entry"."Amount" where("Customer No." = field("Customer No.")));
        }

        field(4; "Issue Date"; Date)
        {
            Caption = 'Issue Date';
        }

        field(5; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
        field(6; Points; Integer)
        {
            Caption = 'Points';
            MinValue = 0;
        }
        field(7; Tier; Option)
        {
            Caption = 'Tier';
            OptionMembers = Bronze,Silver,Gold,Platinum;
            OptionCaption = 'Bronze,Silver,Gold,Platinum';
        }
        field(8; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(9; Status; Enum "Loyalty Card Status")
        {
            Caption = 'Status';
        }
    }

    keys
    {
        key(PK; "Card No.")
        {
            Clustered = true;
        }
        key(Customer; "Customer No.") { }
    }

    trigger OnInsert()
    begin
        if "Issue Date" = 0D then
            "Issue Date" := Today;
    end;
}
