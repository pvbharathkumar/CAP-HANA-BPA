sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/TravelList.gen",
	"project1/test/integration/pages/TravelObjectPage.gen"
], function (JourneyRunner, TravelListGenerated, TravelObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheTravelListGenerated: TravelListGenerated,
			onTheTravelObjectPageGenerated: TravelObjectPageGenerated
        },
        async: true
    });

    return runner;
});

