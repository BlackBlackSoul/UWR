var http = require('http');
var express = require('express');
var url = require('url')
var utils = require('./utils.js');
var https = require('https');
var fs = require('fs');


var httpApplication = express();
httpApplication.set('view engine', 'ejs');
httpApplication.set('views', '5/views');

httpApplication.get('/', (req, res) => {
    var model = { https: 0, http: 1 };
    res.render('main', model);
});

httpApplication.get('/plik', (req, res) => {

    res.setHeader('Content-disposition', 'attachment; filename=test.html');

    res.write('123');
    res.end();
});


httpApplication.use(express.urlencoded({ extended: true }));

httpApplication.get('/deklaracja', (req, res) => {
    res.render('deklaracja');
});

httpApplication.post('/deklaracja', (req, res) => {
    var name = req.body.name;
    var lecture = req.body.lecture;
    var date = req.body.date;
    var punkty = {
        1: req.body.zad1,
        2: req.body.zad2,
        3: req.body.zad3,
        4: req.body.zad4,
        5: req.body.zad5,
        6: req.body.zad6,
        7: req.body.zad7,
        8: req.body.zad8,
        9: req.body.zad9,
        10: req.body.zad10,
    };
    for (const p in punkty) {
        if (punkty[p] == '') {
            punkty[p] = 0;

        }
    }

    res.redirect(
        url.format({
            pathname: "print",
            query: {
                name: name,
                lecture: lecture,
                punkty: utils.intDictEncode(punkty),
                date: date,
            }
        }));
});

httpApplication.get('/print', (req, res) => {
    var punkty = utils.intDictDecode(req.query.punkty)
    var model = req.query;
    model.punkty = punkty;
    console.log(punkty)
    res.render('print', model);
});

httpApplication.use((req, res, next) => {
    res.render('404.ejs', { url: req.url });
});

//https:
const options = {
    pfx: fs.readFileSync('5/cert.pfx'), // INSERT YOUR CERTIFICATION HERE - you can use openssl to generate one
    passphrase: '' // INSERT PASSPHRASE TO CERT - You will be asked for it during generating process
};

var httpsApplication = express();
httpsApplication.set('view engine', 'ejs');
httpsApplication.set('views', '5/views');

httpsApplication.get('/', (req, res) => {
    var model = { https: 1, http: 0 };
    res.render('main', model);
});

httpsApplication.get('/plik', (req, res) => {

    res.setHeader('Content-disposition', 'attachment; filename=test.html');

    res.write('123');
    res.end();
});


httpsApplication.use(express.urlencoded({ extended: true }));

httpsApplication.get('/deklaracja', (req, res) => {
    res.render('deklaracja');
});

httpsApplication.post('/deklaracja', (req, res) => {
    var name = req.body.name;
    var lecture = req.body.lecture;
    var date = req.body.date;
    var punkty = {
        1: req.body.zad1,
        2: req.body.zad2,
        3: req.body.zad3,
        4: req.body.zad4,
        5: req.body.zad5,
        6: req.body.zad6,
        7: req.body.zad7,
        8: req.body.zad8,
        9: req.body.zad9,
        10: req.body.zad10,
    };
    for (const p in punkty) {
        if (punkty[p] == '') {
            punkty[p] = 0;

        }
    }

    res.redirect(
        url.format({
            pathname: "print",
            query: {
                name: name,
                lecture: lecture,
                punkty: utils.intDictEncode(punkty),
                date: date,
            }
        }));
});

httpsApplication.get('/print', (req, res) => {
    var punkty = utils.intDictDecode(req.query.punkty)
    var model = req.query;
    model.punkty = punkty;
    console.log(punkty)
    res.render('print', model);
});

httpsApplication.use((req, res, next) => {
    res.render('404.ejs', { url: req.url });
});


var server = http.createServer(app).listen(3000);
var server = https.createServer(options, httpsApplication).listen(3001);
console.log('serwer started');