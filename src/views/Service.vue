<template>
  <div id="service">
    <!-- 顶部栏 -->
    <mt-header title="在线客服" fixed>
      <router-link slot="left" to="">
        <mt-button icon="back" @click="didiback"></mt-button>
      </router-link>
    </mt-header>
    <!-- 消息展示 -->
    <div id="main" @click="faseclose">
      <div class="" v-for="(messeage, i) of messeages" :key="i">
        <p class="messeage_time">
          {{ moment.unix(messeage.created_at/1000).format("lll") }}
        </p>
        <div v-if="messeage.is_send == 0" class="left_align">
          <div class="avatar">
            <img src="..\assets\image\avatar\05.png" alt="" />
          </div>
          <div class="message">{{ messeage.content }}</div>
        </div>
        <div v-else class="right_align">
          <div class="avatar">
            <img :src="require(`../assets/image/site/avatar/${info.avatar}`)" alt="" />
          </div>
          <div class="message">{{ messeage.content }}</div>
        </div>
      </div>
    </div>
    <!-- 底部消息发送框 -->
    <div class="footer">
      <textarea class="" placeholder="发送消息" v-model="information" @keydown.13="sendNew"></textarea>
      <div class="expression">
        <div>
          <img @click="face" src="../assets/image/icon/expression.png" alt="" />
          <img src="../assets/image/icon/Photo.png" alt="" />
          <!-- <img src="../assets/image/icon/photograph.png" alt="" />
          <img src="../assets/image/icon/voice.png" alt="" />
          <img src="../assets/image/icon/thumbs-up.png" alt="" /> -->
        </div>
        <button class="send">
          <img @click="sendNew" src="../assets/image/icon/send.png" alt="" />
        </button>
        <!-- 表情区域 -->
        <div class="browBox" v-if="faceShow">
          <ul>
            <li v-for="(item, index) in faceList" :key="index" @click="getBrow(index)">
              {{ item }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapState} from 'vuex';
import API from "@/util/api.js";
// 导入JSON格式的表情库
const appData = require("@/assets/emojis.json");
export default {
  computed:{
    ...mapState(['isLogined','info']),
  },
  data() {
    return {
      //保存从后端获取的数据
      messeages: [],
      //双向绑定input输入框的内容
      information: "",
      // showNarrowPopVal: false,//点击切换成小窗口
      faceShow: false,
      faceList: [],
      testContents: [
        "你想咨询点什么",
        "这个问题还没遇到过",
        "你说什么，我听不明白",
        "我们尽快为您解决",
        "请稍后--",
        "当前客服忙",
        "您还有什么咨询的吗",
        "正在查询",
        "稍等片刻，马上就好",
        "由于查询数据需要一写时间，稍等一下",
      ],
      avatar:""
    };
  },
  methods: {
     didiback(){
            window.history.go(-1);
        },
    // 表情事件
    face() {
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
          this.information += this.getBrowString;
        }
      }
    },
    //发送消息时
    sendNew() {
      if(this.faceShow){
        this.faceShow = !this.faceShow;
      }
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
        informations.is_send = 1;//1，客户
        informations.user_id = this.info.uid;
        this.messeages.push(informations);
        window.setTimeout(() => {
          let div1 = document.getElementById("main");
          let lastdiv = div1.lastElementChild;
          lastdiv.scrollIntoView(true);
        }, 100);
        // 将数据插入到数据库中
        API.insertNew(informations).then((res) => {
          //重置消息输入框
          this.information = "";
        });
        setTimeout(() => {
        let customer_service={}
        customer_service.content = this.testContents[Math.floor(Math.random() * 9)];
        customer_service.created_at = Date.now();
        customer_service.is_send = 0;//0，客服
        customer_service.user_id = this.info.uid;
        this.messeages.push(customer_service);
        // 将数据插入到数据库中
        API.insertNew(customer_service).then((res) => {
        });
        window.setTimeout(() => {
          let div1 = document.getElementById("main");
          let lastdiv = div1.lastElementChild;
          lastdiv.scrollIntoView(true);
        }, 100);
      }, 1000);
      }
    },
    faseclose(){
      this.faceShow = false;
    },
  },
  
  //页面初次加载时
  mounted() {
    var data = { user_id: this.info.uid };
    API.service(data).then((res) => {
      let messeages=res.result;
      messeages.forEach(element => {
        this.avatar=require("../assets/image/site/avatar/"+element.avatar)
        this.messeages.push(element)
      });
    });
  },
};
</script>

<style>
#service header {
   background:linear-gradient(to top, #fcfbfa, #fcf4f5) !important;
  color: black;
  border-bottom: 1px solid #ccc;
}
#service #main {
  margin-top: 40px;
  padding-bottom: 95px;
  overflow: hidden;
}
#service .messeage_time {
  text-align: center;
  padding: 5px 0px;
  font-size: 14px;
}
#service #main > div > div {
  padding: 0px 20px;
  display: flex;
  margin-bottom: 10px;
}
#service .avatar {
  width: 40px;
  height: 40px;
  border-radius: 5px;
}
#service .avatar img {
  width: 40px;
  border-radius: 20px;
}
#service .message {
  line-height: 30px;
  padding: 5px 10px;
  border-radius: 5px;
  margin: 0px 10px;
  word-break: break-all;
}
#service .right_align {
  display: flex;
  flex-direction: row-reverse;
}
#service .left_align .message,#service .right_align .message   {
  background-color: #ddd;
}
#service .footer {
  height: 85px;
  width: 100%;
  position: fixed;
  bottom: 0;
  border-top: 1px solid #ccc;
  background-color: #fff;
}
#service .footer textarea {
  height: 30px;
  width: 80%;
  line-height: 30px;
  border: 0px;
  padding: 8px 15px 0px;
}
#service .expression div:first-child img {
  padding: 8px 10px;
  width: 15%;
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
#service .footer .send img {
  width: 100%;
}
.browBox {
  width: 100%;
  height: 200px;
  background: #eee;
  position: absolute;
  bottom: 86px;
  overflow: scroll;
  border-bottom: 0px;
}
.browBox ul {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
}
.browBox ul li {
  width: 12%;
  height: 30px;
  font-size: 20px;
  list-style: none;
  text-align: center;
}
</style>
