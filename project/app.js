// declaration start
var express = require('express');
var expSession = require('express-session');
var ejs = require('ejs');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');
var mySql = require('mysql');
var app = express();

// *****general declaration*****
var login = require('./controllers/generalController/login');
var logout = require('./controllers/generalController/logout');
var register = require('./controllers/generalController/registration');
// *****general declaration*****

// *****account manager declaration*****
var home = require('./controllers/accountManager/home');
var profile = require('./controllers/accountManager/profile');
var editProfile = require('./controllers/accountManager/editProfile');
var userAccountView = require('./controllers/accountManager/userAccountView');
var report = require('./controllers/accountManager/report');
// *****account manager declaration*****

// *****content manager declaration*****
var contentManagerHome = require('./controllers/contentManager/home');
var contentManagerProfile = require('./controllers/contentManager/profile');
// *****content manager declaration*****

// *****system admin declaration*****
var systemAdminHome = require('./controllers/systemAdmin/home');
var registerManager = require('./controllers/systemAdmin/registerManager');
var userAccountView2 = require('./controllers/systemAdmin/userAccountView');
// *****system admin declaration*****

// *****user declaration*****
// *****user declaration*****

// declaration end

// configuration start
app.set('view engine', 'ejs');
// configuration end

// middleware start
app.use(bodyParser.urlencoded({extended:true}));
app.use(expSession({secret:'Hello Express', saveUninitialized: true, resave:false}));
app.use('/static', express.static('static'));

// *****general middleware  start*****
app.use('/', login);
app.use('/generalController/logout', logout);
app.use('/generalController/register', register);
// *****general middleware end*****

// *****account manager middleware start*****
app.use('/accountManager/home', home);
app.use('/accountManager/profile', profile);
app.use('/accountManager/editProfile', editProfile);
app.use('/accountManager/userAccountView', userAccountView);
app.use('/accountManager/report', report);
// *****account manager middleware end*****

// *****content manager middleware start*****
app.use('/contentManager/home', contentManagerHome);
app.use('/contentManager/profile', contentManagerHome);
app.use('/contentManager/contentView', contentManagerHome);
app.use('/contentManager/profile', contentManagerProfile);
app.use('/contentManager/search', contentManagerHome);
app.use('/contentManager/reportAnalysis', contentManagerHome);
app.use('/contentManager/createPost', contentManagerHome);
app.use('/contentManager/sendMessage', contentManagerHome);
app.use('/contentManager/viewPost', contentManagerHome);
// *****content manager middleware end*****

// *****user middleware  start*****
app.use('/systemAdmin/home', systemAdminHome);
app.use('/systemAdmin/profile', systemAdminHome);
app.use('/systemAdmin/contentView', systemAdminHome);
app.use('/systemAdmin/search', systemAdminHome);
app.use('/systemAdmin/reportAnalysis', systemAdminHome);
app.use('/systemAdmin/createPost', systemAdminHome);
app.use('/systemAdmin/sendMessage', systemAdminHome);
app.use('/systemAdmin/viewPost', systemAdminHome);
app.use('/systemAdmin/registerManager', registerManager);
app.use('/systemAdmin/userAccountView', userAccountView2);
app.use('/systemAdmin/registerManager', registerManager);
app.use('/systemAdmin/userAccountView', userAccountView2);
// *****user middleware end*****

// middleware end

// routes

//server startup
var serverPort=3000;
app.listen(serverPort, function(){
    console.log("project server started at", serverPort);
    
});