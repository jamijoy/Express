var express = require('express');
var router = express.Router();

router.get('*', function(req, res, next){
	if(req.cookies['loginUserId'] == null){
		res.redirect('/');
	}else{
		next();
	}
});

router.get('/updateProfile', function(request, response){
    console.log('content manager update profile page requested with get method!');
    response.render('contentManager/profile/updateProfile');
});

module.exports = router;