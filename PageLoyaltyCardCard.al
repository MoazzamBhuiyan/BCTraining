page 89100 "Loyalty Card Card"
{
    Caption = 'Loyalty Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Loyalty Card";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Card No."; Rec."Card No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group(Loyalty)
            {
                Caption = 'Loyalty';

                field(Tier; Rec.Tier)
                {
                    ApplicationArea = All;
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = All;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
