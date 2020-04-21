const apickli = require('apickli');
const { Before, setDefaultTimeout } = require('cucumber');

Before(function() {
    this.apickli = new apickli.Apickli('https', process.env.API_HOST);
    setDefaultTimeout(60 * 1000); 
    this.apickli.scenarioVariables.clientId = process.env.CLIENT_ID;
    this.apickli.scenarioVariables.clientSecret = process.env.CLIENT_SECRET;
});

