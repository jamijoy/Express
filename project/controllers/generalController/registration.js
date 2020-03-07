var express = require('express');
var router = express.Router();
var user_details = require.main.require('./models/user_details');
var user_login = require.main.require('./models/user_login');

router.get('/', function(req, res){
	console.log('Registration page requested!');
	res.render('registration');
});

router.post('/', function(req, res){
	var userInfo={
		username: req.body.name,
		mail: req.body.mail,
		phone: req.body.phn,
		gender: req.body.gender,
		bio: req.body.bio,
		dob: req.body.dob,
		pass: req.body.pass1,
		usertype: 23,
		acctype: 31,
		accstatus: 10
	}
	
	user_details.insert(userInfo,function(status){
		if(status){
			user_login.insert(userInfo,function(status){
				if(status){
					res.redirect("/");
				}else{
					console.log(userInfo);
				}
			});
		}else{
			console.log(userInfo);
		}
	});
});

module.exports = router;