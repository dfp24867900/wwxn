const express = require("express");
// 创建路由
const router = express.Router();

const pool = require("../pool");


// 获取详情页的分类
router.get("/category",(req,res)=>{
  //获取bribe_category里面的全部数据
  let sql = 'SELECT id,category_name FROM bribe_category ORDER BY id';
  //执行SQL查询语句
  pool.query(sql,(err,results)=>{
    if(err) throw err;
    res.send({code:200,message:'查询数据成功',results:results});
  });
});

// 获取指定分类下的信息内容
// router.get('/information',(req,res)=>{
//     // 获取地址栏中的参数

//   res.send("ok")


// });





module.exports = router;