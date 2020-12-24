<template>
  <div>
    <!-- 页头 -->
    <mt-header
      title="我的笔记"
      class="note_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 顶部选项卡 -->
    <mt-navbar v-model="note_active" class="note_nav">
      <mt-tab-item id="note_1">
        我的    
      </mt-tab-item>
      <mt-tab-item id="note_2">
        喜欢
      </mt-tab-item>
    </mt-navbar>
    <div>
      <mt-tab-container v-model="note_active">
        <mt-tab-container-item id="note_1">
          <!-- 外层位置 -->
        </mt-tab-container-item>
        <mt-tab-container-item id="note_2">
          <!-- 外层位置 -->
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>

<style>
  /* 定义页面顶部的样式 */
  .note_header{
    background: linear-gradient(to top, #fcfbfa, #fcf4f5);
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }

  /* 设置顶部选项卡的样式 */
  .note_nav{
    box-shadow: 0 2px 5px 2px #bbb;
    border-top: 1px solid #ccc;
    font-size: 16px;
    color: #aaa;
  }
  .mint-navbar .mint-tab-item.is-selected{
    color: #333 !important;
    font-size: 16px !important;
    border-bottom: 0 !important;
  }
  
</style>

<script>
export default {
  data(){
    return{
      note_active:"note_1"
    }
  }
}
</script>