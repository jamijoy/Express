var express = require('express');
var router = express.Router();
var user_details = require.main.require('./models/user_details');

router.get('/', function(req, res){
	
	user_details.getById(req.cookies['loginUserId'], function(result)
	{
		var data={
		username: result.username,
		mail: req.cookies['loginUserMail'],
		phone: result.phone_number,
		bio: result.bio,
		}
		
		console.log('home page requested!');
		res.render('accountManager/home',data);
	});
});

// router.post('/', function(req, res){
	
	// if(req.body.uname == req.body.password){
		// req.session.username = req.body.uname;
		// res.redirect('/home');
	// }else{
		// res.send('invalid username/password');
	// }
// });

module.exports = router;