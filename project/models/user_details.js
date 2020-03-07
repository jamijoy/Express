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
	},
	getBySearching:function(val,callback){
		var sql = "select * from user_details where username LIKE '%' ? '%'";
		db.getResults(sql, val, function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback(null);
			}
		});
	},
	update:function(userInfo,callback){
		var sql = "update user_details set username=? , phone_number=? , birthdate=? , bio=? where user_id=?";
		db.execute(sql, [userInfo.username,userInfo.phone,userInfo.dob,userInfo.bio,userInfo.userid], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	},
	insert:function(userInfo,callback){
		var sql = "insert into user_details values(?,?,?,?,?,?,?,?,?,?)";
		db.execute(sql, ['',userInfo.username,userInfo.phone,userInfo.gender,userInfo.dob,userInfo.bio,null,userInfo.usertype,userInfo.acctype,userInfo.accstatus], function(status){
			if(status){
				callback(true);
			}else{
				callback(false);
			}
		});
	}
}