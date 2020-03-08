var express = require('express');
var user_details = require.main.require('./models/user_details');
var router = express.Router();

router.get('/', function(request, response){
	
	if(request.cookies['loginUserId'] != null){
		
		user_details.getById(request.cookies['loginUserId'], function(result){
            
			// console.log("general home controllers");
            // console.log(result.user_type_id);
            
			if(result.user_type_id == "21"){
                response.redirect('/contentManager/home');
            }
			else if(result.user_type_id == "22"){
                response.redirect('/accountManager/home');
            }
            else if(result.user_type_id == "23"){
				// response.render('');
				response.send("user ok");
            }
			
		});
	}else{
		response.redirect('/');
	}
});

module.exports = router;