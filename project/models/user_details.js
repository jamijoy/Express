var db = require('./db');

module.exports = {
    getById : function(user_id, callback){
        var sql = "select * from user_details where user_id = "+user_id;
        // console.log(sql);
		db.getResults(sql, null, function(results){
            // console.log(results);
			if(results.length > 0){
				callback(results[0]);
			}else{
				callback(null);
			}
		});
	}
}