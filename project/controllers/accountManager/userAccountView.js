var express = require('express');
var router = express.Router();
var user_details = require.main.require('./models/user_details');
var content = require.main.require('./models/post_content');

router.get('*', function(req, res, next){
	if(req.cookies['loginUserId'] == null){
		res.redirect('/');
	}else{
		next();
	}
});

router.get('/:id', function(req, res){
	
	user_details.getById(req.params.id, function(result)
	{
		data={
		userid: result.user_id,
		username: result.username,
		phone: result.phone_number,
		bio: result.bio,
		dob: result.birthdate,
		gender: result.gender
		}
		
		content.getById(req.params.id, function(contentResult)
		{
			console.log(contentResult);
			console.log('User Account View Requested!');
			res.render('accountManager/userAccountView',{data,contentData:contentResult});
		});
	});
});

module.exports = router;