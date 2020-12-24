<template>
  <div id="login">
    <mt-header title="用户登录" class="log_header">
      <router-link to="/site" slot="left">
        <mt-button icon="back" ></mt-button>
      </router-link>
    </mt-header>
    <div class="log">      
      <p>
        <span class="me icon iconfont icon-wo"></span>
        <mt-field
          type="text"
          placeholder="请输入您的手机号/用户名"
          v-model="username"
          :attr="{ maxlength: 16, autocomplete: 'off' }"
          @blur.native.capture="checkUsername"
          :state="usernameState"
          @keydown.13="handle"
        ></mt-field>
      </p>
      <p>
        <span class="icon iconfont icon-mima"></span>
        <mt-field
          type="password"
          placeholder="请输入密码"
          v-model="password"
          :attr="{ minlength: 6, maxlength: 16, autocomplete: 'off' }"
          @blur.native.capture="checkPassword"
          :state="passwordState"
          @keydown.13="handle"
        ></mt-field>
      </p>
      <p>
        <button @click="handle">登录</button>
      </p>
      <p class="login" @click="toBack('/register')">
        没 有 账 号 ，<b>去 注册</b>
      </p>
    </div>
    <br />
  </div>
</template>
<script>
export default {
  data() {
    return {
      //用户名、密码
      username: "",
      password: "",
      //用户名、密码的状态
      usernameState:"",
      passwordState:"",
    };
  },
  methods: {
    
    // 跳转到路由
    toBack(path) {
      this.$router.push(path);
    },
    // 校验用户名
    checkUsername() {
      let usernameRegExp = /^[0-9A-Za-z]{6,12}$/;
      if (usernameRegExp.test(this.username)) {
        this.usernameState = "success";
        return true;
      } else {
        this.$toast({
          message: "用户名错误",
          position: "middle",
          duration: 2500,
        });
        this.usernameState = "error";
        return false;
      }
    },
    // 校验密码
    checkPassword() {
      let passwordRegExp = /^[0-9A-Za-z]{6,16}$/;
      if (passwordRegExp.test(this.password)) {
        this.passwordState = "success";
        return true;
      } else {
        this.$toast({
          message: "密码错误",
          position: "middle",
          duration: 2500,
        });
        this.passwordState = "error";
        return false;
      }
    },   
    handle() {
      if(this.checkUsername() && this.checkPassword()){
        let obj = {
          username:this.username,
          password:this.password          
        };
        let str = this.qs.stringify(obj);     
        this.axios.post('/user/login',str).then(res=>{
            //登录失败
            console.log(res)
            if(res.data.code ==  201){
              this.$messagebox.confirm('登录失败,是否注册新用户','提示信息').then(()=>{
                this.$router.push('/register');
              }).catch(error=>{

              });
            }
            if(res.data.code == 200){
              this.$store.commit('loginMutation',res.data.info);
              localStorage.setItem('isLogined',1);
              localStorage.setItem('info',JSON.stringify(res.data.info));
              this.$router.push('/index');             
            }
        });
      }
    },
  },
};
</script>

<style>
.log_header{
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
  border-bottom: 1px solid #ccc;
}
#login {
  width: 375px;
  height: 667px;
  background: url(../assets/user/bg.jpg);
  background-size: 375px 667px;
  position: relative;
}
.log {
  position: absolute;
  top: 80px;
  left: 10px;
  height: 300px;
  width: 340px;
  border-radius: 10px;
  padding: 10px;
  color: #f8b0c3;
}
.mint-cell{
  border-radius: 5px;
}
.log h3 {
  text-align: center;
  color:#f8b0c3;
  font-size: 24px;
  margin-bottom: 10px;
}
.log p {
  padding: 5px;
  position: relative;
}
.log p input {
  border: 0;
  height: 30px;
  width: 95%;
  padding: 5px;
  padding-left: 25px;
  border-radius: 5px;
  background: rgba(255, 255, 555, 0);
  border-bottom: 2px solid #faa7c1;
}
.log p .icon{
  position: absolute;
  top:20px;
  left: 20px;
  z-index: 888;
}
.log p .me{
  left: 14px;
}
.log p button {
  border: 0;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #ffffff;
  background: #f8b0c3;
  border-radius: 5px;
  opacity: .8;
}
.log p.login {
margin-top: 10px;
 text-align: center;
 color:#999;
}
.log p.login b{
   color:#666;
}
</style>
