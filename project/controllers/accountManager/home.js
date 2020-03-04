var express = require('express');
var router = express.Router();
var user_details = require.main.require('./models/user_details');
var block_req = require.main.require('./models/account_block_request');

router.get('*', function(req, res, next){
	if(req.cookies['loginUserId'] == null){
		res.redirect('/');
	}else{
		next();
	}
});

router.get('/', function(req, res){
	
	var data={
		username: "",
		mail: "",
		phone: "",
		bio: "",
	}
	var block_req_list;
	
	user_details.getById(req.cookies['loginUserId'], function(result)
	{
		data={
		username: result.username,
		mail: req.cookies['loginUserMail'],
		phone: result.phone_number,
		bio: result.bio,
		}
	});
	
	block_req.getAll(function(results)
	{
		block_req_list=results;
	});
	
	
	
	user_details.getAll(function(results)
	{
		console.log('home page requested!');
		res.render('accountManager/home',{data,resultList:results,block_req_list});
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