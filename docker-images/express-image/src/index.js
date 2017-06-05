var Express = require('express');
var Chance  = require('chance');

var express = new Express();
var chance  = new Chance();

function generatePlaces ()
{
    var numberOfPlace = chance.integer({min: 1, max: 10});
    console.log(numberOfPlace);
    
    var places = [];
    for (var i = 0; i < numberOfPlace; ++i)
    {
        var gender = chance.gender();
        places.push({
            address: chance.address(),
            city:    chance.city(),
            country: chance.country({ full: true }),
            text:    chance.sentence(),
            image:   "/api/img/" + chance.integer({min: 1, max: 25}) + ".jpg"
        });
    }
    console.log();
    return places;
}

express.get(
    '/api/places/',
    function (req, res)
    {
        res.send(generatePlaces());
    }
);

express.get(
    '/api/img/:datafile',
    function (req, res)
    {
        res.sendFile('/opt/app/img/' + req.params.datafile);
    }
);

express.listen(
    3000,
    function ()
    {
        console.log('Accepting HTTP requests on port 3000.');
    }
);
