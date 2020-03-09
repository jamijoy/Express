var express = require('express');
var router = express.Router();

router.get('*', function(req, res, next){
	if(req.cookies['loginUserId'] == null){
		res.redirect('/');
	}else{
		next();
	}
});

router.get('/report', function(request, response){
    console.log('from report.js');
    response.render('contentManager/reportAnalysis/report');
});

module.exports = router;