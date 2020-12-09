//导入express模块
const express = require("express");
<<<<<<< HEAD

//导入body-parser模块
const bodyParser = require("body-parser");

=======
//导入body-parser模块
const bodyParser = require("body-parser");
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0
//导入cors模块
const cors = require("cors");

// 引入路由
const user=require('./routes/user')
const index=require('./routes/index')

//创建服务器
const app = express();
//监听3000端口
<<<<<<< HEAD
app.listen(3000); 
=======
app.listen(3000);
// 引入路由
const user =require('./routes/user')
const index =require('./routes/index')
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0

//使用body-parser中间件
app.use(bodyParser.urlencoded({
    extended:false
}));
//为所有请求使用cors模块解决跨域
app.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}));


<<<<<<< HEAD
/*使用路由器来管理路由*/
app.use("/user", user);
app.use("/index",index)
=======
app.get("/service", (req, res) => {
    let user_id=1
	var sql = "select content,is_send,created_at from xn_service_messeage where user_id=?";
	pool.query(sql, [user_id], (err, result) => {
		if (err) throw err;
		res.send({code:200,message:"登录",result:result})
	})
})
// 使用路由
app.use('/user',user)
app.use('/index',index)
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0
