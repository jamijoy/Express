var express = require('express');
var router = express.Router();

router.get('/', function(request, response){
    console.log('system admin home page requested with get method!');
    response.render('systemAdmin/home/home');
});

router.get('/viewProfile', function(request, response){
    console.log('system admin profile page requested with get method!');
    response.render('systemAdmin/profile/viewProfile');
});

router.get('/contentRequest', function(request, response){
    console.log('system admin search page requested with get method!');
    response.render('systemAdmin/contentView/contentRequest');
});

router.get('/report', function(request, response){
    console.log('system admin report analysis page requested with get method!');
    response.render('systemAdmin/reportAnalysis/report');
});

router.get('/createPost', function(request, response){
    console.log('system admin create post page requested with get method!');
    response.render('systemAdmin/createPost/createPost');
});

router.get('/sendMessage', function(request, response){
    console.log('system admin send message page requested with get method!');
    response.render('systemAdmin/sendMessage/sendMessage');
});

router.get('/view', function(request, response){
    console.log('system admin send message page requested with get method!');
    response.render('contentManager/viewPost/view');
});

module.exports = router;