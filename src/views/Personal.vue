<template>
  <div>
    <!-- 页面头部 -->
    <mt-header
      title="个人资料"
      class="per_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 正文区域 -->
    <div id="personal">
      <div class="personal" @click="choose"> 
        <p>头像</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="">
        </p>
        <img src="../assets/image/site/site_avatar.jpg" alt="">
      </div>
      <div class="personal">
        <p>电话号码</p>
        <p>15988755642</p>
      </div>
      <div class="personal" v-for="(p,i) in list" :key="i">
        <p>{{p.p}}</p>
        <p> 
          <img src="../assets/image/site/site_right.png" alt="">
        </p>
        <p>{{p.pp}}</p>
      </div>
      <mt-popup
      v-model="chooseavatar"
      position="bottom">
        <div>
          <p>头像选择</p>
          <p>从相册选取</p>
          <p>取消</p>
        </div>
      </mt-popup>
    </div>
  </div>
</template>
<style>
  .per_header{
    background-color: #ffffff!important;
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }
  #personal{
    width: 100%;
    height: 600px;
    color: #333;
    font-size: 14px;
  }
  .personal{
    position: relative;
    width: 100%;
    height: 10%;
    overflow: hidden;
  }
  .personal>p:first-child{
    position: absolute;
    top: 40%;
    left: 5%;
  }
  .personal>p:last-child{
    position: absolute;
    top:40%;
    left: 75%;
  }
  .personal>p>img{
    position: absolute;
    top: 40%;
    left: 92%;
  }
  .personal>img{
    width: 10%;
    height: 70%;
    border-radius: 50%;
    position: absolute;
    top: 10%;
    left: 80%;
  }
  
</style>

<script>
export default {
  data() {
    return {
      list:[
        {p:'昵称',pp:'Z-sum'},
        {p:'性别',pp:'请选择'},
        {p:'角色',pp:'未知'},
        {p:'举办日期',pp:'请选择'},
        {p:'举办城市',pp:'请选择'},
        {p:'婚礼风格',pp:'请选择'}
        ],
      chooseavatar:false,
      ud:1
    };
  },

  methods: {
    choose(){
      this.chooseavatar=true;
    }
  },
};
</script>