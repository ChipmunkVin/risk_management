namespace riskmanagementv1;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    managed,
    temporal
}
from '@sap/cds/common';

entity risks
{
    key ID : UUID;
    title : String(100);
    prio : String(100);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    miti : Association to one mitigations;
    supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity mitigations
{
    key ID : UUID;
    createdAt : String(100);
    createdBy : String(100);
    description : String(100);
    owner : String(100);
    timeline : String(100);
    risks : Association to many risks on risks.miti = $self;
}
