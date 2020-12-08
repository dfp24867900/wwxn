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

module.exports=router;