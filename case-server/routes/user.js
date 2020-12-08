const express=require("express");

//加载MD5模块
const md5 = require('md5');

const router=express.Router();
const pool=require("../pool");

// 用户注册的接口
router.post('/register', (req, res) => {
  //获取用户名和密码
  let username = req.body.username;
  let password = req.body.password;
  //查找用户是否存在
  let sql = 'SELECT * FROM user WHERE uname= ?';
  pool.query(sql, [username], (error, result) => {
    console.log(result);
    if (error) throw error;
    //如果用户不存在,则插入记录
    if (result.length == 0) {
      sql = 'INSERT INTO user(uname,upwd) VALUES(?,MD5(?))';
      pool.query(sql, [username, password], (error, result) => {
        if (error) throw error;
        res.send({
          message: '注册成功',
          code: 1
        });
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
  let username = req.body.username;
  let password = req.body.password;
  //以用户名和密码为条件进行查找
  let sql = 'SELECT uname,upwd FROM user WHERE uname=? AND upwd=MD5(?)';
  pool.query(sql, [username, password], (error, result) => {
    if (error) throw error;
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
module.exports=router;