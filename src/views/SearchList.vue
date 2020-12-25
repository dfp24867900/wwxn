<template>
  <div id="searchList">
    <!-- 顶部导航开始 -->
    <div class="myheader">
      <div class="header">
        <router-link to="/search"
          ><img src="../assets/image/icon/back.png" alt=""
        /></router-link>
        <input
          v-model="keyword"
          type="text"
          placeholder="请输入关键字"
          @keydown.13="searchwrod"
        />
        <button @click="searchwrod">搜索</button>
      </div>
    </div>
    <!-- 顶部导航栏结束 -->
    <!-- 列表详情开始 -->
    <p class="not_found" v-show="found == 1">
      没有搜索到合适的！下面的说不定能找到呦
    </p>
    <div class="list" v-for="(detail, i) of lists" :key="i">
      <router-link :to="`/details/${detail.cid}`">
        <div><img v-lazy="detail.pic" alt="" /></div>
        <div class="mycontent">
          <p>{{ detail.title }}</p>
          <p>
            <span>#{{ detail.manner }}</span>
            <span>#{{ detail.scene }}</span>
            <span>#{{ detail.color }}</span>
          </p>
          <p class="price">
            <span>¥{{ detail.price.toFixed(2) }}</span>
            <span>
              <div><img src="/img/icon/icon.png" alt="" /></div>
              <span>{{ detail.visits }}人浏览</span>
            </span>
          </p>
        </div>
      </router-link>
    </div>
    <!-- 列表详情结束 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      keyword: "",
      lists: [],
      found: 1,
      historySearchs: [],
      history_word: [],
    };
  },
  methods: {
    //搜索按钮事件
    searchwrod() {
      if (this.keyword == "") {
        this.$toast({
          message: "请输入关键字",
          position: "middle",
          duration: 1000,
        });
      } else {
        this.lists = [];
        this.search();
      }
    },
    //查找关键字相关的数据
    search() {
      this.addhistoryword();
      this.axios
        .get("/list/searchlist", { params: { keyword: this.keyword } })
        .then((result) => {
          if (result.data.code == 200) {
            this.found = 0;
            let lists = result.data.result;
            lists.forEach((list) => {
              list.pic = require("../assets/image/list/" + list.pic);
              this.lists.push(list);
            });
          } else {
            this.found = 1;
            this.axios.get("/list/defaults").then((result) => {
              let lists = result.data.results;
              lists.forEach((list) => {
                list.pic = require("../assets/image/list/" + list.pic);
                this.lists.push(list);
              });
            });
          }
        });
    },
    //添加搜索历史到数据库
    addhistoryword() {
      //从数据库查找历史搜索
      this.axios
        .get("/list/historyword", { params: { keyword: this.keyword } })
        .then((result) => {
          this.historySearchs = result.data.result;
          result.data.result.forEach((aa) => {
            this.history_word.push(aa.history_word);
          });
          if (this.history_word.indexOf(this.keyword) == -1) {
            this.axios
              .post("/list/addhistoryword", `history_word=${this.keyword}`)
              .then((result) => {});
          }
        });
    },
  },
  //初次加载页面
  mounted() {
    //从地址栏获取传递的参数
    this.keyword = this.$route.params.keyword;
    this.search();
  },
};
</script>

<style>
#searchList .myheader {
  height: 45px;
}
#searchList .header {
  width: 100%;
  background-color: #fff;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border: 0px;
  position: fixed;
}
#searchList .header input {
  width: 70%;
  background-color: #eee;
  height: 33px;
  border: 0px;
  border-radius: 45px;
  padding: 0px 15px;
  font-size: 14px;
}
#searchList .header button,
#searchList .header a {
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
#searchList .header a > img {
  margin-top: 12px;
  width: 20px;
}
#searchList .not_found {
  text-align: center;
  font-size: 14px;
  padding: 20px 0px;
  border-top: 5px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#searchList .list > a {
  display: flex;
  padding: 8px 15px;
}
#searchList .list > a > div:first-child {
  margin-right: 10px;
  width: 50%;
  height: 90px;
  overflow: hidden;
}
#searchList .list > a > div:nth-child(2) {
  width: 50%;
  height: 90px;
}
#searchList .list > a > div img {
  width: 100%;
  border-radius: 5px;
}
#searchList .list > a span div {
  width: 1rem;
  height: 1rem;
  margin-right: 5px;
}
#searchList .price {
  display: flex;
  justify-content: space-between;
}
#searchList .price span:last-child {
  display: flex;
}
#searchList .mycontent p {
  margin: 8px 0;
}
#searchList .mycontent p:nth-child(2) > span {
  padding-right: 10px;
}
#searchList .mycontent p:first-child {
  font-size: 18px;
  color: #000;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
#searchList .mycontent p:not(:first-child) {
  font-size: 13px;
  color: #999;
}
#searchList .mycontent p:nth-child(3) {
  margin-top: 20px;
}
#searchList .mycontent p:nth-child(3) span {
  line-height: 15px;
}
#searchList .mycontent p:nth-child(3) span:first-child {
  font-weight: bold;
  color: #f00;
  font-size: 14px;
}
</style>