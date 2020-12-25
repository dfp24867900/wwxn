<template>
  <div class="app">
    <!-- 客服头标题 -->
    <div class="xw-header">
      <div class="xw-header-content" @touchstart="showInfo">
        <div class="xw-header-back">
        <mt-button icon="back" class="xw-header-title" @click="back"
          ></mt-button
        >
      </div>
        <div
          v-if="!toShowMaskInfo"
          :class="[toShowMaskInfo ? '' : 'bounceInRight', 'animated']"
        >
          <div class="xw-header-title-wrap">
            <div class="xw-header-title">小蜜客服</div>
          </div>
        </div>
      </div>
      <!-- 小蜜客服弹出的具体信息 -->
      <div
        v-show="toShowMaskInfo"
        :class="[
          toShowMaskInfo ? 'bounceInDown' : '',
          'xw-show-info-box',
          'animated',
        ]"
      >
        <div class="xw-logo">
          <h4>客服</h4>
        </div>
        <div class="xw-header-info">
          <p class="animated bounceInLeft">
            小蜜客服产品，智能机器人为您自助服务。
          </p>
        </div>
      </div>
    </div>
    <div class="xw-content" @touchstart="toShowMaskInfo = false" ref="xwBody">
      <div class="xw-chat-wrap">
        <ul>
          <li v-for="(messageList, i) in records" :key="i">
            <div v-if="messageList.type == 1">
              <div class="xw-chat-time">{{ messageList.time }}</div>
              <div class="xw-chat-servicer">
                <div class="xw-servicer-avantar-wrap">
                  <img
                    src="../assets/image/service/logo.jpg"
                    class="xw-servicer-avantar"
                  />
                </div>
                <div class="xw-chat-msg">
                  <span v-html="replaceFace(messageList.content)"></span>
                </div>
              </div>
            </div>
            <!-- 用户发送的消息模板-->
            <div v-else>
              <div class="xw-chat-time">{{ messageList.time }}</div>
              <div class="xw-chat-customer">
                <div class="xw-customer-avantar-wrap">
                  <img
                    src="../assets/image/service/female.jpg"
                    class="xw-customer-avantar"
                  />
                </div>
                <div class="xw-chat-msg" style="display: inline-block">
                  <span v-html="replaceFace(messageList.content)"></span>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <!-- 文本输入 -->
    <div class="xw-footer-wrap" @touchstart="toShowMaskInfo = false">
      <div class="xw-footer-content">
        <div class="xw-vmodel-wrap">
          <textarea
            id="context"
            class="xw-content-textarea"
            placeholder="请输入您的问题"
            v-model="content"
            @focus="onFocusText"
          ></textarea>
        </div>
        <div class="xw-chat-tool">
          <div class="xw-chat-tool-item">
            <transition name="fade">
              <a
                href="javascript:void(0)"
                class="xw-send-btn-text"
                v-if="content.trim().length"
                @click="sendMsg"
                >发送</a
              >
            </transition>
          </div>
          <div class="xw-chat-tool-item" @click="face">
            <a
              href="javascript:;"
              :class="[
                showEmoji ? 'xw-face' : 'xw-face-close',
                'xw-chat-tool-btn',
              ]"
              @click="emojiFuc"
            ></a>
          </div>
          <div class="xw-chat-tool-item">
            <a
              :class="[
                showMoreOpratin
                  ? 'xw-hide-operation-close'
                  : 'xw-hide-operation',
                'xw-chat-tool-btn',
              ]"
              @click="showMoreOpratin = !showMoreOpratin"
            ></a>
            <transition name="fade">
              <div class="xw-window-text" v-if="showMoreOpratin">
                <!-- <label for="uploadImg">
                  <span>
                    <input
                      type="file"
                      name="image"
                      accept="image/*"
                      multiple
                      style="display: none"
                      id="uploadImg"
                    />图片
                  </span>
                </label> -->
                <span @touchstart="showEvaluateFuc">评价</span>
                <span>结束</span>
              </div>
            </transition>
          </div>
        </div>
        <!-- 表情区域 -->
            <div class="browBox" v-if="faceShow">
              <ul>
                <li
                  v-for="(item, index) in faceList"
                  :key="index"
                  @click="getBrow(index)"
                >
                  {{ item }}
                </li>
              </ul>
            </div>
      </div>
    </div>
    <!-- 提示音 -->
    <!-- <audio style="display:none"  preload="metadata" controls="controls" autoplay="autoplay" ref="hintAudio">
        <source :src="myaudio" type="audio/mpeg"/>
    </audio> -->
    <!-- 右上角的通话小窗口 -->
    <!-- <div class="xw-samll-pop-wrap animated bounceInUp" v-if="showNarrowPopVal">
       <span class="xw-big-pop" @click="showBigPopFuc">显示大窗</span>
     </div> -->
    <!-- 客服窗口 -->
    <!-- <div class="xw-pop-server animated bounceInRight" v-if="videoVal">
       <h5>客服</h5>
       <span class="xw-narrow-pop" @click="showNarrowPopFuc">显示小窗</span>
     </div> -->
    <!-- 顾客窗口 -->
    <!-- <div class="xw-pop-customer animated bounceInLeft" v-if="videoVal">
       顾客
       <div>
         <a class="xw-hang-up" href="#"><img src="/public/image/hang-up.png" class="xw-hang-up-icon"></a>
       </div>
     </div> -->
    <!--客服评分-->
    <evaluate
      :ScoreDB="ScoreDB"
      :showScore="showScore"
      @on-star="selectStar"
      @confirm-star="confrmStar"
    >
    </evaluate>
    <Toast :showToast="showToast">{{ toastText }}</Toast>
  </div>
</template>
<script>
import evaluate from "../components/evaluate.vue";
import Toast from "../components/toast";
// 导入JSON格式的表情库
const appData = require("@/assets/emojis.json");
export default {
  components: {
    evaluate,
    Toast,
  },
  data() {
    return {
      comment: {},
      showEmoji: true, //是否显示表情
      showToast: false, //显示提示框
      toastText: "",
      showMoreOpratin: false, //是否显示更多操作
      toShowMaskInfo: false, //点击头部是否显示相信信息
      // showNarrowPopVal: false,//点击切换成小窗口
      testContents: [
        "你想咨询点什么",
        "这些价格上都是有差异的",
        "这个问题还没遇到过",
        "你说什么，我听不明白",
        "我们尽快为您解决",
        "请稍后--",
        "当前客服忙",
        "您还有什么咨询的吗",
        "正在查询",
        "gone with the wind",
      ],
      content: "",
      //聊天记录
      records: [
        {
          type: 1,
          time: new Date().toLocaleTimeString(),
          content: "您好！欢迎来到小蜜客服。",
        },
        {
          type: 2,
          time: new Date().toLocaleTimeString(),
          content: "您好",
        },
      ],
      showScore: false, //显示评分
      ScoreDB: {
        scoreDatas: [
          {
            scoreTitle: "服务指数",
            scoreFlag: 0,
            scoreArr: [1, 2, 3, 4, 5],
          },
          {
            scoreTitle: "接通速度",
            scoreFlag: 1,
            scoreArr: [1, 2, 3, 4, 5],
          },
          {
            scoreTitle: "办事效率",
            scoreFlag: 2,
            scoreArr: [1, 2, 3, 4, 5],
          },
        ],
        maxVal: [0, 0, 0],
      },
      imgFile: {},
      EXPS: [],
      faceShow: false,
      faceList: [],
      getBrowString: "",
    }
  },
  methods: {
    // 表情事件
    face(){
      this.faceShow = !this.faceShow;
      if (this.faceShow == true) {
        for (let i in appData) {
          this.faceList.push(appData[i].char);
        }
      } else {
        this.faceList = [];
      }
    },
    // 获取用户点击之后的标签 ，存放到输入框内
    getBrow(index) {
      for (let i in this.faceList) {
        if (index == i) {
          this.getBrowString = this.faceList[index];
          this.content += this.getBrowString;
        }
      }
    },
    showInfo() {
      this.toShowMaskInfo = true;
    },
    back() {
      this.$router.push("/");
    },
    //点击控制表情切换（显示和隐藏）
    emojiFuc() {
      this.showEmoji = !this.showEmoji;
    },
    showEvaluateFuc() {
      this.showScore = !this.showScore;
    },
    sendMsg() {
       this.faceShow = !this.faceShow;
      var content = this.content.trim();
      this.records.push({
        time: new Date().toLocaleTimeString(),
        content: content,
        type: 2,
      });
      this.content = "";
      setTimeout(() => {
        // this.hint();
        this.records.push({
          time: new Date().toLocaleTimeString(),
          content: this.testContents[Math.floor(Math.random() * 9)],
          type: 1,
        });
        this.scrollToBottom();
      }, 800);
    },
    getEmotionData(pageNow, pageSize) {
      return this.EXPS.slice((pageNow - 1) * pageSize, pageSize * pageNow);
    },
    replaceFace(con) {
      if (!con) {
        return;
      }
      if (con.toString().indexOf("/:") > -1) {
        var exps = this.EXPS;
        for (var i = 0; i < exps.length; i++) {
          con = con.replace(
            exps[i].reg,
            '<img src="' + exps[i].file + '"  alt="" />'
          );
        }
      }
      return con;
    },
    //点击星星进行星星评分
    selectStar(msg) {
      let index = msg[0];
      let scoreFlag = msg[1];
      let scoreArr = msg[2];
      var Target = [1, 2, 3, 4, 5];
      for (var i = 0; i < index; i++) {
        Target[i] = i;
      }
      //方便确定星星选中的个数，将不亮的星星数组设置为-1
      for (var j = index; j < Target.length; j++) {
        Target[j] = -1;
      }
      //评分结果数
      var tempArr = [];
      tempArr = this.ScoreDB.maxVal.slice(0);
      tempArr[scoreFlag] = index;
      this.ScoreDB.maxVal = tempArr.concat();
      this.ScoreDB.scoreDatas[scoreFlag].scoreArr = Target;
    },
    //点击确定关闭星星评价
    confrmStar(msg) {
      this.showToast = true;
      this.toastText = "您的评分依次是 " + msg;
      this.showScore = false;
      setTimeout(() => {
        this.showToast = false;
      }, 2000);
    },
    //滚动到底
    scrollToBottom() {
      setTimeout(() => {
        //滚动条长度
        var currentDistance =
          this.$refs.xwBody.scrollHeight - this.$refs.xwBody.clientHeight;
        //当前滚动条距离顶部的距离
        var currentScroll_y = this.$refs.xwBody.scrollTop;
        if (currentDistance > 0 && currentDistance > currentScroll_y) {
          currentScroll_y =
            Math.ceil((currentDistance - currentScroll_y) / 10) +
            currentScroll_y;
          currentScroll_y =
            currentScroll_y > currentDistance
              ? currentDistance
              : currentScroll_y;
          this.$refs.xwBody.scrollTop = currentScroll_y;
          this.scrollToBottom();
        }
      }, 13);
    },
    onFocusText() {
      this.scrollToBottom();
    },
  },
};
</script>
<style scoped>
.browBox {
    width: 100%;
    height: 200px;
    background: #e6e6e6;
    position: absolute;
    bottom: 53px;
    overflow: scroll;
}
.browBox ul {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
}
.browBox ul li {
  width: 14%;
  font-size: 26px;
  list-style: none;
  text-align: center;
}
.app {
  position: absolute;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  width: 100%;
  height: 100%;
}
.xw-content {
  flex: 1;
  position: relative;
  overflow: auto;
  transition: height 0.8s;
}

.slide-fade-enter-active {
  transition: all 0.3s ease;
}
.slide-fade-leave-active {
  transition: all 0.3s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter,
.slide-fade-leave-to {
  transform: translateX(20px);
  opacity: 0;
}
html,
body,
a,
button,
input,
textarea,
img,
ul,
li,
p,
dl,
dd,
h1,
h2,
h3,
h4,
h5,
h6 {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
a,
button,
input,
textarea,
img {
  /* tap-highlight-color: transparent; */
  /* touch-callout: none; */
  user-select: none;
  outline: none;
}
body {
  height: 100%;
  width: 100vw;
  overflow: hidden;
  font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB,
    Microsoft YaHei, 微软雅黑, Arial, sans-serif;
  font-size: 14px;
  line-height: 1.43;
  color: #333;
  word-wrap: break-word;
  word-break: normal;
  hyphens: auto;
  transition: 0.5s;
}

a {
  text-decoration: none;
  color: #4078c0;
}

img {
  border-style: none;
}

ul {
  list-style: none;
}

::scrollbar-track {
  border-radius: 0;
  padding: 0;
  background-color: transparent;
}

::scrollbar-thumb {
  border-radius: 10px;
  padding: 0;
  background-color: rgba(0, 0, 0, 0.2);
}

::scrollbar {
  width: 7px;
  height: 7px;
  background-color: transparent;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.xw-ring-wrap {
  position: absolute;
  right: 5px;
  top: 3px;
  padding: 0 2px;
  z-index: 4;
}

.xw-ring-icon {
  background: url(../assets/image/service/soundOn.svg) no-repeat 50%;
}

.xw-ring-icon-toggle {
  background: url(../assets/image/service/soundClose.svg) no-repeat 50%;
}

.xw-ring-icon {
  float: right;
  padding: 5px;
  margin-right: 3px;
  height: 30px;
  width: 30px;
  opacity: 0.6;
  cursor: pointer;
  text-indent: -9999px;
  overflow: visible;
}
.xw-body-wrap-scroll,
.xw-body-wrap-scroll-main {
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  overflow: hidden;
  /* overflow-scrolling: auto; */
}
.xw-header {
  z-index: 2;
  max-height: 360px;
  background: #ffe4fb;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
}
.xw-header-content {
  overflow: hidden;
  text-align: center;
  min-height: 45px;
  width: 100%;
}

.xw-chat-servicer:after,
.xw-chat-servicer:before,
.xw-chat-customer:after,
.xw-chat-customer:before,
.xw-chat-wrap:after,
.xw-chat-wrap:before,
.xw-chat-tool:after,
.xw-chat-tool:before,
.xw-chat-ul-box:after,
.xw-chat-ul-box:before {
  display: table;
  content: "";
}
.xw-header-avatar {
  float: left;
  height: 40px;
  width: 40px;
  border-radius: 100%;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-right: 8px;
  margin-top: 5px;
}
.xw-header-title-wrap {
  position: relative;
}
.xw-header-title {
  font-size: 14px;
  color: #000;
  line-height: 45px;
  position: relative;
}
.xw-header-back {
  float: left;
  
}
.xw-header-back button{
  margin-left: 15px;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.0);
}
.xw-chat-wrap {
  overflow: auto;
  padding-left: 16px;
  padding-bottom: 20px;
}
.xw-chat-wrap .xw-chat-time,
.xw-chat-wrap time {
  line-height: 1;
  text-align: center;
  display: block;
  margin-bottom: 8px;
  margin-top: 8px;
  font-size: 12px;
  color: #999;
  text-shadow: 1px 1px 1px hsla(0, 0%, 100%, 0.6);
}
.xw-chat-servicer,
.xw-chat-customer {
  position: relative;
  margin-bottom: 16px;
  padding: 0 10px 0 45px;
}
.xw-servicer-avantar-wrap {
  position: absolute;
  bottom: 0;
  line-height: 0;
}
.xw-send-btn-text {
  padding: 4px 8px;
  background-color: #ed4858;
  color: #fff;
  border-radius: 5px;
}
.xw-customer-avantar-wrap {
  position: absolute;
  bottom: 0;
  right: 8px;
  line-height: 0;
}
.xw-chat-servicer .xw-servicer-avantar-wrap,
.xw-customer-avantar-wrap {
  left: 0;
}
.xw-servicer-avantar {
  border-radius: 100%;
}
.xw-servicer-avantar-wrap img,
.xw-customer-avantar-wrap img {
  height: 34px;
  width: 34px;
}
.xw-chat-msg {
  /* hyphens: auto; */
  /* word-wrap: break-word; */
  /* word-break: normal; */
  position: relative;
  clear: both;
  padding: 8px 16px;
  border: 1px solid transparent;
  max-width: 100%;
  min-width: 50px;
  min-height: 22px;
  line-height: 1.6em;
  max-width: 70%;
}
.xw-chat-servicer .xw-chat-msg {
  background: #fff;
  border-color: #efefef;
  float: left;
}
.xw-chat-msg :last-child {
  margin-bottom: 0;
}
.xw-chat-msg span {
  white-space: pre-line;
}
.xw-chat-servicer,
.xw-chat-customer {
  position: relative;
  margin-bottom: 16px;
  padding: 0 10px 0 45px;
}
.xw-chat-customer {
  text-align: right;
}
.xw-chat-customer .xw-chat-msg {
  float: right;
  text-align: left;
  background: #ed4858;
  border-color: #ed4858;
  color: #fff;
  margin-right: 45px;
}
.xw-customer-avantar {
  border-radius: 50%;
}
.xw-chat-msg :last-child {
  margin-bottom: 0;
}
.xw-chat-wrap .xw-system-info-time,
.xw-chat-wrap time {
  line-height: 1;
  text-align: center;
  display: block;
  margin-bottom: 8px;
  font-size: 12px;
  color: #999;
  text-shadow: 1px 1px 1px hsla(0, 0%, 100%, 0.6);
}
.xw-system-info {
  margin-bottom: 8px;
}
.xw-chat-wrap > :last-child {
  margin-bottom: 16px;
}
.xw-system-info {
  text-align: center;
  font-size: 12px;
}
.xw-system-info span {
  display: inline-block;
  background: rgba(0, 0, 0, 0.08);
  padding: 4px 8px;
  line-height: 1;
  color: #7c7c7c;
  border-radius: 2px;
  text-shadow: 1px 1px 1px hsla(0, 0%, 100%, 0.6);
}
.xw-footer-wrap {
  justify-content: flex-end;
  width: 100%;
  box-shadow: 0 -1px 4px rgba(0, 0, 0, 0.05);
  background: #fff;
  z-index: 2;
}
.xw-footer-content {
  position: relative;
  height: 52px;
  display: flex;
  box-shadow: rgba(0, 0, 0, 0.05) 0px -1px 4px;
}
.xw-vmodel-wrap {
  flex: 1;
}
.xw-content-textarea {
  box-sizing: border-box;
  z-index: 1;
  overflow-y: auto;
  font-size: 14px;
  line-height: 14px;
  border: none;
  resize: none;
  padding: 16px 85px 16px 14px;
  font-family: inherit;
  white-space: pre;
  white-space: pre-wrap;
  word-wrap: break-word;
}
.xw-chat-tool {
  position: absolute;
  right: 0px;
  bottom: 0;
  z-index: 2;
}
.xw-chat-tool-item {
  height: 52px;
  line-height: 52px;
  position: relative;
  float: left;
  background: #fff;
}
.xw-chat-tool-btn {
  display: block;
}
.xw-chat-tool-btn {
  margin-top: 7px;
  height: 38px;
  width: 38px;
  border-radius: 100%;
  text-indent: -9999px;
  opacity: 0.5;
  overflow: hidden;
  transform: translateZ(0);
  margin-left: 10px;
}
.xw-chat-tool-btn.xw-face {
  background: url(../assets/image/service/smileOn.svg) no-repeat 50%;
}
.xw-chat-tool-btn.xw-face-close {
  background: url(../assets/image/service/smileClose.svg) no-repeat 50%;
}
.xw-chat-tool-item .xw-window-text {
  position: absolute;
  bottom: 100%;
  left: 50%;
  margin-bottom: -3px;
  transform: translateX(-60%);
  transform: translateX(-60%);
  white-space: nowrap;
  box-shadow: 0 3px 18px 2px rgba(0, 0, 0, 0.1), 0 0 1px rgba(0, 0, 0, 0.05);
  font-size: 12px;
  background: #fff;
  line-height: 1em;
}
.xw-chat-tool-item .xw-window-text.xw-face-emoji-ul {
  right: -23px;
  left: auto;
  transform: none;
  transform: none;
}
.xw-chat-tool-item .xw-window-text h4 {
  font-size: 12px;
  margin: 0;
  font-weight: 400;
  padding: 12px 8px;
  padding-bottom: 0;
}
.xw-chat-ul-box {
  list-style: none;
  margin: 0;
  padding: 0;
}
.xw-chat-ul-box {
  position: relative;
  z-index: 1;
  background: #fff;
  padding: 8px;
  height: 130px;
  overflow: hidden;
  width: 340px;
  margin: 0px auto;
}
.xw-chat-tool-item .xw-window-text .xw-chat-ul-box {
  padding: 8px;
}
.swiper-slide {
  float: left;
}
.xw-chat-ul-box a {
  display: block;
  height: 40px;
  width: 40px;
}
.swiper-pagination {
  display: flex;
  width: 100%;
  justify-content: center;
}
.swiper-pagination-bullet {
  width: 8px;
  height: 8px;
  display: inline-block;
  background: #ccc;
  border-radius: 10px;
  margin-left: 5px;
  margin-right: 5px;
}
.swiper-pagination-bullet-active {
  background: #007aff;
}
.xw-chat-tool-item {
  height: 52px;
  position: relative;
  float: left;
}
.xw-hide-operation {
  background: url(../assets/image/service/addOn.svg) no-repeat 50%;
  width: 38px;
  height: 38px;
  margin-right: 10px;
  transform: scale(0.7);
}
.xw-hide-operation-close {
  background: url(../assets/image/service/addClose.svg) no-repeat 50%;
  width: 38px;
  height: 38px;
  margin-right: 10px;
  transform: scale(0.7);
}
.xw-chat-tool-item .xw-window-text span {
  display: block;
  padding: 10px 12px;
  background: #fff;
  position: relative;
  z-index: 1;
  font-size: 17px;
  line-height: 16px;
}
.xw-chat-servicer:after,
.xw-chat-customer:after,
.xw-chat-wrap:after,
.xw-chat-tool:after,
.xw-chat-ul-box:after {
  clear: both;
}
.xw-chat-msg:last-child:before {
  bottom: -1px;
}
.xw-chat-msg:last-child:after,
.xw-chat-msg:last-child:before {
  content: "";
  position: absolute;
  height: 0;
  width: 0;
  display: block;
}
.xw-chat-customer .xw-chat-msg:last-child:before {
  display: inline-block;
  height: 0;
  width: 0;
  border: 10px solid transparent;
  border-bottom: 10px solid #ed4858;
  right: -10px;
  border-left-width: 9px;
}
.xw-chat-servicer .xw-chat-msg:last-child:before {
  display: inline-block;
  height: 0;
  width: 0;
  border: 10px solid transparent;
  border-bottom: 10px solid #efefef;
  left: -10px;
  border-left-width: 9px;
}
.xw-chat-servicer .xw-chat-msg:last-child:after {
  display: inline-block;
  height: 0;
  width: 0;
  border: 10px solid transparent;
  border-bottom: 10px solid #fff;
  left: -8px;
  border-left-width: 9px;
  bottom: 0px;
}
.xw-show-info-box {
  height: 49px;
  margin-top: -50px;
  z-index: 1000;
  background: #ed4858;
  color: #fff;
}
.xw-logo {
  text-align: center;
}
.xw-logo img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  margin-top: 20px;
}
.xw-header-info p {
  height: 80px;
  padding: 0 16px;
  word-wrap: break-word;
  text-align: left;
  overflow: auto;
}
.xw-faceEmoji {
  margin-bottom: 7px;
  width: 20%;
  float: left;
}
.xw-faceEmoji-main {
  text-align: center;
}
.xw-chat-msg span img {
  vertical-align: middle;
}
.mint-swipe-items-wrap > div {
  text-align: center;
}
.xw-scroll-ul {
  min-height: 340px;
}
.mint-swipe-indicator.is-active {
  background: #ed4858;
  opacity: 1;
}
</style>