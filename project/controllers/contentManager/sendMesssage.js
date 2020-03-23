var express = require('express');
var user_details = require.main.require('./models/user_details');
var message_details = require.main.require('./models/message_details');
var message_info = require.main.require('./models/message_info');
var router = express.Router();

router.get('*', function(req, res, next){
	if(req.cookies['loginUserId'] == null){
		res.redirect('/');
	}else{
		next();
	}
});

router.post('/sendMessage', function(request, response){
    message_details.getNextId(function(result){
        if(result.length > 0){
            var d = new Date();
            var millisecond = d.getTime();
            var d = null;
            data = {
                message_id: JSON.stringify(result[0].id),
                message_text: request.body.post,
                receiver_id: request.body.senderName,
                sender_id: request.cookies['loginUserId'],
                message_status_id: 60,
                msg_time: millisecond
            }
            console.log(data);
            message_details.insert(data, function(status){
                if(status){
                    message_info.insert(data, function(status){
                        if(status){
                            response.render('contentManager/sendMessage/sendMessage');
                        }
                    });
                }
            });
        }
    });
    // response.send(data);
});

router.post('/showUser', function(request, response){
    console.log("show user");
    user_details.getNameAndId(function(results){
        if(results.length > 0){
            response.send(JSON.stringify(results));
        }
    });
});


module.exports = router;