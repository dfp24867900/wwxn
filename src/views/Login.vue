.<template>
  <div id="login">
    用户名：<input type="text" v-model="uname" /> <br />
    密码：<input type="text" v-model="upwd" />
    <br />
    <button @click="userLogin">登录</button>
  </div>
</template>

<script>
// Login.vue
import API from "@/util/api.js";
export default {
  name: "login",
  data() {
    return {
      uname: "",
      upwd: "",
      phone:'',
      email:''
    };
  },
  methods: {
    // 登录
    userLogin() {
      let data = {uname: this.uname, upwd: this.upwd }; //请求参数
      // data=JSON.stringify(data)
      API.login(data).then((res) => {
          //请求成功
          console.log(res);
        })
        .catch((err) => {
          //请求失败
        });
    }
  },
};
</script>

<style>
</style>