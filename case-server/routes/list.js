const express = require("express");
// 创建路由
const router = express.Router();

const pool = require("../pool");
//获取列表的信息
router.get("/defaults", (req, res) => {
  let sql = "select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 200, results: result });
  })
});

//获取按照价格升序的列表信息
router.get("/price_asc", (req, res) => {
  let sql = "select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by price asc";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({ message: "查找成功", code: 200, results: result });
  })
});
//获取按照价格降序的列表信息
router.get("/price_desc", (req, res) => {
  let sql = "select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by price desc";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    res.send({ message: "查询成功", code: 200, results: result });
  })
});
//获取按照浏览量升序的列表信息
router.get("/vistis_asc", (req, res) => {
  let sql = "select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by visits asc"
  pool.query(sql, (err, result) => {
    if (err) throw error;
    res.send({ message: "查询成功", code: 200, results: result });
  })
});
//获取按照浏览量降序的列表信息
router.get("/vistis_desc", (req, res) => {
  let sql = "select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list order by visits desc"
  pool.query(sql, (err, result) => {
    if (err) throw error;
    res.send({ message: "查询成功", code: 200, results: result });
  })
})
//模糊搜索列表页
router.get("/searchlist", (req, res) => {
  let keyword = "%"+req.query.keyword+"%";
  let array = []; 
  let sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where title like ?"
  pool.query(sql, [keyword], (err, result) => {
    if (err) throw error;
    result.forEach(ele => {
      array.push(ele)
    })
    sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where visits like ?"
    pool.query(sql, [keyword], (err, result) => {
      if (err) throw error;
      result.forEach(ele => {
        array.push(ele)
      })
      sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where manner like ?"
      pool.query(sql, [keyword], (err, result) => {
        if (err) throw error;
        result.forEach(ele => {
          array.push(ele)
        })
        sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where scene like ?"
        pool.query(sql, [keyword], (err, result) => {
          if (err) throw error;
          result.forEach(ele => {
            array.push(ele)
          })
          sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where case_address like ?"
          pool.query(sql, [keyword], (err, result) => {
            if (err) throw error;
            result.forEach(ele => {
              array.push(ele)
            })
            sql = "select cid,pic,visits,price,scene,title,manner,color from bride_case_list where color like ?"
            pool.query(sql, [keyword], (err, result) => {
              if (err) throw error;
              result.forEach(ele => {
                array.push(ele)
              })
              if(array.length>0){
                res.send({ message: "查询成功", code: 200, result: array })
              }else{
                res.send({ message: "查询失败", code: 201})
              }
            })
          })
        })
      })
    })
  })
})
//获取历史查询
router.get("/historyword", (req, res) => {
  let sql = "select history_word from bride_search_history order by mid desc limit 8"
  pool.query(sql, (err, result) => {
    if (err) throw error;
    res.send({ message: "查询成功", code: 200, result: result });
  })
})
//插入查询记录
router.post("/addhistoryword", (req, res) => {
  let history_word=req.body.history_word
  let sql = "insert bride_search_history(history_word) values(?)"
  pool.query(sql,[history_word],(err, result) => {
    if (err) throw error;
    res.send({ message: "插入成功", code: 200, result: result });
  })
});
router.get("/scene",(req,res)=>{
  let scene=req.query.alt;
  console.log(scene);
  let sql="select cid,pic,visits,price,scene,title,manner,scene,color from bride_case_list where scene like ? ";
  pool.query(sql,[scene],(err,result)=>{
    if(err) console.log(err);
    if(result.length>0){
      res.send({message:"查询成功",code:200,results:result});
    }else{
      res.send({message:"查询失败",code:400});
    }
  })
})
module.exports = router;