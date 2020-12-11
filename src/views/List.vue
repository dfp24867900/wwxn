<template>
  <div class="bride_list">
     <div class="top">
       <!-- 顶部 -->
       <mt-header title="案例">
         <router-link to="/" slot="left">
           <mt-button icon="back"></mt-button>
         </router-link>
       </mt-header>
       <!-- 顶部结束 -->
       <!-- 顶部导航栏 -->
       <div>
         <mt-navbar v-model="active">
           <mt-tab-item id="1">综合</mt-tab-item>
           <mt-tab-item id="2">价格
             <img class="icon_img" src="/img/icon/icon4.png" @click="price_asc" v-if="icon_toggle">
             <img class="icon_img" src="/img/icon/icon3.png" @click="price_desc" v-else>
           </mt-tab-item>
           <mt-tab-item id="3">浏览量</mt-tab-item>
           <mt-tab-item id="4">筛选</mt-tab-item>
         </mt-navbar>
       </div>
       <!-- 顶部导航栏结束 -->
     </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      active:1,
      icon_toggle:true
    }
  },
  methods:{
    price_asc(){

    },
    price_desc(){

    }
  }
}
</script>

<style>
.mint-header{
  background-color: #c8caee !important;
  font-size: 17px;
  color: #000;
  font-weight: bold;
}
.top{
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  z-index: 333;
}
/* 图标的样式 */
.icon_img{
  width: 0.7rem;
  height: 0.7rem;
  vertical-align: top;
}
</style>
