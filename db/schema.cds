namespace CAPWF;

entity Travel {
    key ID          : UUID;
    key travel_id   : Integer not null;
        agency_id   : Integer;
        customer_id : Integer;
        begin_date  : Date;
        end_date    : Date;
        booking_fee : Decimal(15,2);
        total_price : Decimal(15,2);
        currency_code : String(3);
        description : String(50);
        overall_status : String(1);
}