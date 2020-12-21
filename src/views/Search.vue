<template>
  <div id="search">
    <!-- 顶部导航开始 -->
    <div class="header">
      <router-link to="/"><img src="../assets/image/icon/back.png" alt="" /></router-link>
      <input v-model="keyword" type="text" placeholder="请输入关键字" @keydown.13="search"/>
      <button @click="search">搜索</button>
    </div>
    <!-- 顶部导航结束 -->
    <!-- 历史搜索 开始-->
    <div class="history_search">
      <p>历史搜索</p>
      <div>
        <router-link :to="`searchlist/${historySearch.history_word}`" v-for="(historySearch,i) of historySearchs" :key="i">{{historySearch.history_word}}</router-link>
      </div>
    </div>
    <!-- 历史搜索结束 -->
    <!-- 热门搜索开始 -->
    <div class="hot_search">
      <p>热门搜索</p>
      <div>
        <router-link :to="`searchlist/${hotSearch}`" v-for="(hotSearch,i) of hotSearchs" :key="i">{{hotSearch}}</router-link>
      </div>
    </div>
    <!-- 热门搜索结束 -->
  </div>
</template>
<script>
export default {
  data(){
    return {
      keyword:"",
      historySearchs:[],
      hotSearchs:["户外","草坪","粉色","唯美","小清新"]
    }
  },
  methods:{
    search(){
      if(this.keyword==""){
        this.$toast({
          message: "请输入关键字",
          position: "middle",
          duration: 1000,
        });
      }else{
        this.$router.push(`searchlist/${this.keyword}`)
      }
    },
  },
  mounted(){
    this.axios
        .get("/list/historyword", { params: { keyword: this.keyword } })
        .then((result) => {
          this.historySearchs=result.data.result
        });
  }
}
</script>

<style>
#search .header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 45px;
  border: 0px;
}
#search .header input {
  width: 70%;
  background-color: #eee;
  height: 33px;
  border: 0px;
  border-radius: 45px;
  padding: 0px 15px;
  font-size: 14px;  
}
#search .header button,
#search .header a{
  display: block;
  width: 15%;
  height: 45px;
  font-size: 14px;
  line-height: 45px;
  text-align: center;
  background-color: rgba(0, 0, 0, 0);
  border: 0px;
  color: #000;
}
#search .header a > img {
  margin-top: 12px;
  width: 20px;
}
#search .history_search,
#search .hot_search {
  margin: 20px 30px 40px;
}
#search .history_search > p,
#search .hot_search > p {
  font-size: 18px;
  margin-bottom: 15px;
}
#search .history_search>div,#search .hot_search>div{
    display: flex;
    flex-wrap: wrap ;
}
#search .history_search  a,
#search .hot_search  a {
  color: #000;
  display: block;
  text-align: center;
  height: 28px;
  line-height: 30px;
  font-size: 14px;
  padding: 0px 15px;
  border-radius: 28px;
  background-color: #eee;
  margin: 5px 8px;

}
</style>
