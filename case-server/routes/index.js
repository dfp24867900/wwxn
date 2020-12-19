const express=require("express");
// 创建路由
const router=express.Router();

const pool=require("../pool");

// 测试接口：127.0.0.1:3000/index/index
router.get('/index',(req,res)=>{
   let sql='select * from xz_index_product';
   pool.query(sql,(err,result)=>{
      if(err) throw err
      if(result.length>0){
         res.send({code:1,msg:"查询成功",data:result})
      }else{
         res.send({code:0,msg:"查询失败"})
      }
   })
})


//查询首页主内容信息
router.get('/art',(req,res)=>{
  let id = req.query.id;
  let sql = `SELECT id,img,description,author,vip,header_img,like_up FROM bride_header WHERE category_id=?`;
  pool.query(sql,[id],(err,results)=>{
    if(err) throw err;
    res.send({code:200,message:'请求成功',results:results});
  })
})
//获取活动页和专辑页的图片
router.get('/alb',(req,res)=>{
  let id = req.query.id;
  let sql = 'SELECT id,img FROM bride_activity WHERE activity_id=?';
  pool.query(sql,[id],(err,result)=>{
    if(err) throw err;
    res.send({code:200,message:'请求成功',result:result});
  
  })
})
//获取主页详情页的图片
router.get('/msg',(req,res)=>{
  let id = req.query.id;
  // let id = req.params.id;

  let sql = 'SELECT imgOne,imgTwo FROM bride_message WHERE id=?';
  pool.query(sql,[id],(err,result)=>{
    if(err) throw err;
    res.send({code:200,message:'请求成功',result:result[0]});
  }) 
})
module.exports=router;