<template>
  <div id="ab">
    <!-- 页面头部 -->
    <mt-header title="关于我们" class="ab_header">
      <router-link to="/siteset" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 图片展示 -->
    <div>
      <img src="../assets/image/site/collect/collect_sur.jpg" alt="" />
    </div>
    <!-- 文字说明 -->
    <div>
      <p class="text">
        是一家专注于定制婚礼的网站，价格透明，无中间差价，新人可以通过找我婚礼轻松找到满意的婚礼人（策划师、主持人、摄影师、摄像师、化妆师等），避开中间环节直接在线预订婚礼。
      </p>
    </div>
  </div>
</template>

<style >
#ab > .ab_header {
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
  border-bottom: 1px solid #ccc;
}
#ab > div:first-child {
  position: absolute;
  top: 10%;
  width: 360px;
  height: 20%;
  overflow: hidden;
}
@media (min-width: 375px) {
  #ab > div > img {
    width: 375px;
  }
}

@media (min-width: 667px) {
  #ab > div > img {
    width: 667px;
  }
}
.text{
  color:#666;
  padding:5px;
  line-height:25px;
}
</style>