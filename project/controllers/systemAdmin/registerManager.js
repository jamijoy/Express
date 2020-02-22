var express = require('express');
var router = express.Router();
var app = express();

router.get('/', function(req, res){
	console.log('Manager Register page requested!');
	res.render('systemAdmin/register');
});

module.exports = router;