<template>
  <div id="search">
    <!-- 顶部导航开始 -->
    <div class="header">
      <button><img src="../assets/image/icon/back.png" alt="" /></button>
      <input type="text" placeholder="请输入关键字" />
      <button>搜索</button>
    </div>
    <div class="history_search">
      <p>历史搜索</p>
      <div>
        <router-link to="list">中式</router-link>
        <router-link to="list">西式</router-link>
      </div>
    </div>
    <div class="hot_search">
      <p>热门搜索</p>
      <div>
        <router-link to="list">户外</router-link>
        <router-link to="list">草坪</router-link>
        <router-link to="list">粉色</router-link>
        <router-link to="list">粉色</router-link>
        <router-link to="list">粉色</router-link>
        <router-link to="list">粉色</router-link>
        <router-link to="list">粉色</router-link>
        <router-link to="list">粉色</router-link>
      </div>
    </div>
  </div>
</template>

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
#search .header button {
  width: 15%;
  height: 45px;
  font-size: 14px;
  background-color: rgba(0, 0, 0, 0);
  border: 0px;
  color: #666;
}
#search .header button > img {
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
  line-height: 28px;
  font-size: 14px;
  width: 65px;
  border-radius: 28px;
  background-color: #eee;
  margin: 5px;
}
</style>
