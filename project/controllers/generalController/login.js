var express = require('express');
var router = express.Router();
var home = require('../accountManager/home');
var app = express();

router.get('/', function(req, res){
	console.log('login page requested!');
	res.render('index');
});

// router.post('/', function(req, res){
// 	console.log('Post requested!');
// 	if(req.body.uname == req.body.pass){
// 		req.session.username = req.body.uname;
// 		res.redirect('/accountManager/home');
// 		// app.use('/',home);
// 	}else{
// 		res.send('invalid username or password');
// 	}
// });

router.post('/', function(request, response){
    console.log('login page requested with post method!');
	if(request.body.username == request.body.password){
		if(request.body.username == "pcm" && request.body.password == "pcm"){
			console.log('login page requested with post method in content manager!');
			response.redirect('/contentManager/home');
		}
		else if(request.body.username == "acm" && request.body.password == "acm"){
			request.session.username=request.body.username;
			console.log('login page requested with post method in account manager!');
			response.redirect('/accountManager/home');
		}
		else if(request.body.username == "sa" && request.body.password == "sa"){
			console.log('login page requested with post method in account manager!');
			response.redirect('/systemAdmin/home');
		}
		// else{
		// 	response.redirect('/home');
		// }
    }
    else{
		response.send('invalid username/password');
	}
});

module.exports = router;