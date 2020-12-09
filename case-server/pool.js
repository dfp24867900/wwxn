//导入mysql模块
const mysql = require("mysql")

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
   database:"bride",
   //最大连接数
   connectionLimit:15
});

//把创建好的连接池导出

module.exports = pool;