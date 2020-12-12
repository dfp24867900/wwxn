<template>
  <div>
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
        请描述您的问题和反馈
      </p>
      <p>
        联系方式,以使我们及时与您联系
      </p>
      <p>
        <input type="text" placeholder="联系方式">
      </p>
    </div>
    <mt-button size='large'>提交</mt-button>
  </div>
</template>
<style>
  .back_header{
    background-color: #ffffff!important;
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }
  #siteback{
    width: 100%;
    height: 585px;
    background: rgb(243, 240, 240);
  }
  #siteback>p{
    width: 96%;
    font-size: 14px;
    color:#33332d;
    padding: 5px;
  }
  #siteback>p:nth-child(2){
    width: 97%;
    height: 25%;
    padding: 5px;
    color: #aaa;
    background-color: #fff;
  }
  #siteback>p>input{
    width: 100%;
    height: 20px;
    padding: 5px;
    outline: 0;
    border:0;  
    color: #aaa;
  }
</style>