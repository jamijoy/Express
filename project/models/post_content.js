var db = require('./db');

module.exports = {
    getAll : function(callback){
		var sql = "select * from post_content";
		db.getResults(sql, null, function(results){
            // console.log("result from table:", results);
			if(results.length > 0){
				callback(results);
			}else{
				callback([]);
			}
		});
	},
	delete : function(post_id, callback){
		var sql = "Delete from post_content where post_id=?";
		db.execute(sql, [post_id], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}