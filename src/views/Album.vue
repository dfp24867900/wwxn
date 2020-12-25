<template>
  <div class="album">
    <!-- 头部 -->
    <mt-header title="专辑&活动" fixed class="my-header">
    </mt-header>
    <!-- 主内容 -->
    <div class="main">
      <div class="area" v-for="(item, index) of imgArr" :key="index">
        <router-link to="/list">
          <img class="area-img" v-lazy="`/${item.img}`" alt="" />
        </router-link>
      </div>
    </div>
  </div>
</template>
<style>
.album > .my-header {
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #000 !important;
  box-shadow: 0 1px 1px #ccc;
}
.album > .main {
  width: 100%;
  overflow: auto;
}
.album .main img{
  width: 100%;
}
</style>
<script>
export default {
  data() {
    return {
      imgArr: [],
    };
  },
  methods: {
    didiback() {
      window.history.go(-1);
    },
  },
  mounted() {
    //获取主页传递的参数
    let id = this.$route.params.id;
    //发送请求
    this.axios
      .get("/index/alb", {
        params: {
          id: id,
        },
      })
      .then((res) => {
        this.imgArr = res.data.result;
      });
  },
};
</script>