var db = require('./db');

module.exports = {
    validate: function(user, callback){
		var sql ="SELECT * FROM user_login where email=? and password=?";
		
		db.getResults(sql, [user.email, user.password], function(results){
			if(results.length == 1){
				callback(true);
			}else{
				callback(false);
			}
		});
    },
    getByEmail : function(email, callback){
		var sql = "select * from user_login where email=?";
		db.getResults(sql, [email], function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback(null);
			}
		});
	}
}