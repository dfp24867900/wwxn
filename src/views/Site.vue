<template>
  <div id="te">
    <!-- 页面顶部位置的内容区域 -->
    <div id="siteheader">
      <!-- 头像区域 -->
      <div>
        <p>
          <img src="../assets/image/site/site_avatar.jpg" alt="" />
        </p>
        <p>
          <router-link to="/join">
            <img src="../assets/image/site/site_add.png" alt="" />
          </router-link> 
        </p>
        <p>Z-sum</p>
        <p>布拉市|2522年12月</p>
      </div>
      <!-- 编辑资料 -->
      <div>
        <router-link to="/personal">
          <img src="../assets/image/site/site_alter.png" />
          <p>编辑资料</p>
        </router-link>
      </div>
    </div>
    <!-- 中间选项区 -->
    <div>
      <mt-navbar class="site_nav">
        <router-link to="/sitenote">
          <mt-tab-item>
            <img src="../assets/image/site/site_note.png" alt="" slot="icon" />
            笔记
          </mt-tab-item>
        </router-link>
        <router-link to="/sitecollect">
          <mt-tab-item>
            <img src="../assets/image/site/site_collect.png" alt="" slot="icon" />
            收藏
          </mt-tab-item>
        </router-link>
        <router-link to="/sitemsg">
          <mt-tab-item>
            <img src="../assets/image/site/site_news.png" alt="" slot="icon" />
            消息
          </mt-tab-item>
        </router-link>
      </mt-navbar>
    </div>
    <!-- 中间轮播区 -->
    <div id="site_carousel">
      <mt-swipe :show-indicators="false">
        <mt-swipe-item>
          <img src="../assets/image/site/site_carousel_1.png" alt="">
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/image/site/site_carousel_2.jpg" alt="">
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 下方菜单选项区 -->
    <div id="site_menu">
      <!-- 我的订单 -->
      <div>
        <img src="../assets/image/site/site_order.png" alt="" />
        <p>
          我的订单
          <router-link to="/siteshopping">
            <img src="../assets/image/site/site_right.png" alt="">
          </router-link>
        </p>
      </div>
      <!-- 我的钱包 -->
      <div>
        <img src="../assets/image/site/site_wallet.png" alt="" />
        <p>
          我的钱包
          <router-link to="/sitegold">
            <img src="../assets/image/site/site_right.png" alt="">
          </router-link>
        </p>
      </div>
      <!-- 我的客服 -->
      <div>
        <img src="../assets/image/site/site_service.png" alt="" />
        <p>
          我的客服
          <router-link to="/siteshopping">
            <img src="../assets/image/site/site_right.png" alt="">
          </router-link>
        </p>
      </div>
      <!-- 意见反馈 -->
      <div>
        <img src="../assets/image/site/site_back.png" alt="" />
        <p>
          意见反馈
          <router-link to="/siteback">
            <img src="../assets/image/site/site_right.png" alt="">
          </router-link>
        </p>
      </div>
      <!-- 设置 -->
      <div>
        <img src="../assets/image/site/site_set.png" alt="" />
        <p>
          设置
          <router-link to="/siteset">
            <img src="../assets/image/site/site_right.png" alt="">
          </router-link>
        </p>
      </div>
    </div>
  </div>
</template>

<style>
/* 顶部内容区域 */
#siteheader {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 180px;
  background-color: #ff93a0;
  z-index: 8;
}
#siteheader > div:first-child {
  width: 220px;
  height: 60px;
  position: absolute;
  top: 40px;
  left: 20px;
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
  width: 40px;
  height: 40px;
  background-color: #fff;
  box-shadow: 2px 2px 8px 1px #f5f5f5;
  border-radius: 50%;
  z-index: 7;
}
#siteheader > div:first-child > p:nth-child(2)   img {
  position: absolute;
  top: 12px;
  left: 12px;
  width: 15px;
  height: 15px;
}
#siteheader > div:first-child > p:nth-child(3) {
  position: absolute;
  top: 10px;
  left: 100px;
  color: #f5f5f5;
  font-size: 20px;
  font-family: "Microsoft Yahei";
}
#siteheader > div:first-child > p:nth-child(4) {
  position: absolute;
  top: 40px;
  left: 100px;
  color: #e7dddd;
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
#siteheader > div:last-child img{
  position: absolute;
  top: 23%;
}
#siteheader > div:last-child>a>p{
  position: absolute;
  color: #f5f5f5;
  top:23%;
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
  left:3%;
  border-radius: 5px;
  z-index: 10;
}
.site_nav>a{
  width: 33%;
}

/* 轮播区域的样式 */
#site_carousel{
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
#site_carousel img{
  width: 100%;
  border: 0;
}

/* 下方菜单区域的样式 */
#site_menu{
  width: 93%;
  height: 400px;
  margin-bottom: 55px;
  border-radius: 5px;
  box-shadow: 2px 3px 6px 3px #ccc;
  position: absolute;
  top: 380px;
  left: 3%;
}
#site_menu>div{
  position: relative;
  width: 100%;
  height: 12%;
}
#site_menu>div>img{
  position: absolute;
  top: 30%;
  left: 3%;
}
#site_menu>div>p{
  position: absolute;
  width: 90%;
  top: 30%;
  left: 10%;
  color: #333;
  font-family: "Microsoft Yahei";
}
#site_menu>div>p>a>img{ 
  position: absolute;
  left: 90%;
}

</style>

<script>
export default {
  data() {
    return {};
  },
};
</script>>