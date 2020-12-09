const express = require("express");

//加载MD5模块
const md5 = require('md5');

// var qs = require("querystring")
const router = express.Router();
const pool = require("../pool");

// 用户注册的接口
router.post('/register', (req, res) => {
  //获取用户名和密码
  let username = req.body.uname;
  let password = req.body.upwd;
  let phone = req.body.phone;
  let email = req.body.email;
  //查找用户是否存在
  let sql = 'SELECT * FROM bride_user WHERE uname= ?';
  pool.query(sql, [username], (error, result) => {
    if (error) throw error;
    //如果用户不存在,则插入记录
    if (result.length == 0) {
      sql = 'INSERT INTO bride_user(uname,upwd,phone,email) VALUES(?,md5(?),?,?)';
      pool.query(sql, [username, password, phone, email], (error, result) => {
        if (error) throw error;
        if (result.affectedRows > 0) {
          res.send({
            message: '注册成功',
            code: 1
          });
        } else {
          res.send({
            message: '注册失败',
            code: 0
          })
        }
      })
    } else { //否则产生合理的错误提示
      res.send({
        message: '用户已存在',
        code: 0
      });
    }
  })
});

//用户登录的接口
router.post('/login', (req, res) => {
  //获取用户名和密码
  var obj = req.body
  console.log(obj)
  let username = req.body.uname;
  let password = md5(req.body.upwd);
  console.log(username, password)
  //以用户名和密码为条件进行查找
  let sql = 'SELECT uname,upwd FROM bride_user WHERE uname=? AND upwd=?';
  pool.query(sql, [username, password], (error, result) => {
    if (error) throw error;
    console.log(result)
    if (result.length == 0) {
      res.send({
        message: '登录失败',
        code: 0
      });
    } else {
      res.send({
        message: '登录成功',
        code: 1,
        userInfo: result
      });
    }
  });
});

//客服消息接口
router.get("/service", (req, res) => {
  let user_id = req.query.user_id
  console.log(user_id)
  var sql = "select content,is_send,created_at from xn_service_messeage where user_id=? ";
  pool.query(sql, [user_id], (err, result) => {
    if (err) throw err;
    res.send({ code: 200, message: "查询成功", result: result })
  })
})
//客服消息插入数据库
router.post("/insertNew", (req, res) => {
  let obj = req.body;
  var sql = "INSERT INTO xn_service_messeage SET ?";
  pool.query(sql, [obj], (err, result) => {
    if (err) throw err;
    if (result.affectedRows > 0) {
      res.send({ code: 200, message: "插入成功" })
    } else {
      res.send({ code: 201, message: "插入失败" })
    }
  })
})
module.exports = router;