<template>
  <footer class="footer_guide">
    <a
      href="javascript:;"
      class="guide_item"
      :class="{ on: '/index' === $route.path || '/' === $route.path }"
      @click="goTo('/index')"
    >
      <span class="item_icon">
        <i class="iconfont icon-shouye"></i>
      </span>
      <span>首页</span>
    </a>
    <a
      href="javascript:;"
      class="guide_item"
      :class="{ on: '/list' === $route.path }"
      @click="goTo('/list')"
    >
      <span class="item_icon">
        <i class="iconfont icon-xingqiu2"></i>
      </span>
      <span>案例</span>
    </a>
    <a
      href="javascript:;"
      class="guide_item"
      :class="{ on: `/album/${Z1[1]}&${B1[1]}` === $route.path }"
      @click="goTo(`/album/${Z1[1]}&${B1[1]}`)"
    >
      <span class="item_icon">
        <i class="iconfont icon-huodong"></i>
      </span>
      <span>活动</span>
    </a>
    <a
      href="javascript:;"
      class="guide_item"
      :class="{ on: '/site' === $route.path }"
      @click="goTo('/site')"
    >
      <span class="item_icon">
        <i class="iconfont icon-wo"></i>
      </span>
      <span>我的</span>
    </a>
  </footer>
</template>
<script>
export default {
  data() {
    return {
      Z1:[1,2],
      B1:['专辑','活动'],
    }
  },
  methods: {
    goTo(path) {
      this.$router.replace(path);
    },
  },
};
</script>
 
<style>
.footer_guide {
  position: fixed;
  z-index: 100;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #fff;
  width: 100%;
  height: 50px;
  display: flex;
  border-top: 1px solid #e8e8e8;
}
.guide_item {
  display: flex;
  flex: 1;
  text-align: center;
  flex-direction: column;
  align-items: center;
  margin: 5px;
  color: #999999;
}
a.on {
   color: pink;
}
.guide_item span {
  font-size: 12px;
  margin-top: 2px;
  margin-bottom: 2px;
}
.guide_item span .iconfont {
  font-size: 22px;
  position: relative;
}
.cartcount{
  color:green;
  position:absolute;
  top:-6px;
  left:18px;
  border-radius: 10px;
  background: red;
  padding:2px;
  font-size:10px;
}
</style>