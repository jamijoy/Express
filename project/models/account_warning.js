var db = require('./db');

module.exports = {
    update: function(user_id, callback){
		var sql = "UPDATE account_warning SET warning_count = warning_count + 1 WHERE user_id = ?";
		db.execute(sql, [user_id], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}