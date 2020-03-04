var express = require('express');
var router = express.Router();
var home = require('../accountManager/home');
var user_login = require.main.require('./models/user_login');
var app = express();

router.get('/', function(req, res){
	console.log('login page requested!');
	res.render('index');
});

// router.post('/', function(request, response){
//     console.log('login page requested with post method!');
// 	if(request.body.username == request.body.password){
// 		if(request.body.username == "pcm" && request.body.password == "pcm"){
// 			console.log('login page requested with post method in content manager!');
// 			response.redirect('/contentManager/home');
// 		}
// 		else if(request.body.username == "acm" && request.body.password == "acm"){
// 			request.session.username=request.body.username;
// 			console.log('login page requested with post method in account manager!');
// 			response.redirect('/accountManager/home');
// 		}
// 		else if(request.body.username == "sa" && request.body.password == "sa"){
// 			console.log('login page requested with post method in account manager!');
// 			response.redirect('/systemAdmin/home');
// 		}
// 		// else{
// 		// 	response.redirect('/home');
// 		// }
//     }
//     else{
// 		response.send('invalid username/password');
// 	}
// });

router.post('/', function(request, response){
    console.log('post request from login');
	var user ={
		email: request.body.email,
		password: request.body.password
    };
	
    console.log(user.email, user.password);
	
	user_login.validate(user, function(status){
		
	 	if(status){
			
			console.log('successfully login with ');
			
			user_login.getByEmail(user.email, function(results){
				
				if(results.length > 0){
					
					// setting up Cookies
					response.cookie('loginUserId', results[0].user_id);
					response.cookie('loginUserMail', user.email);
					
					//just for value testing if its getting accurate data
					var loginUserId = request.cookies['loginUserId'];
					console.log('Call for details of >> ', loginUserId);
					
					//Redirecting to the Main Home Section
					response.redirect('/generalController/mainHome');
				}
				
				else{
					console.log("login page back");
					response.redirect('/');
				}
			});
        }
        else{
			response.send('invalid username/password');
		}
	});
});

module.exports = router;