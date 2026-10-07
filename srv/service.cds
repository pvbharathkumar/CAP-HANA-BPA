using { CAPWF as my } from '../db/schema.cds';

@path:'/service/CAPWFService'
service CAPWFService {

    @odata.draft.enabled
    entity Travel as projection on my.Travel actions {

        action submitForApproval();

    };

}

//annotate CAPWFService with @requires: ['authenticated-user'];
