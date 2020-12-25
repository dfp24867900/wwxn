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
  let username = obj.username;
  // let password = obj.password;
  let password = md5(obj.password);
  //以用户名和密码为条件进行查找
  let sql = 'SELECT * FROM bride_user WHERE uname=? AND upwd=?';
  pool.query(sql, [username, password], (error, result) => {
    if (error) throw error;
    if (result.length == 0) {
      res.send({
        message: '登录失败',
        code: 201
      });
    } else {
      res.send({
        message: '登录成功',
        code: 200,
        info: result[0]
      });
    }
  });
});

// 收藏界面接口
router.get('/sitecollect', (req, res) => {
  if(req.query.uid2){
      // 获取地址栏的URL参数 -- 用户ID
    let uid = req.query.uid;
    let uid2 = req.query.uid2;
    let coll=[];
    let sq='?'
    // 查询特定记录的SQL语句
    let sql = 'SELECT pid FROM bride_collect WHERE uid in (?,?)';
    // 执行SQL语句
    pool.query(sql, [uid,uid2], (error, results) => {
      if (error) throw error;
      results.forEach(element => {
        coll.push(element.pid);
      });
      console.log(coll)
      if(coll.length>1){
        for(i=0;i<coll.length-1;i++){
          sq+=',?'
        }
        sql = `SELECT * FROM bride_case_list where cid in (${sq})`
      }else if(coll.length=1){
        sql = `SELECT * FROM bride_case_list where cid = ?`
      }
      
      pool.query(sql,coll,(err,results)=>{
        if(err) throw err;
        res.send(results);
      })
      
    });
  }else{
      // 获取地址栏的URL参数 -- 用户ID
      let uid = req.query.uid;
      let coll=[];
      let sq='?'
      // 查询特定记录的SQL语句
      let sql = 'SELECT pid FROM bride_collect WHERE uid=?';
      // 执行SQL语句
      pool.query(sql, [uid], (error, results) => {
        if (error) throw error;
        results.forEach(element => {
          coll.push(element.pid);
        });
        console.log(coll)
        if(coll.length>1){
          for(i=0;i<coll.length-1;i++){
            sq+=',?'
          }
          sql = `SELECT * FROM bride_case_list where cid in (${sq})`
        }else if(coll.length=1){
          sql = `SELECT * FROM bride_case_list where cid = ?`
        }
        
        pool.query(sql,coll,(err,results)=>{
          if(err) throw err;
          res.send(results);
        })
        
      });
  }
  
});

// 订单界面接口
router.get('/siteshopping', (req, res) => {

  if(req.query.uid2){
    // 获取地址栏的URL参数 -- 用户ID
  let uid = req.query.uid;
  let uid2 = req.query.uid2;
  let coll=[];
  let sq='?'
  // 查询特定记录的SQL语句
  let sql = 'SELECT pid FROM bride_shop WHERE uid in (?,?)';
  // 执行SQL语句
  pool.query(sql, [uid,uid2], (error, results) => {
    if (error) throw error;
    results.forEach(element => {
      coll.push(element.pid);
    });
    console.log(coll)
    if(coll.length>1){
      for(i=0;i<coll.length-1;i++){
        sq+=',?'
      }
      sql = `SELECT * FROM bride_case_list where cid in (${sq})`
    }else if(coll.length=1){
      sql = `SELECT * FROM bride_case_list where cid = ?`
    }
    
    pool.query(sql,coll,(err,results)=>{
      if(err) throw err;
      res.send(results);
    })
    
  });
}else{
    // 获取地址栏的URL参数 -- 用户ID
    let uid = req.query.uid;
    let coll=[];
    let sq='?'
    // 查询特定记录的SQL语句
    let sql = 'SELECT pid FROM bride_shop WHERE uid=?';
    // 执行SQL语句
    pool.query(sql, [uid], (error, results) => {
      if (error) throw error;
      results.forEach(element => {
        coll.push(element.pid);
      });
      console.log(coll)
      if(coll.length>1){
        for(i=0;i<coll.length-1;i++){
          sq+=',?'
        }
        sql = `SELECT * FROM bride_case_list where cid in (${sq})`
      }else if(coll.length=1){
        sql = `SELECT * FROM bride_case_list where cid = ?`
      }
      
      pool.query(sql,coll,(err,results)=>{
        if(err) throw err;
        res.send(results);
      })
      
    });
}
 });

//邀请界面接口
router.get("/join", (req, res) => {
  let phone = req.query.phone
  var sql = "select * from bride_user where phone=? ";
  pool.query(sql, [phone], (err, result) => {
    if (err) throw err;
    console.log(result.length)
    if(result.length==1){
      res.send({ code: 1, message: "查询成功", result: result[0] }) 
    }else{
      res.send({code:0,message:'查无此人'})
    }
   
  })
})

//客服消息接口
router.get("/service", (req, res) => {
  let user_id = req.query.user_id
  var sql = "select avatar,content,is_send,created_at from bride_service_messeage inner join bride_user on user_id=uid where user_id=? ";
  pool.query(sql, [user_id], (err, result) => {
    if (err) throw err;
    res.send({ code: 200, message: "查询成功", result: result })
  })
})
//客服消息插入数据库
router.post("/insertNew", (req, res) => {
  let obj = req.body;
  var sql = "INSERT INTO bride_service_messeage SET ?";
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