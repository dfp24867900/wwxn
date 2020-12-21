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
router.get('/information',(req,res)=>{
  let id=req.query.id;
  let sql = 'SELECT * FROM bride_case_list where cid=?';
  pool.query(sql,[id],(err,results)=>{
      if(err) throw err;
      res.send({code:200,message:'查询数据成功',results:results[0]})
      // console.log(results)
  })
});

// 获取团队信息表
router.get('/team',(req,res)=>{
  let id = req.query.tid
let sql = 'SELECT tid,tname, portrait,job,emolument FROM bride_wedding_team INNER JOIN bride_case_list ON bride_list_id=cid WHERE cid=?'
pool.query(sql,[id],(err,results)=>{
if(err) throw err;
res.send({code:200,message:'查询数据成功',results:results})

})
});

// 获取价格明细表
router.get('/quotations',(req,res)=>{
  let id = req.query.qid
  let sql = 'SELECT quid,item, serContent,servicelevel,univalence,amount,unit FROM bribe_details_quotations INNER JOIN bride_case_list ON bride_list_id=cid WHERE cid=?'
  pool.query(sql,[id],(err,results)=>{
    if(err) throw err;
    res.send({code:200,message:'查询数据成功',results:results})
    
  })
});

// 获取新人评论表
router.get('/comment',(req,res)=>{
    let id = req.query.cid
let sql = 'SELECT evid,usericon, mName,staff,content,score FROM bribe_details_evaluate INNER JOIN bride_case_list ON bride_list_id=cid WHERE cid=?'
pool.query(sql,[id],(err,results)=>{
  if(err) throw err;
  res.send({code:200,message:'查询数据成功',results:results})
  
})
});

// 添加收藏
router.get('/collection',(req,res)=>{
  let id = req.query.proid;
  let uid = req.query.uid;
  let sql = 'SELECT title,price,pic,visits,manner FROM bride_case_list  INNER JOIN bride_collect where collid=?';
  pool.query(sql,[proid,uid],(err,results)=>{
    if(err) throw err;
    if(results.affectedRows>0){
      res.send({code:1,message: '添加成功'});
    } else {
      res.send({code:0,message: '添加失败'})
    }
  })
});


module.exports = router;