using CAPWFService as service from '../../srv/service';
annotate service.Travel with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'travel_id',
                Value : travel_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'agency_id',
                Value : agency_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customer_id',
                Value : customer_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'begin_date',
                Value : begin_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'end_date',
                Value : end_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'booking_fee',
                Value : booking_fee,
            },
            {
                $Type : 'UI.DataField',
                Label : 'total_price',
                Value : total_price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'overall_status',
                Value : overall_status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>TravelId}',
            Value : travel_id,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>AgencyId}',
            Value : agency_id,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>CustomerId}',
            Value : customer_id,
        },
        {
            $Type : 'UI.DataField',
            Value : overall_status,
            Label : '{i18n>OverallStatus}',
        },
        {
            $Type : 'UI.DataField',
            Value : booking_fee,
            Label : '{i18n>BookingFee}',
        },
        {
            $Type : 'UI.DataField',
            Value : total_price,
            Label : '{i18n>TotalPrice}',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
            Label : '{i18n>CurrencyCode}',
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BeginDate}',
            Value : begin_date,
        },
        {
            $Type : 'UI.DataField',
            Value : end_date,
            Label : '{i18n>EndDate}',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>TravelUuid}',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>Description}',
        },
    ],
);

annotate CAPWFService.Travel with @(
    UI.PresentationVariant : {
        Visualizations: ['@UI.LineItem'],
        SortOrder : [
            {
                Property : travel_id,
                Descending : false
            }
        ]
    }
);