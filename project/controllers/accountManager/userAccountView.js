var express = require('express');
var router = express.Router();

router.get('/', function(req, res){
	console.log('User Profile page requested!');
	res.render('accountManager/userAccountView');
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