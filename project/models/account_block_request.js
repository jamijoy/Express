var db = require('./db');

module.exports = {
    insert: function(user_id, callback){
		var d = new Date();
		var millisecond = d.getTime();
		var d = null;
		var sql = "insert into account_block_request values(?,?, ?)";
		db.execute(sql, [user_id, "pending", millisecond], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	},
	getAll:function(callback){
		var sql = "select * from account_block_request";
		db.getResults(sql, null, function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback(null);
			}
		});
	}
}