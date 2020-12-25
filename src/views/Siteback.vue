<template>
  <div id="teback">
    <!-- 页面头部 -->
    <mt-header
      title="意见反馈"
      class="back_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 下方内容 -->
    <div id="siteback">
      <p>问题和意见</p>
      <p contenteditable="true">
      </p>
      <p>
        联系方式,以使我们及时与您联系
      </p>
      <p>
        <input type="text" placeholder="联系方式">
      </p>
      <div>
        <p>图片(最多四张)</p>
        <p id="photo">
          <van-uploader :after-read="afterRead" />
        </p>
      </div>
    </div>
    <mt-button size='large'>提交</mt-button>
  </div>
</template>
<style>
  #teback>.back_header{
    background: linear-gradient(to top, #fcfbfa, #fcf4f5);
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }
  #teback>#siteback{
    width: 100%;
    height: 585px;
    background: rgb(243, 240, 240);
  }
  #teback>#siteback>div>p,#siteback>p{
    width: 96%;
    font-size: 14px;
    color:#33332d;
    padding: 5px;
  }
  #teback>#siteback>p:nth-child(2){
    width: 97%;
    height: 25%;
    padding: 5px;
    color: #aaa;
    background-color: #fff;
  }
  #teback>#siteback>p>input{
    width: 100%;
    height: 20px;
    padding: 5px;
    outline: 0;
    border:0;  
    color: #aaa;
  }
  #teback>#siteback>div>p:nth-child(2){
    width: 97%;
    height: 14%;
    background-color: #fff;
  }
</style>

<script>
export default {
   methods: {
    afterRead(file) {
      // 此时可以自行将文件上传至服务器
    },
  },
}
</script>