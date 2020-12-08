//导入express模块
const express = require("express");
//导入mysql模块
const mysql = require("mysql")
//导入body-parser模块
const bodyParser = require("body-parser");
//导入md5模块
const md5 = require("md5");
//导入cors模块
const cors = require("cors");
//创建服务器
const app = express();
//监听3000端口
app.listen(3000);
//创建连接池
const pool = mysql.createPool({
      //数据库服务器的地址
      host:"127.0.0.1",
      //数据库端口
      port:3306,
      user:"root",
      //密码
      password:"",
      //数据库名称
      database:"wwxn",
      //最大连接数
      connectionLimit:15
});
//使用body-parser中间件
app.use(bodyParser.urlencoded({
    extended:false
}));



//为所有请求使用cors模块解决跨域
app.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}));


app.get("/service", (req, res) => {
    let user_id=1
	var sql = "select content,is_send,created_at from xn_service_messeage where user_id=?";
	pool.query(sql, [user_id], (err, result) => {
		if (err) throw err;
		res.send({code:200,message:"登录",result:result})
	})
})
