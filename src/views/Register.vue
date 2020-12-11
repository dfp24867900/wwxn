.<template>
  <div id="rigister">
    <div class="reg">
      <h3>用户注册</h3>
      <p>
        <input 
          type="text"
          name="phone"
          placeholder="请输入注册的手机号"
          v-model="phone"
        />
      </p>
      <p>
        <input
          type="password"
          name="upwd"
          placeholder="请输入密码"
          v-model="upwd"
        />
      </p>
      <p>
        <input
          type="text"
          name="uname"
          placeholder="请输入用户名"
          v-model="uname"
        />
      </p>
      <p>
        <input
          type="email"
          name="email"
          placeholder="请输入邮箱"
          v-model="email"
        />
      </p>
      <p>
         <button @click="userregister">注册</button>
         <button class="login">登录</button>
      </p>
    </div>
    <br />
  </div>
</template>

<script>
import API from "@/util/api.js";
export default {
  name: "rigister",
  data() {
    return {
      uname: "",
      upwd: "",
      phone: "",
      email: "",
    };
  },
  methods: {
    // 注册
    userregister() {
      let data = {
        uname: this.uname,
        upwd: this.upwd,
        phone: this.phone,
        email: this.email,
      };
      API.register(data)
        .then((res) => {
          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>

<style>
#rigister {
  width: 375px;
  height: 667px;
  background: url(../assets/user/login_bg.png);
  position: relative;
}
.reg {
  position: absolute;
  top: 100px;
  left: 10px;
  height: 300px;
  width: 340px;
  border-radius: 10px;
  padding: 10px;
  /* background: rgba(255, 255, 255, 0.5); */
  color: #FE4577;
}
.reg h3{
   text-align: center;
   color: #FE4577;
   font-size: 24px;
   margin-bottom: 10px;
}
.reg p{
   padding: 5px;
}
.reg p input{
   border: 0;
   height: 30px;
   width: 95%;
   padding: 5px;
   padding-left: 25px;
   border-radius: 5px;
   background: rgba(255, 255, 555, 0);
   border-bottom: 2px solid #FAA7C1;
}
.reg p button{
   border:0;
   padding: 10px;
   font-size: 18px;
   background: rgba(255, 255, 555, 0);
   margin: 15px;
}
.login{
   float: right;
   margin-right: 15px;
}
</style>