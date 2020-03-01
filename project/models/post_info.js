var db = require('./db');

module.exports = {
    getAll : function(callback){
		var sql = "select * from post_info";
		db.getResults(sql, null, function(results){
            // console.log("result from table:", results);
			if(results.length > 0){
				callback(results);
			}else{
				callback([]);
			}
		});
    },
    statusUpdate : function(post_id, callback){
		var sql = "UPDATE `post_info` SET `post_status_id`= (SELECT post_status_id from post_status WHERE post_status.post_status_name = 'approve') WHERE post_id = ?";
		db.execute(sql, [post_id], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
    },
    getById : function(post_id, callback){
		var sql = "select * from post_info where post_id=?";
		db.getResults(sql, [post_id], function(results){
			if(results.length > 0){
				callback(results[0]);
			}else{
				callback(null);
			}
		});
    },
    delete : function(post_id, callback){
		var sql = "Delete from post_info where post_id=?";
		db.execute(sql, [post_id], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}