var Express = require('express');
var Chance  = require('chance');
var Faker   = require('faker');

var express = new Express();
var chance  = new Chance();
var faker   = Faker;

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
            text:    chance.paragraph(),
            image:   faker.image.avatar()
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

express.listen(
    3000,
    function ()
    {
        console.log('Accepting HTTP requests on port 3000.');
    }
);
