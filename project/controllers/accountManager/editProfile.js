var express = require('express');
var router = express.Router();
var user_details = require.main.require('./models/user_details');
var user_login = require.main.require('./models/user_login');

router.get('/', function(req, res){
	console.log('Edit Profile page requested!');
	
	user_details.getById(req.cookies['loginUserId'], function(result)
	{
		data={
		username: result.username,
		mail: req.cookies['loginUserMail'],
		phone: result.phone_number,
		bio: result.bio,
		dob: result.birthdate,
		gender: result.gender
		}
		
		res.render('accountManager/editProfile',data);
	});
});


router.post('/', function(req, res){
	
	var userInfo={
		username: req.body.name,
		mail: req.body.mail,
		phone: req.body.phn,
		bio: req.body.bio,
		dob: req.body.dob,
		pass: req.body.pass1,
		userid: req.cookies["loginUserId"]
	}
	
	user_details.update(userInfo,function(status){
		if(status){
			if(req.body.pass != null)
			{
				user_login.update(userInfo,function(status){
					if(status){
						res.redirect("/");
					}else{
						console.log(userInfo);
					}		
				});
			}
			else
			{
				res.redirect("/");
			}
		}else{
			console.log(userInfo);
		}		
	});
});

module.exports = router;