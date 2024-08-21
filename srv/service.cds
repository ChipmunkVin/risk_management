using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { riskmanagementv1 as my } from '../db/schema';

@path : '/service/riskmanagementv1Svcs'
service riskmanagementv1Service
{
    annotate mitigations with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'riskviewer' ] },
        { grant : [ '*' ], to : [ 'riskmanager' ] }
    ];

    annotate risks with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'riskviewer' ] },
        { grant : [ '*' ], to : [ 'riskmanager' ] }
    ];

    @odata.draft.enabled
    entity risks as
        projection on my.risks;

    @odata.draft.enabled
    entity mitigations as
        projection on my.mitigations;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate riskmanagementv1Service with @requires :
[
    'authenticated-user',
    'riskviewer',
    'riskmanager'
];
