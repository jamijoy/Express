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
	},
	getAll:function(callback){
		var sql = "select * from user_details";
		db.getResults(sql, null, function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback(null);
			}
		});
	},
	getUserType : function(user_id, callback){
		var sql = "SELECT user_type.user_type_name FROM user_details, user_type WHERE user_details.user_type_id = user_type.user_type_id AND user_details.user_id = ?";
		db.getResults(sql, [user_id], function(result){
			if(result.length > 0){
				callback(result);
			}
			else{
				callback(null);
			}
		});
	}
}