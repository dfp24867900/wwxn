<template>
  <div>
    <!-- 页头 -->
    <mt-header
      title="消息"
      class="msg_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 顶部选项卡 -->
    <mt-navbar class="msg_nav">
        <router-link to="/sitenote">
          <mt-tab-item>
            <img src="../assets/image/site/msg_praise.png" alt="" slot="icon" />
            获赞
          </mt-tab-item>
        </router-link>
        <router-link :to="`/sitecollect/${info.uid}`" >
          <mt-tab-item>
            <img src="../assets/image/site/msg_review.png" alt="" slot="icon" />
            评论
          </mt-tab-item>
        </router-link>
        <router-link to="/sitemsg">
          <mt-tab-item>
            <img src="../assets/image/site/msg_apply.png" alt="" slot="icon" />
            申请
          </mt-tab-item>
        </router-link>
      </mt-navbar>
  </div>
</template>

<style>
  /* 定义页面顶部的样式 */
  .msg_header{
    background: linear-gradient(to top, #fcfbfa, #fcf4f5);
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
  }

  /* 设置顶部选项卡的样式 */
  .msg_nav {
  box-shadow: 2px 2px 6px 2px #f5f5f5;
  font-size: 16px;
  color: #333;
  width: 94%;
  position: absolute;
  top: 7%;
  left:3%;
  border-radius: 5px;
  z-index: 10;
}
.msg_nav>a{
  width: 33%;
}
  
</style>

<script>
import { mapState } from "vuex";
export default {
  data(){
    return{
      msg_active:"msg_1"
    }
  },
  computed: {
    ...mapState(["isLogined", "info"]),
  },
}
</script>