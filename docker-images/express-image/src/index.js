var Chance  = require('chance');
var Express = require('express');

var chance  = new Chance();
var express = new Express();

function generateStudents ()
{
    var numberOfStudents = chance.integer({min: 1, max: 10});
    console.log(numberOfStudents);
    
    var students = [];
    for (var i = 0; i < numberOfStudents; ++i)
    {
        var gender    = chance.gender();
        students.push({
            firstName: chance.first({gender: gender}),
            lastName:  chance.last(),
            gender:    gender,
            birthday:  chance.birthday({year: chance.integer({min: 1986, max: 1996})})
        });
    }
    console.log(students);
    return students;
}

express.get(
    '/',
    function (req, res)
    {
        res.send("Hello RES");
    }
);

express.get(
    '/test',
    function (req, res)
    {
        res.send(generateStudents());
    }
);

express.listen(
    3000,
    function ()
    {
        console.log('Accepting HTTP requests on port 3000.');
    }
);
