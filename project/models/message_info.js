var db = require('./db');

module.exports = {
    insert: function(data, callback){
		var d = new Date();
		var millisecond = d.getTime();
		var d = null;
		var sql = "insert into message_info values(?,?,?,?,?)";
		db.execute(sql, [data.sender_id, data.receiver_id, data.message_id, data.message_status_id, millisecond], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}