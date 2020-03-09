var express = require('express');
var post_content = require.main.require('./models/post_content');
var router = express.Router();

router.post('/search', function(request, response){
    console.log("search done", request.body.value);
    if(request.body.value !=""){
        post_content.getAllFromSearch(request.body.value, function(results){
            response.send(JSON.stringify(results));
        });
    }
    else if(request.body.value == ""){
        post_content.getAllPost(function(results){
            response.send(JSON.stringify(results));
        });
    }
});







module.exports = router;