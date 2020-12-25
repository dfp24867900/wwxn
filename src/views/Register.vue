.<template>
  <div id="rigister">
    <mt-header title="用户注册" class="reg_header">
      <router-link to="/login" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class="reg">
      <p>
        <span class="phone icon iconfont icon-shouji"></span>
        <mt-field
          type="text"
          placeholder="请输入注册的手机号"
          v-model="phone"
          :attr="{ maxlength: 11, autocomplete: 'off' }"
          @blur.native.capture="checkPhone"
          :state="phoneState"
          @keydown.13="userregister"
        ></mt-field>
      </p>
      <p>
        <span class="icon iconfont icon-mima"></span>
        <mt-field
          type="password"
          placeholder="请输入密码"
          v-model="upwd"
          :attr="{ minlength: 6, maxlength: 16, autocomplete: 'off' }"
          @blur.native.capture="checkPasssword"
          :state="passwordState"
          @keydown.13="userregister"
        ></mt-field>
      </p>
      <p>
        <span class="icon iconfont icon-mima"></span>
        <mt-field
          type="password"
          placeholder="请输入确认密码"
          v-model="conpassword"
          :attr="{ maxlength: 16, autocomplete: 'off' }"
          @blur.native.capture="checkConpasssword"
          :state="conpasswordState"
          @keydown.13="userregister"
        ></mt-field>
      </p>
      <p>
        <span class="me icon iconfont icon-wo"></span>
        <mt-field
          type="text"
          placeholder="请输入用户名"
          v-model="uname"
          :attr="{ maxlength: 16 }"
          @blur.native.capture="checkUsername"
          :state="usernameState"
          @keydown.13="userregister"
        ></mt-field>
      </p>
      <p>
        <span class="email icon iconfont icon-youxiang"></span>
        <mt-field
          type="email"
          name="email"
          placeholder="请输入邮箱"
          v-model="email"
          :attr="{ maxlength: 16 }"
          @blur.native.capture="checkEmail"
          :state="emailState"
          @keydown.13="userregister"
        ></mt-field>
      </p>
      <p>
        <button @click="userregister">注 册</button>
      </p>
      <p class="login" @click="toBack('/login')">
        已 有 账 号 ，<b>去 登 录</b>
      </p>
    </div>
    <br />
  </div>
</template>

<script>
import API from "@/util/api.js";
import { Toast } from "vant";
export default {
  name: "rigister",
  data() {
    return {
      uname: "",
      upwd: "",
      conpassword: "",
      phone: "",
      email: "",
      phoneState: "",
      usernameState: "",
      passwordState: "",
      conpasswordState: "",
      emailState: "",
    };
  },
  methods: {
    // 跳转到路由
    toBack(path) {
      this.$router.push(path);
    },
    // 判断手机号
    checkPhone() {
      let phoneExp = /^1[3|4|5|8][0-9]\d{4,8}$/;
      if (phoneExp.test(this.phone)) {
        this.phoneState = "success";
        return true;
      } else {
        this.phoneState = "error";
        this.$toast({
          message: "手机号码错误",
          position: "top",
          duration: "3000",
        });
        return false;
      }
    },
    // 判断用户名
    checkUsername() {
      let usernameRegExp = /^[\u4e00-\u9fa50-9a-zA-Z]{6,12}$/;
      if (usernameRegExp.test(this.uname)) {
        this.usernameState = "success";
        return true;
      } else {
        this.usernameState = "error";
        this.$toast({
          message: "用户名为必填项",
          position: "top",
          duration: "3000",
        });
        return false;
      }
    },
    // 判断密码
    checkPasssword() {
      let passwordRegExp = /^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
      if (passwordRegExp.test(this.upwd)) {
        this.passwordState = "success";
        return true;
      } else {
        this.passwordState = "error";
        this.$toast({
          message: "密码为数字、字母的组合体",
          position: "top",
          duration: "3000",
        });
        return false;
      }
    },
    // 确认密码
    checkConpasssword() {
      if (this.conpassword !== this.upwd) {
        this.conpasswordState = "error";
        this.$toast({
          message: "两次密码不一致",
          position: "top",
          duration: "3000",
        });
        return false;
      } else if (!this.conpassword) {
        this.conpasswordState = "error";
        this.$toast({
          message: "两次密码不一致",
          position: "top",
          duration: "3000",
        });
        return false;
      } else {
        this.conpasswordState = "success";
        return true;
      }
    },
    // 邮箱验证
    checkEmail() {
      if (this.email) {
        this.emailState = "success";
        return true;
      } else {
        this.emailState = "error";
        return false;
      }
    },
    // 点击注册按钮
    userregister() {
      if(this.checkPhone() && this.checkUsername() && this.checkPasssword() && this.checkConpasssword() && this.checkEmail()){
        let data = {
        uname: this.uname,
        upwd: this.upwd,
        phone: this.phone,
        email: this.email,
      };
        API.register(data)
          .then((res) => {
            this.$router.push('/login')
          })
          .catch((err) => {
          });
      }else{
        Toast("请输入正确的用户名，密码，手机号，邮箱"); 
      }
      
    },
  },
};
</script>

<style>
.reg_header{
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
  border-bottom: 1px solid #ccc;
}
#rigister {
  width: 375px;
  height: 667px;
  background: url(../assets/user/bg.jpg);
  background-size: 375px 667px;
  position: relative;
}
.reg {
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
.reg h3 {
  text-align: center;
  color: #f8b0c3;
  font-size: 24px;
  margin-bottom: 10px;
}
.reg p {
  padding: 5px;
  position: relative;
}
.reg p input {
  border: 0;
  height: 30px;
  width: 95%;
  padding: 5px;
  padding-left: 25px;
  border-radius: 5px;
  background: rgba(255, 255, 555, 0);
  border-bottom: 2px solid #faa7c1;
}
.reg p .icon{
  position: absolute;
  top:20px;
  left: 20px;
  z-index: 888;
}
.reg p .phone{
   left: 21px;
}
.reg p .email{
  left: 18px;
}
.reg p .me{
  left: 14px;
}
.reg p button {
  border: 0;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #ffffff;
  background: #f8b0c3;
  border-radius: 5px;
  opacity: .8;
}
.reg p.login {
margin-top: 10px;
 text-align: center;
 color:#999;
}
.reg p.login b{
   color:#666;
}
</style>