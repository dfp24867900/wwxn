<template>
  <div id="te">
    <!-- 页面顶部位置的内容区域 -->
    <div id="siteheader" v-if="isLogined == 1">
      <!-- 头像区域 -->
      <div>
        <p>
          <img
            :src="require(`../assets/image/site/avatar/${info.avatar}`)"
            alt=""
          />
        </p>
        <p v-if="isjoin==1">
          <router-link to="/join">
            <img :src="require(`../assets/image/site/avatar/${resu.avatar}`)" alt="" />
          </router-link>
        </p>
        <p v-else>
          <router-link to="/join">
            <img src="../assets/image/site/site_add.png" alt="" />
          </router-link>
        </p>
        <p>{{ info.nickname }}</p>
        <p>{{ info.address }}|{{ info.data }}</p>
      </div>
      <!-- 编辑资料 -->
      <div>
        <router-link to="/personal">
          <img src="../assets/image/site/site_alter.png" />
          <p>编辑资料</p>
        </router-link>
      </div>
    </div>
    <div id="sitehea" v-else>
      <div>
        <router-link to="/login">
          <p>登录</p>
        </router-link>
        <router-link to="/register">
          <p>注册</p>
        </router-link>
        <router-link to="">
          <p>
            <img src="../assets/image/site/avatar/avatar_de.jpg" alt="" />
          </p>
        </router-link>
      </div>
    </div>
    <!-- 中间选项区 -->
    <div>
      <mt-navbar class="site_nav">
        <p v-if="isLogined == 1">
          <router-link to="/sitenote">
            <mt-tab-item>
              <img src="../assets/image/site/site_note.png" alt="" slot="icon" />
              笔记
            </mt-tab-item>
          </router-link> 
        </p>
        <p v-else>
          <router-link to="/login" >
            <mt-tab-item>
             <img src="../assets/image/site/site_note.png" alt="" slot="icon" />
              笔记
            </mt-tab-item>
          </router-link>
        </p>
        <p v-if="isLogined == 1">
          <router-link :to="`/sitecollect/${info.uid}`" v-if="isjoin == 0">
          <mt-tab-item>
            <img
              src="../assets/image/site/site_collect.png"
              alt=""
              slot="icon"
            />
            收藏
          </mt-tab-item>
          </router-link>
          <router-link :to="`/sitecollect/${info.uid}/${resu.uid}`" v-else>
          <mt-tab-item>
            <img
              src="../assets/image/site/site_collect.png"
              alt=""
              slot="icon"
            />
            收藏
          </mt-tab-item>
          </router-link>
        </p>
        <p v-else>
          <router-link to="/login" >
          <mt-tab-item>
            <img
              src="../assets/image/site/site_collect.png"
              alt=""
              slot="icon"
            />
            收藏
          </mt-tab-item>
        </router-link>
        </p>
        <p v-if="isLogined == 1">
          <router-link to="/sitemsg" >
          <mt-tab-item>
            <img src="../assets/image/site/site_news.png" alt="" slot="icon" />
            消息
          </mt-tab-item>
        </router-link>
        </p>
        <p v-else>
          <router-link to="/login" >
          <mt-tab-item>
            <img src="../assets/image/site/site_news.png" alt="" slot="icon" />
            消息
          </mt-tab-item>
        </router-link>
        </p>
        
      </mt-navbar>
    </div>
    <!-- 中间轮播区 -->
    <div id="site_carousel">
      <mt-swipe :show-indicators="false">
        <mt-swipe-item>
          <img src="../assets/image/site/site_carousel_1.png" alt="" />
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/image/site/site_carousel_2.jpg" alt="" />
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 下方菜单选项区 -->
    <div id="site_menu">
      <!-- 我的订单 -->
      <p v-if="isLogined == 1">
        <router-link :to="`/siteshopping/${info.uid}`" v-if="isjoin == 0">
        <div>
          <img src="../assets/image/site/site_order.png" alt="" />
          <p>
            我的订单
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
        </router-link>
        <router-link :to="`/siteshopping/${info.uid}/${resu.uid}`" v-else>
        <div>
          <img src="../assets/image/site/site_order.png" alt="" />
          <p>
            我的订单
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
        </router-link>
      </p>
      <p v-else>
         <router-link to="/login">
        <div>
          <img src="../assets/image/site/site_order.png" alt="" />
          <p>
            我的订单
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
     
      <!-- 我的钱包 -->
      <p v-if="isLogined == 1">
        <router-link to="/sitegold">
        <div>
          <img src="../assets/image/site/site_wallet.png" alt="" />
          <p>
            我的钱包
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      <p v-else>
         <router-link to="/login">
        <div>
          <img src="../assets/image/site/site_wallet.png" alt="" />
          <p>
            我的钱包
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
     
      <!-- 我的客服 -->
      <p v-if="isLogined == 1">
        <router-link to="/service">
        <div>
          <img src="../assets/image/site/site_service.png" alt="" />
          <p>
            我的客服
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
        </router-link>
      </p>
      <p v-else>
        <router-link to="/login">
        <div>
          <img src="../assets/image/site/site_service.png" alt="" />
          <p>
            我的客服
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      
      <!-- 意见反馈 -->
      <p v-if="isLogined == 1">
        <router-link to="/siteback">
        <div>
          <img src="../assets/image/site/site_back.png" alt="" />
          <p>
            意见反馈
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      <p v-else>
        <router-link to="/login">
        <div>
          <img src="../assets/image/site/site_back.png" alt="" />
          <p>
            意见反馈
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      
      <!-- 设置 -->
      <p v-if="isLogined == 1">
        <router-link to="/siteset">
        <div>
          <img src="../assets/image/site/site_set.png" alt="" />
          <p>
            设置
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      <p v-else>
        <router-link to="/login">
        <div>
          <img src="../assets/image/site/site_set.png" alt="" />
          <p>
            设置
            <img src="../assets/image/site/site_right.png" alt="" />
          </p>
        </div>
      </router-link>
      </p>
      
    </div>
  </div>
</template>

<style>
/* 顶部内容区域 */
#siteheader,
#sitehea {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 180px;
  background-color: #F7DEDE;
  /* background-color: #ff93a0; */
  z-index: 8;
}
#siteheader > div:first-child,
#sitehea > div {
  width: 220px;
  height: 60px;
  position: absolute;
  top: 40px;
  left: 20px;
}
#sitehea > div > a > p {
  width: 30%;
  height: 50%;
  text-align: center;
  font-size: 22px;
  color: #999;
  position: absolute;
  top: 30%;
  left: 90%;
}
#sitehea > div > a:first-child > p {
  left: 50%;
}
#sitehea > div > a:nth-child(3) > p {
  top: 5%;
  left: 30px;
  width: 60px;
  height: 60px;
  border-radius: 50%;
  overflow: hidden;
}
#sitehea > div > a:nth-child(3) > p > img {
  width: 60px;
  height: 60px;
}
#siteheader > div:first-child > p:first-child {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 8;
}
#siteheader > div:first-child > p:first-child,
#siteheader > div:first-child > p:first-child > img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
#siteheader > div:first-child > p:nth-child(2) {
  position: absolute;
  top: 8px;
  left: 45px;
  width: 35px;
  height: 35px;
  overflow: hidden;
  background-color: #fff;
  box-shadow: 2px 2px 8px 1px #f5f5f5;
  border-radius: 50%;
  z-index: 7;
}
#siteheader > div:first-child > p:nth-child(2) img {
  position: absolute;
  width: 35px;
  height: 35px;
}
#siteheader > div:first-child > p:nth-child(3) {
  position: absolute;
  top: 10px;
  left: 100px;
  color: #666;
  font-size: 20px;
  font-family: "Microsoft Yahei";
}
#siteheader > div:first-child > p:nth-child(4) {
  position: absolute;
  top: 40px;
  left: 100px;
  color: #999;
  font-size: 12px;
  font-family: "Microsoft Yahei";
}
#siteheader > div:last-child {
  width: 23%;
  height: 12%;
  padding: 4px 10px 2px 10px;
  border-radius: 20px;
  position: absolute;
  left: 66%;
  top: 33%;
  border: 1px solid #f5f5f5;
}
#siteheader > div:last-child img {
  position: absolute;
  top: 23%;
}
#siteheader > div:last-child > a > p {
  position: absolute;
  color: #999;
  top: 23%;
  left: 27%;
}

/* 悬浮选项卡的位置 */
.site_nav {
  box-shadow: 2px 2px 6px 2px #f5f5f5;
  font-size: 16px;
  color: #333;
  width: 94%;
  position: absolute;
  top: 150px;
  left: 3%;
  border-radius: 5px;
  z-index: 10;
}
.site_nav > p {
  width: 33%;
}
.site_nav > p >a {
  width: 100%;
}

/* 轮播区域的样式 */
#site_carousel {
  width: 94%;
  height: 140px;
  position: absolute;
  top: 233px;
  left: 2.8%;
  border: 0;
  background-color: #000;
  border-radius: 5px;
  overflow: hidden;
  z-index: 10;
}
#site_carousel img {
  width: 100%;
  border: 0;
}

/* 下方菜单区域的样式 */
#site_menu {
  width: 93%;
  height: 400px;
  margin-bottom: 55px;
  border-radius: 5px;
  box-shadow: 2px 3px 6px 3px #ccc;
  position: absolute;
  top: 380px;
  left: 3%;
}
#site_menu > p{
  position: relative;
  padding: 3% 1%;
}
#site_menu > p:first-child{
  top: 1%;
}
#site_menu > p:nth-child(2){
  top: 5%;
}
#site_menu > p:nth-child(3){
  top: 9%;
}
#site_menu > p:nth-child(4){
  top: 13%;
}
#site_menu > p:nth-child(5){
  top: 17%;
}
#site_menu >p> a > div {
  position: relative;
  width: 100%;
  height: 12%;
}
#site_menu >p> a > div > img {
  position: absolute;
  top: 30%;
  left: 3%;
}
#site_menu >p> a > div > p {
  position: absolute;
  width: 90%;
  top: 30%;
  left: 10%;
  color: #333;
  font-family: "Microsoft Yahei";
}
#site_menu >p> a > div > p > img {
  position: absolute;
  left: 90%;
}
</style>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["isLogined", "info",'isjoin','resu']),
  },
  data() {
    return {
      selected:'MianPage',
    };
  },
};
</script>