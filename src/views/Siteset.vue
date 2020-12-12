<template>
  <div> 
    <!-- 页头 -->
    <mt-header
      title="设置"
      class="set_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 下方菜单选项 -->
    <div id="siteset">
      <!-- 接受通知 -->
      <div>
        <p>接收新消息通知</p>
        <p>
          <mt-switch v-model="news" ></mt-switch>
        </p> 
      </div>
      <div class="siteset">
        <p>清除缓存</p>
        <p> 
          <img src="../assets/image/site/site_right.png" alt=""> 
        </p>
        <p>37.95M</p>
      </div>
      <div class="siteset">
        <p>关于我们</p>
        <p> 
          <img src="../assets/image/site/site_right.png" alt=""> 
        </p>
        <p></p>
      </div>
      <mt-button size='large'>
        退出登录
      </mt-button>
    </div>
  </div>
</template>

<style>
  .set_header{
    background-color: #ffffff!important;
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }

   #siteset{
    width: 100%;
    height: 600px;
    color: #333;
    font-size: 14px;
  }
  #siteset>div:first-child{
    width: 100%;
    height: 8%;
    border-bottom: 1px solid #ccc;
    position: relative;
  }
  #siteset>div:first-child>p:first-child{
    position: absolute;
    top: 30%;
    left: 5%;
    font-size: 16px;
    font-weight: 500;
  }
  #siteset>div:first-child>p:nth-child(2){
    position: absolute;
    top: 10%;
    right: 4%;
  }
  #siteset>button{
    position: absolute;
    top: 625px;
  }
  .siteset{
    position: relative;
    width: 100%;
    height: 7%;
    border-bottom: 1px solid #ccc;
    overflow: hidden;
  }
  .siteset>p:first-child{
    position: absolute;
    top: 40%;
    left: 5%;
  }
  .siteset>p:last-child{
    position: absolute;
    top:40%;
    left: 75%;
  }
  .siteset>p>img{
    position: absolute;
    top: 40%;
    left: 92%;
  }
  .siteset>img{
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
  data(){
    return{
      news:true
    }
  }
}
</script>