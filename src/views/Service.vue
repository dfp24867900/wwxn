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
          <img src="../assets/image/icon/expression.png" alt="" />
          <img src="../assets/image/icon/Photo.png" alt="" />
          <img src="../assets/image/icon/photograph.png" alt="" />
          <img src="../assets/image/icon/voice.png" alt="" />
          <img src="../assets/image/icon/thumbs-up.png" alt="" />
        </div>
        <button class="send">
          <img @click="sendNew" src="../assets/image/icon/send.png" alt="" />
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      //保存从后端获取的数据
      messeages: [],
      //双向绑定input输入框的内容
      information: "",
    };
  },
  methods: {
    //发送消息时
    sendNew() {
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
        //将数据插入到数据库中
        this.axios
          .post("/user/insertNew", this.qs.stringify(informations))
          .then((res) => {
            //重置消息输入框
            this.information = "";
            // var div = document.getElementById("main"); // 获取对象
            // div.scrollTop = div.scrollHeight; // 滚动高度
          });
      }
    },
  },
  //页面初次加载时
  mounted() {
    this.axios.get("/user/service", { params: { user_id: 1 } }).then((res) => {
      this.messeages = res.data.result;
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
  margin-bottom: 100px;
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
#service .footer .send img {
  width: 110%;
}
</style>