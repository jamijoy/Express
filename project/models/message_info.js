var db = require('./db');

module.exports = {
    insert: function(data, callback){
		var sql = "insert into message_info values(?,?,?,?,?)";
		db.execute(sql, [data.sender_id, data.receiver_id, data.message_id, data.message_status_id, data.time], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}