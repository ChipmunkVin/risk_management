sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'riskmanagementv1/risks/test/integration/FirstJourney',
		'riskmanagementv1/risks/test/integration/pages/risksList',
		'riskmanagementv1/risks/test/integration/pages/risksObjectPage'
    ],
    function(JourneyRunner, opaJourney, risksList, risksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('riskmanagementv1/risks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTherisksList: risksList,
					onTherisksObjectPage: risksObjectPage
                }
            },
            opaJourney.run
        );
    }
);