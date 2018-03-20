var http = require('http');
var express = require('express');
var url = require('url')
var https = require('https');
var fs = require('fs');
var multer = require('multer')
var upload = multer({ dest: 'uploads/' })
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var csrf = require('csurf');
var FileStore = require('session-file-store')(session);
var csrfProtection = csrf({ cookie: true })
var parseForm = bodyParser.urlencoded({ extended: false })

var app = express();

app.set('view engine', 'ejs');
app.set('views', './views');
app.use(cookieParser());

// nested sessions
app.use('/sessions', session({
    secret: 'keyboard',
    store: new FileStore,
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 1000 * 10 } //60 sec session
}));


app.get('/', (req, res) => {
    res.render('main');
});

//zadanie 6.1
app.get('/file', (req, res) => {
    res.render('file');
});

app.post('/file', upload.single('file'), function (req, res) {
    res.render('main.ejs')
});
//zadanie 6.2
app.get('/radio', (req, res) => {
    var model = {
        t1 : "Przekazanie parametru z kodu",
        t2 : "Przekazanie za pomocą include"
    }
    res.render('radio', model);
})

//zadanie 6.3
app.get('/cookie', (req, res) => {
    var model = {}
    res.cookie('cookie1', 'valueOfCookie1', { maxAge: 1000 });
    res.cookie('cookie2', 'valueOfCookie2', { maxAge: 120 * 10000 });
    model.cookie = req.cookies;
    res.render('ciastka', model);
})
//clear cookies
app.get('/clear', (req, res) => {
    res.clearCookie('cookie1');
    res.clearCookie('cookie2');
    res.redirect('/');
})

app.get('/sessions', (req, res, next) => {
    var sess = req.session;

    if (sess.name) {
        res.write('Hi ' + sess.name + '\n');
    } else {
        sess.name = req.query.name;
    }
    next();
})
app.get('/sessions', (req, res) => {
    var sess = req.session

    if (sess.views) {
        sess.views++
        res.write('views: ' + sess.views + '\n')
        res.write('expires in: ' + (sess.cookie.maxAge / 1000) + 's')
        res.end()
    } else {
        sess.views = 1
        res.end('welcome to the session demo. refresh!')
    }
})
// zadanie 6.5
app.get('/form', csrfProtection, function (req, res) {
    // pass the csrfToken to the view
    res.render('csrf', { csrfToken: req.csrfToken() })
  })
  
app.post('/process', parseForm, csrfProtection, function (req, res) {
    res.send('data is being processed')
  })

var server = http.createServer(app).listen(3000);