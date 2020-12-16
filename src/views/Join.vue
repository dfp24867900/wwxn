<template>
  <div id="join">
    <mt-header title="邀请另一半" class="join_header">
      <router-link to="/site" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class="join_other">
      <!-- 版面标题 -->
      <div>
        <img src="../assets/image/site/site_pao.png" alt="" />
        邀请另一半
        <img src="../assets/image/site/site_pao.png" alt="" />
      </div>
      <!-- 头像连接 -->
      <div>
        <img src="../assets/image/site/site_avatar.jpg" alt="" />
        <img src="../assets/image/site/site_dian.png" alt="" />
        <img src="../assets/image/site/site_other.png" alt="" />
      </div>
      <!-- 号码输入框 -->
      <div>
        <van-field
          readonly
          clickable
          :value="phone"
          @touchstart.native.stop="show = true"
        />
        <van-number-keyboard
          v-model="phone"
          :show="show"
          :maxlength="11"
          @blur="show = false"
        />
      </div>
      <!-- 文本描述 -->
      <p>绑定账号后另一半可同步查看备婚计划和婚礼账本花费哦!</p>
      <!-- 按钮 -->
      <button :class="{act:act}">邀请</button>
    </div>
  </div>
</template>

<style>
#join>.join_header {
  background-color: #ffffff !important;
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
}
#join {
  background-image: url(../assets/image/site/join_bg.jpg);
  background-size: 100% 100%;
  width: 100%;
  height: 650px;
}
#join>.join_other {
  width: 80%;
  height: 70%;
  border-radius: 5px;
  box-shadow: 2px 2px 6px 3px #fff;
  position: absolute;
  top: 10%;
  left: 10%;
  background-color: rgba(248, 242, 242, 0.7);
  position: relative;
}
#join>.join_other > div:first-child {
  width: 50%;
  position: absolute;
  top: 6%;
  left: 25%;
  color: #ff93a0;
  font-weight: 500;
}
#join>.join_other > div:nth-child(2) {
  width: 80%;
  height: 12%;
  overflow: hidden;
  position: absolute;
  left: 10%;
  top: 23%;
}
#join>.join_other > div:nth-child(2) > img {
  width: 20%;
  height: 100%;
  border-radius: 50%;
}
#join>.join_other > div:nth-child(2) > img:first-child {
  position: absolute;
  left: 0;
}
#join>.join_other > div:nth-child(2) > img:nth-child(2) {
  position: absolute;
  left: 40%;
}
#join>.join_other > div:nth-child(2) > img:nth-child(3) {
  position: absolute;
  left: 80%;
}
#join>.join_other > div:nth-child(3) {
  width: 80%;
  height: 10%;
  position: absolute;
  top: 55%;
  left: 10%;
  border-radius: 10px;
  overflow: hidden;
}
#join>.join_other > p {
  width: 80%;
  height: 10%;
  position: absolute;
  text-align: center;
  left: 10%;
  top: 70%;
  color: rgb(124, 120, 120);
}
#join>.join_other > button {
  display: inline-block;
  width: 80%;
  height: 10%;
  position: absolute;
  left: 10%;
  top: 85%;
  border-radius: 20px;
  border: 0;
  background-color: #ccc;
  color: #f5f5f5;
  font-weight: 300;
}
#join .act {
  background-color: pink !important;
  color: #aaa !important;
}
</style>

<script>
export default {
  data() {
    return {
      show: false,
      phone: "",
      act:false
    };
  },
  watch:{
    phone(a){
      if(a>0){
        this.act=true
      }
    }
  }
 
};
</script>