<template>
  <div>
    <!-- 页面头部 -->
    <mt-header title="个人资料" class="per_header">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 正文区域 -->
    <div id="personal">
      <!-- 头像 -->
      <div class="personal" @click="choose">
        <p>头像</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <img :src="require(`../assets/image/site/avatar/${info.avatar}`)" alt="" />
      </div>
      <!-- 头像选择 -->
      <mt-actionsheet :actions="actions" v-model="chooseavatar">
      </mt-actionsheet>
      <!-- 昵称-->
      <div class="personal">
        <p>昵称</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <p>{{info.nickname}}</p>
      </div>
      <!-- 电话 -->
      <div class="personal">
        <p>电话号码</p>
        <p>{{info.phone}}</p>
      </div>
      <!-- 性别 -->
      <div class="personal" @click="sex = true">
        <p>性别</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <p>{{ xxx }}</p>
      </div>
      <!-- 性别选择 -->
      <van-action-sheet
        v-model="sex"
        :actions="sexx"
        @select="sexxx"
        cancel-text="取消"
        description="您的性别是?"
        close-on-click-action
      />
      <!-- 角色 -->
      <div class="personal" @click="juese = true">
        <p>角色</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <p>{{ js }}</p>
      </div>
      <!-- 身份选择 -->
      <van-action-sheet
        v-model="juese"
        :actions="jues"
        @select="jue"
        cancel-text="取消"
        description="您的身份是?"
        close-on-click-action
      />
      <!-- 举办日期 -->
      <div id="tim">
        <van-cell title="举办日期" :value="date" @click="show = true" />
        <van-calendar v-model="show" @confirm="onConfirm" />
      </div>
      <!-- 举办城市 -->
      <div class="personal" @click="address">
        <p>举办城市</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <p>{{ addre }}</p>
      </div>
      <!-- 城市选择 -->
      <van-picker
        v-show="ci"
        title="城市选择"
        show-toolbar
        :columns="cit"
        @confirm="citty"
        @cancel="cityCancel"
        @change="cityChange"
      />
      <!-- 婚礼风格 -->
      <div class="personal" @click="wstyle = true">
        <p>婚礼风格</p>
        <p>
          <img src="../assets/image/site/site_right.png" alt="" />
        </p>
        <p>{{ ws }}</p>
      </div>
      <!-- 风格选择 -->
      <van-action-sheet
        v-model="wstyle"
        :actions="wsty"
        @select="sty"
        cancel-text="取消"
        description="您期望的场地是?"
        close-on-click-action
      />
      <!--婚礼宣言  -->
      <van-cell is-link title="婚礼宣言" @click="say = true" />
      <van-action-sheet v-model="say" title="请输入您的婚礼宣言"  @select="says">
        <div class="content">
          <textarea id="manifesto" cols="5" v-model="manifesto" rows="8"></textarea>
          <mt-button size='large' @click="refer">提交</mt-button>
        </div>
      </van-action-sheet>
      <p id="declaration">
       婚礼宣言
      </p>
    </div>
  </div>
</template>
<style>
.content {
    padding: 16px 35px 20px;
}
#declaration{
  position: relative;
  width: 94%;
  height: 10%;
  overflow: hidden;
  padding: 3%;
  color: #9a9a9a;
}
#manifesto{
  width: 300px;
  height: 120px;
  margin-bottom: 10px;
  background-color: #eee;
}
.per_header {
  background: linear-gradient(to top, #fcfbfa, #fcf4f5); 
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
  border-bottom: 1px solid #ccc;
}
#personal {
  width: 100%;
  height: 600px;
  color: #333;
  font-size: 14px;
}
#tim,
.personal {
  position: relative;
  width: 100%;
  height: 10%;
  overflow: hidden;
}
#tim > div:first-child {
  position: absolute;
  top: 18%;
  left: 1%;
}
#tim > div:first-child > div:nth-child(2) {
  position: absolute;
  left: 63%;
  font-size: 14px;
  color: #333;
}
.personal > p:first-child {
  position: absolute;
  top: 40%;
  left: 5%;
}
.personal > p:last-child {
  position: absolute;
  top: 40%;
  left: 64%;
}
.personal > p > img {
  position: absolute;
  top: 40%;
  left: 92%;
}

.personal > img {
  width: 10%;
  height: 70%;
  border-radius: 50%;
  position: absolute;
  top: 10%;
  left: 80%;
}
textarea{
    resize:none;
}
</style>

<script>
import { Toast } from "vant";
import {mapState} from 'vuex';
export default {
  computed:{
    ...mapState(['isLogined','info']),
  },
  data() {
    return {
      manifesto:'',
      say:false,
      ud: 1,
      // 头像
      actions: [
        {
          name: "拍照",
          method: this.getCamera, // 调用methods中的函数
        },
        {
          name: "从相册中选择",
          method: this.getLibrary, // 调用methods中的函数
        },
      ],
      chooseavatar: false,
      // 性别
      sexx: [{ name: "男" }, { name: "女" }],
      sex: false,
      xxx: "请选择",
      // 身份
      jues: [
        { name: "新娘" },
        { name: "新郎" },
        { name: "伴娘" },
        { name: "伴郎" },
      ],
      juese: false,
      js: "未知",
      //日期
      date: "",
      show: false,
      // 城市
      cit: [
        {
          text: "陕西",
          children: [
            {
              text: "西安",
              children: [{ text: "莲湖区" }, { text: "雁塔区" }],
            },
            {
              text: "宝鸡",
              children: [{ text: "金台区" }, { text: "高新区" }],
            },
          ],
        },
        {
          text: "云南",
          children: [
            {
              text: "昆明",
              children: [{ text: "五华区" }, { text: "盘龙区" }],
            },
            {
              text: "丽江",
              children: [{ text: "红塔区" }, { text: "江川区" }],
            },
          ],
        },
      ],
      ci: false,
      addre: "待定",
      //场地
      wsty: [
        { name: "树林" },
        { name: "海滩" },
        { name: "教堂" },
        { name: "其他" },
      ],
      wstyle: false,
      ws: "请选择",
    };
  },

  methods: {
    // 城市选择
    citty(value, index) {
      this.addre = `${value[0]}-${value[1]}-${value[2]}`;
      this.ci = false;
    },
    cityChange(picker, value, index) {
      this.addre = `${value[0]}-${value[1]}-${value[2]}`;
      this.ci = false;
    },
    cityCancel() {
      this.ci = false;
    },
    getCamera(){
    },
    getLibrary(){
    },

    //日期
    formatDate(date) {
      return `${1900 + date.getYear()}年-${
        date.getMonth() + 1
      }月-${date.getDate()}日`;
    },
    onConfirm(date) {
      this.show = false;
      this.date = this.formatDate(date);
    },
    // 头像
    choose() {
      this.chooseavatar = true;
    },
    // 性别
    sexxx(item) {
      this.sex = true;
      this.xxx = item.name;
    },
    // 角色
    jue(item) {
      this.juese = true;
      this.js = item.name;
    },
    // 城市
    address() {
      this.ci = true;
    },
    //风格
    sty(item) {
      this.wstyle = true;
      this.ws = item.name;
    },
    says(item) {
      this.say = true;
    },
    refer(){
      document.getElementById('declaration').innerHTML=this.manifesto;
      this.say = false;
    }
  },
};
</script>