//导入express模块
const express = require("express");

//导入body-parser模块
const bodyParser = require("body-parser");
//导入cors模块
const cors = require("cors");

//创建服务器
const app = express();
//监听3000端口
app.listen(3000);
// 引入路由
const user =require('./routes/user')
const index =require('./routes/index')
const list =require('./routes/list')
const details =require('./routes/details')


//使用body-parser中间件
app.use(bodyParser.urlencoded({
    extended:false
}));
//为所有请求使用cors模块解决跨域
app.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}));

/*使用路由器来管理路由*/
app.use("/user", user);
app.use("/index",index)
app.use("/list",list);
app.use("/details",details);
