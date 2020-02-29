var express = require('express');
var user_details = require.main.require('./models/user_details');
var router = express.Router();

router.get('/', function(request, response){
	if(request.cookies['loginUserId'] != null){
		user_details.getById(request.cookies['loginUserId'], function(result){
            console.log("general home controllers");
            console.log(result.user_type_id);
            if(result.user_type_id == "21"){
                response.render('contentManager/home', {user: result});
            }
            else if(result.user_type_id == "user"){
                response.render('customer/home', {user: result});
            }
			
		});
	}else{
		response.redirect('/');
	}
});

module.exports = router;