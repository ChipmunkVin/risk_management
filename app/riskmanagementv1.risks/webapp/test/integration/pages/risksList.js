sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'riskmanagementv1.risks',
            componentId: 'risksList',
            contextPath: '/risks'
        },
        CustomPageDefinitions
    );
});