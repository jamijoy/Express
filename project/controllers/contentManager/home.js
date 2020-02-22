var express = require('express');
var router = express.Router();

router.get('/', function(request, response){
    console.log('content manager home page requested with get method!');
    var data = {
        username: request.body.username
    }
    response.render('contentManager/home/index', data);
});

router.get('/viewProfile', function(request, response){
    console.log('content manager profile page requested with get method!');
    response.render('contentManager/profile/viewProfile');
});

router.get('/index', function(request, response){
    console.log('content manager search page requested with get method!');
    response.render('contentManager/search/index');
});

router.get('/contentRequest', function(request, response){
    console.log('content manager search page requested with get method!');
    response.render('contentManager/contentView/contentRequest');
});

router.get('/report', function(request, response){
    console.log('content manager report analysis page requested with get method!');
    response.render('contentManager/reportAnalysis/report');
});

router.get('/createPost', function(request, response){
    console.log('content manager create post page requested with get method!');
    response.render('contentManager/createPost/createPost');
});

router.get('/sendMessage', function(request, response){
    console.log('content manager send message page requested with get method!');
    response.render('contentManager/sendMessage/sendMessage');
});

router.get('/view', function(request, response){
    console.log('content manager send message page requested with get method!');
    response.render('contentManager/viewPost/view');
});

module.exports = router;