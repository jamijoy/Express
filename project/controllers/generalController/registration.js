var express = require('express');
var router = express.Router();
// var home = require('./accountManager/home');
var app = express();

router.get('/', function(req, res){
	console.log('Registration page requested!');
	res.render('registration');
});

// router.post('/', function(req, res){
	// console.log('Post requested!');
	// if(req.body.uname == req.body.pass){
		// req.session.username = req.body.uname;
		// res.redirect('/accountManager/home');
		// app.use('/',home);
	// }else{
		// res.send('invalid username or password');
	// }
// });

module.exports = router;