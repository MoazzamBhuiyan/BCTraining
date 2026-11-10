page 89101 "Loyalty Card List"
{
    Caption = 'Loyalty Cards';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Loyalty Card";
    CardPageId = "Loyalty Card Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
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
                field(Tier; Rec.Tier)
                {
                    ApplicationArea = All;
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateSampleCardsAction)
            {
                Caption = 'Create Sample Cards';
                ToolTip = 'Adds sample loyalty cards, linked to existing customers when available.';
                ApplicationArea = All;
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CreateSampleCards();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    local procedure CreateSampleCards()
    var
        LoyaltyCard: Record "Loyalty Card";
        Customer: Record Customer;
        i: Integer;
        CardNo: Code[20];
        Created: Integer;
    begin
        Customer.SetLoadFields("No.");
        if not Customer.FindSet() then;

        for i := 1 to 5 do begin
            CardNo := CopyStr('LC' + Format(1000 + i), 1, MaxStrLen(CardNo));
            if not LoyaltyCard.Get(CardNo) then begin
                LoyaltyCard.Init();
                LoyaltyCard."Card No." := CardNo;
                if Customer."No." <> '' then begin
                    LoyaltyCard."Customer No." := Customer."No.";
                    if Customer.Next() = 0 then
                        Customer.Init();
                end;
                LoyaltyCard."Issue Date" := Today();
                LoyaltyCard."Expiry Date" := CalcDate('<+1Y>', Today());
                LoyaltyCard.Points := i * 250;
                LoyaltyCard.Tier := (i - 1) mod 4;
                LoyaltyCard.Status := LoyaltyCard.Status::Active;
                LoyaltyCard.Insert(true);
                Created += 1;
            end;
        end;

        Message('%1 sample loyalty card(s) created.', Created);
    end;
}
