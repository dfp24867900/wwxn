<template>
  <div class="index">
    <mt-header title="时尚新娘" fixed class="my-header">
      <router-link to="/" slot="left"
        ><span class="left iconfont icon-fangdajing"></span
      ></router-link>
      <router-link to="/" slot="right"
        ><span class="right iconfont icon-xinxi"></span
      ></router-link>
    </mt-header>

    <!-- 轮播图开始 -->
    <mt-swipe :auto="4000" class="swipe">
      <mt-swipe-item>
        <router-link to="/">
          <img src="img/lb1.jpg" alt="" class="swipe-img" />
        </router-link>
      </mt-swipe-item>
      <mt-swipe-item>
        <router-link to="/">
          <img src="img/lb2.jpg" alt="" class="swipe-img" />
        </router-link>
      </mt-swipe-item>
    </mt-swipe>
    <!-- 轮播图结束 -->
    <!-- 分栏一开始 -->
    <div class="nav">
      <ul>
        <li>
          <router-link :to="`/album/${Z1[0]}`" class="nav-item"
            ><span class="color-c3 iconfont icon-zhuanji"></span
          ></router-link>
          <span>专辑</span>
        </li>
        <li>
          <router-link to="/list" class="nav-item"
            ><span class="color-c3 iconfont icon-shipin1"></span
          ></router-link>
          <span>案例</span>
        </li>
        <li>
          <router-link :to="`/album/${Z1[1]}`" class="nav-item"
            ><span class="color-c3 iconfont icon-huodong"></span
          ></router-link>
          <span>活动</span>
        </li>
        <li>
          <router-link to="/" class="nav-item"
            ><span class="color-c3 iconfont icon-daojishi"></span
          ></router-link>
          <span>倒计时</span>
        </li>
        <li>
          <router-link to="/" class="nav-item"
            ><span class="color-c3 iconfont icon-qiandao"></span
          ></router-link>
          <span>签到</span>
        </li>
      </ul>
    </div>
    <!-- 分栏一结束 -->

    <!-- 主内容区域开始-->
    
        <mt-navbar v-model="active" class="tabbar">
          <mt-tab-item class="tab-bar" :id="index+''" v-for="(item, index) of category" :key="index" >{{ item }}</mt-tab-item>
        </mt-navbar>
    

    <!-- 住内容开始 -->

    <div class="main">
      <mt-tab-container v-model="active" swipeable>
        <mt-tab-container-item :id="active">
          <!-- 单一文章开始 -->
          <div class="page" v-for="(item,index) of articles" :key="index">
            <!-- 图片 -->
                        <div>
                            <router-link :to="`/message/${item.id}`">
                                <img v-lazy="item.img" alt="">
                                <p class="span4">{{item.description}}</p>
                            </router-link>
                        </div>
                        <div class="title-bar clearfix">
                            <img class="small-photo" v-lazy="item.header_img" alt="">
                            <span class="title">{{item.author}}</span>
                            <span class="vip" v-if="item.vip">VIP</span>
                            <span class="xin iconfont icon-xin rf">&nbsp;{{item.like_up}}</span>
                        </div>
          </div>
            <!-- 制作人及点赞 -->  
          <!-- 单一文章结束 -->
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <!-- 主内容区域结束-->
    <my-footer></my-footer>
  </div>
</template>
<style>
.rf{
  float: right;
}
.clearfix::after{
  content: "";
  display: block;
  clear: both;
}
.index .color-c3 {
  color: pink;
}
/* 设置头部 */
.index > .my-header {
  background-color: #fff;
  color: pink;
}
.index > .my-header .left {
  font-weight: 1000;
  font-size: 18px;
  margin-left: 10px;
}
.index > .my-header .right {
  font-weight: 900;
  font-size: 18px;
  margin-right: 10px;
}
/* 头部设置结束 */
/* 设置轮播图 */
.index > .swipe {
  margin-top: 40px;
  width: 100%;
  height: 170px;
}
.index > .swipe .swipe-img {
  width: 100%;
}
/* 轮播图设置结束 */

/* 设置分栏一 */
.index > .nav {
  margin-top: 15px;
  margin-left: 15px;
  margin-right: 15px;
}
.index > .nav > ul {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.index > .nav > ul .nav-item {
  display: block;
  width: 50px;
  height: 50px;
  border: 1px solid #ccc;
  border-radius: 10px;
}
.index > .nav > ul .nav-item span {
  font-size: 26px;
  line-height: 50px;
}
.index > .nav > ul > li > span {
  display: block;
  margin-top: 5px;
  font-size: 12px;
}
/* 分栏一设置结束 */
/* 设置导航栏 */
.swipe-navbar {
  margin-top: 10px;
  width: 100%;
  box-shadow: 0px 3px 5px #ccc;
  height: 30px !important;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 2px solid pink !important;
  color: pink !important;
  margin-bottom: -1px !important;
}

.index > .tabbar {
  width: 100%;
  
  padding-top: 10px;
  position: sticky;
  top: 0px;
  z-index: 100;
}
.index .tabbar > .tab-bar {
  box-sizing: border-box;
  padding: 8px 0;
}
.index {
  text-align: left;
}
.index > .nav {
  text-align: center;
}
/* 设置导航栏结束 */
/* 主内容区域 */
.index > .main {
  margin-top: 5px;
}
.index > .main .page .span4 {
  overflow: hidden;
  color: #666;
  font-size: 12px;
  white-space:nowrap;
  text-overflow: ellipsis ;
  margin: 5px 5px;
}
.index > .main .page {
  margin: 5px 7px;
  width: 170px;
  height: 240px;
  float: left;
  border: 1px solid #ddd;
  border-radius: 5px;
}
.index > .main .page > div img {
  width: 100%;
  height: 190px;
}
.index > .main .page>.title-bar{
    margin-top: 8px;
    margin-bottom: 6px;
}
.index > .main .page>.title-bar>.small-photo{
    margin-left: 5px;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    vertical-align: middle;
    
}
.index > .main .page>.title-bar>.title{
    margin-left: 3px;
    color: #888;
    font-size: 12px;
    line-height: 23px;
}
.index > .main .page>.title-bar>.vip{
    display: inline-block;
    transform: scale(0.6);
    font-size: 12px;
    padding: 3px 7px;
    margin-left: 8px;
    color: #c3ac66;
    background-color: #000;
    border-radius: 10px;
}
.index > .main .page>.title-bar>.xin{
    margin-right: 10px;
    font-size: 12px;
    line-height: 25px;
}


</style>
<script>
export default {
  data() {
    return {
      active: "0",
      category: ["推荐", "时尚星闻", "主题婚礼", "婚纱礼服"],
      articles:[],
      Z1:[1,2]
    }
  },
  methods:{
    load(){
       /* 获取主内容的信息 */
      this.axios.get('/index/art',{
        params:{
          id:this.active
        }
      }).then(res=>{
        this.articles = res.data.results;
      })
    }
  },
  mounted(){
    this.load();
  },
  watch:{
    active(){
      this.load();
    }
  }
};
</script>