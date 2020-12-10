<template>
  <div id="service">
    <!-- 顶部栏 -->
    <mt-header title="在线客服" fixed>
      <router-link slot="left" to="/">
        <mt-button type="primary" icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 消息展示 -->
    <div id="main">
      <div class="" v-for="(messeage, i) of messeages" :key="i">
        <div v-if="messeage.is_send == 0">
          <div class="avatar">
            <img src="../assets/image/avatar/logo.png" alt="" />
          </div>
          <div class="message">{{ messeage.content }}</div>
        </div>
        <div v-else class="right_align">
          <div class="message">{{ messeage.content }}</div>
          <div class="avatar">
            <img src="../assets/image/avatar/logo.png" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- 底部消息发送框 -->
    <div class="footer">
      <textarea 
        class=""
        placeholder="发送消息"
        v-model="information"
      ></textarea >
      <div class="expression">
        <div>
          <img @click="face" src="../assets/image/icon/expression.png" alt="" />
          <img src="../assets/image/icon/Photo.png" alt="" />
          <img src="../assets/image/icon/photograph.png" alt="" />
          <img src="../assets/image/icon/voice.png" alt="" />
          <img src="../assets/image/icon/thumbs-up.png" alt="" />
        </div>
        <button class="send">
          <img @click="sendNew" src="../assets/image/icon/send.png" alt="" />
        </button>

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
  </div>
</template>

<script>
import API from "@/util/api.js";
// 导入JSON格式的表情库
const appData = require("@/assets/emojis.json");
export default {
  data() {
    return {
      //保存从后端获取的数据
      messeages: [],
      //双向绑定input输入框的内容
      information: "",
      // showNarrowPopVal: false,//点击切换成小窗口
      faceShow: false,
      faceList:[]
    };
  },
  methods: {
    // 表情事件
    face(){
      this.faceShow = !this.faceShow;
      if (this.faceShow == true) {
        for (let i in appData) {
          this.faceList.push(appData[i].char);
          console.log(1)
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
          this.information += this.getBrowString;
        }
      }
    },
    //发送消息时
    sendNew() {
      // this.faceShow = !this.faceShow;
      //判断是否为空
      if (this.information.trim() == "") {
        this.$toast({
          message: "不能发送空白信息",
          position: "middle",
          duration: 1000,
        });
      } else {
        //创建消息对象，并插入相应的数据
        let informations = {};
        informations.content = this.information;
        informations.created_at = Date.now();
        informations.is_send = 1;
        informations.user_id = 1;
        this.messeages.push(informations);
        window.setTimeout(()=>{
          let div1=document.getElementById("main")
        let lastdiv=div1.lastElementChild
        console.log(lastdiv)
        lastdiv.scrollIntoView(true)
        },100)
        // 将数据插入到数据库中
        API.insertNew(informations)
          .then((res) => {
            //重置消息输入框
            this.information = "";
          });
      }
    },
  },
  //页面初次加载时
  mounted() { 
    var data={ user_id: 1 }
    API.service(data).then((res) => {
      this.messeages = res.data;
      // this.messeages[0].content=Math.ceil(Math.random*50)+this.messeages[0].content
      console.log(res.result)
      this.messeages=res.result
    });
  },
};
</script>

<style>
#service header {
  background-color: #fff;
  color: black;
  border-bottom: 1px solid #ccc;
}
#service #main {
  margin-top: 50px;
  padding-bottom: 95px;
  overflow: hidden;
  background-color: #fff;
}
#service #main > div > div {
  padding: 0px 20px;
  display: flex;
  margin-bottom: 10px;
}
#service #main > div > div > div {
  background-color: #eee;
}
#service .avatar {
  width: 40px;
  height: 40px;
  border-radius: 5px;
}
#service .avatar img {
  width: 100%;
}
#service .message {
  width: 80%;
  line-height: 30px;
  padding: 5px 10px;
  border-radius: 5px;
  margin: 0px 10px;
  word-break: break-all;
}
#service .right_align div {
  float: right;
}
#service .footer {
  width: 100%;
  position: fixed;
  bottom: 0;
  border-top: 1px solid #ccc;
  background-color: #fff;
}
#service .footer textarea  {
  width: 80%;
  line-height: 20px;
  border: 0px;
  padding: 10px 15px 0px;
}
#service .expression div:first-child img {
  padding: 8px 10px;
  width: 6%;
}
#service .footer .expression {
  display: flex;
  justify-content: space-between;
}
#service .footer .send {
  width: 45px;
  padding-left: 0px;
  border: 0;
  background-color: #fff;
}
/* #service .xw-chat-tool-item{
  padding: 8px 10px;
  width: 6%;
} */
#service .footer .send img {
  width: 110%;
}
.browBox {
    width: 100%;
    height: 200px;
    background: #f5f5f5;
    position: absolute;
    bottom: 95px;
    overflow: scroll;
}
.browBox ul {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
}
.browBox ul li {
  width: 10%;
  height: 30px;
  font-size: 20px;
  list-style: none;
  text-align: center;
}
</style>