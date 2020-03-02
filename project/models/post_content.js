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
	},
	getNextId : function(callback){
		var sql = "SELECT auto_increment AS id FROM `information_schema`.`tables` WHERE table_name = 'post_content' AND table_schema = 'express'";
		db.getResults(sql, null, function(result){
			if(result.length > 0){
				callback(result);
			}else{
				callback([]);
			}
		});
	},
	insert : function(data, callback){
		var sql = "INSERT INTO `post_content`(`post_text`, `post_image`) VALUES (?, ?)";
		db.execute(sql, [data.post_text, data.post_image], function(status){
			if(status){
				callback(true);
			}
			else{
				callback(false);
			}
		})
	},
	getAllFromSearch : function(string, callback){
		var sql = "select post_id, post_text from post_content where post_text like '%' ? '%'";
		db.getResults(sql, [string], function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback([]);
			}
		});
	},
	getAllPost : function(callback){
		var sql = "select post_id, post_text from post_content";
		db.getResults(sql, null, function(results){
			if(results.length > 0){
				callback(results);
			}else{
				callback([]);
			}
		});
	}
}