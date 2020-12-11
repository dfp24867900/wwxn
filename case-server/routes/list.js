const express=require("express");
// 创建路由
const router=express.Router();

const pool=require("../pool");
//获取列表的信息
router.get("/defaults",(req,res)=>{
  let sql="select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list";
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:"查询成功",code:200,results:result});
  })
});

//获取按照价格升序的列表信息
router.get("/price_asc",(req,res)=>{
 let sql="select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by price asc";
 pool.query(sql,(err,result)=>{
     if(err) throw err;
     res.send({message:"查找成功",code:200,results:result});
 })
});
//获取按照价格降序的列表信息
router.get("/price_desc",(req,res)=>{
  let sql="select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by price desc";
  pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({message:"查询成功",code:200,results:result});
  })
})
module.exports=router;