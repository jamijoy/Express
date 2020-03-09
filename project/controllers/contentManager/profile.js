var express = require('express');
var router = express.Router();

router.get('/updateProfile', function(request, response){
    console.log('content manager update profile page requested with get method!');
    response.render('contentManager/profile/updateProfile');
});

module.exports = router;