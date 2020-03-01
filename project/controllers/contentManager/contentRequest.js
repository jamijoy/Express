var express = require('express');
var user_details = require.main.require('./models/user_details');
var post_content = require.main.require('./models/post_content');
var post_info = require.main.require('./models/post_info');
var post_join = require.main.require('./models/post_join');
var message_details = require.main.require('./models/message_details');
var message_info = require.main.require('./models/message_info');

var router = express.Router();

router.get('/approve/:post_id', function(request, response){
    console.log('post approve request');
    console.log("what is request???", request.params.userList);
    post_info.statusUpdate(request.params.post_id, function(status){
        if(status){
            console.log('approved');
            response.redirect('/contentManager/contentView/contentRequest');
        }else{
            console.log('error');
        }
    });
});

router.get('/delete/:post_id', function(request, response){
    console.log('post delete request');
    var userId = null;
    var messageId = null;
    post_info.getById(request.params.post_id, function(results){
        userId = results.user_id;
    });
    message_details.getId(function(incrementId){
        messageId = incrementId.id;
    });
    message_details.insertDeleteMessage(function(status){
        if(status){
            data = {
                sender_id: request.cookies['loginUserId'],
                receiver_id: userId,
                message_id: messageId,
                message_status_id: "60"
            }
            message_info.insert(data, function(status){
                if(status){
                    post_info.delete(request.params.post_id, function(status){
                        if(status){
                            post_content.delete(request.params.post_id, function(status){
                                if(status){
                                    console.log(request.params.post_id, userId, messageId, request.cookies['loginUserId']);
                                    response.redirect('/contentManager/contentView/contentRequest');
                                }
                                else{

                                }
                            });
                        }
                        else{

                        }
                    });
                }
                else{

                }
            });
        }
        else{

        }
    });
    // post_info.statusUpdate(request.params.post_id, function(status){
    //     if(status){
    //         console.log('approved');
    //     }else{
    //         console.log('error');
    //     }
    // });
});

router.get('/warning/:post_id', function(request, response){
    console.log('content manager report analysis page requested with get method!');
    var userId = null;
    post_info.getById(request.params.post_id, function(results){
        userId = results.user_id;
    });
});

router.get('/block/:post_id', function(request, response){
    console.log('content manager report analysis page requested with get method!');
    post_join.getAll(function(results){
        if(results.length > 0){
            response.render('contentManager/contentView/contentRequest', {userList: results});
        }else{
            res.redirect('/contentManager/home');
        }
    });
});


module.exports = router;