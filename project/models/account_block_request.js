var db = require('./db');

module.exports = {
    insert: function(user_id, callback){
		var sql = "insert into account_block_request values(?,?)";
		db.execute(sql, [user_id, "pending"], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}