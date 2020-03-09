var express = require('express');
var router = express.Router();

router.get('/report', function(request, response){
    console.log('from report.js');
    response.render('contentManager/reportAnalysis/report');
});

module.exports = router;