<template>
  <!--  Login_div  Options_div   Registered_div  按照层级排列，顺序不得更换（双向滑动效果）-->
  <div class="main">
    <div class="Login_div">
      <div class="form">
        <h1>登录</h1>
        <span>请登录您的账号</span>
        <div class="eneter">
          <input
            v-model="loginForm.username"
            type="text"
            placeholder="Username"
            @blur="checkusername(loginForm.username)"
          />
          <input
            v-model="loginForm.password"
            type="password"
            placeholder="Password"
            @blur="checkpassword(loginForm.password)"
          />
        </div>
        <a @click="$router.push('/forgetpassword')"> 忘记密码？ </a>
        <button class="submit_button" @click="login">
          <span> Login </span>
        </button>
      </div>
    </div>
    <div class="Options_div">
      <div id="Switch_Registered">
        <h1>还没有账号？</h1>
        <p>立即注册，和我们一起<br />开始旅程吧</p>
        <button id="Registered_button" @click="gotoRegister">前往注册</button>
      </div>
      <div id="Switch_Login">
        <h1>已有账号？</h1>
        <p>请使用您的帐号进行登录</p>
        <button id="Login_button" @click="gotoLogin">前往登录</button>
      </div>
    </div>
    <div class="Registered_div">
      <div class="form">
        <h1>注册</h1>
        <span>注册您的第一个账号</span>
        <div class="eneter">
          <input
            v-model="registerinfo.username"
            type="text"
            placeholder="Username"
            @blur="checkusername(registerinfo.username)"
          />
          <input
            v-model="registerinfo.password"
            type="password"
            placeholder="Password"
            @blur="checkpassword(registerinfo.password)"
          />
          <input
            v-model="registerinfo.email"
            type="text"
            placeholder="Email"
            @blur="checkemail(registerinfo.email)"
          />
          <button
            class="submit_button"
            @click="identifyingEmail(registerinfo.email)"
          >
            <span> 验证邮箱 </span>
          </button>
          <input
            name="identifying_code"
            v-model="registerinfo.identifying_code"
            type="text"
            placeholder="Identifying Code"
            @blur="checkidentify(registerinfo.identifying_code)"
          />
        </div>
        <button class="submit_button" @click="register">
          <span> Register </span>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import $ from "jquery";
import { login, register } from "@/network/login";
import { chexkrules } from "@/assets/mixins/checkrules";
import { mapActions } from "vuex";
export default {
  name: "Login",
  data() {
    return {
      registerinfo: {
        username: "",
        password: "",
        email: "",
        identifying_code: "",
      },
      loginForm: {
        username: "username",
        password: "password1",
        // username: "rywtest",
        // password: "qwe12345"
      },
    };
  },
  mixins: [chexkrules], //使用混入mixin来封装校验规则   js层的封装无法在methods中直接使用，所以引入mixin的封装
  methods: {
    gotoLogin() {
      // document.querySelector(".Registered_div").animate({width:"0",opacity:"0"});  animate属性没有生效
      $(".Registered_div").animate({ width: "0", opacity: "0" });
      $(".Login_div").animate({ width: "50%", opacity: "1" });
      $("#Switch_Login").animate({ opacity: "0" });
      $("#Switch_Registered").animate({ opacity: "1" });
      $("#Switch_Login").slideUp();
      $("#Switch_Registered").slideDown(500);
    }, //滑动门效果
    gotoRegister() {
      $(".Login_div").animate({ width: "0", opacity: "0" });
      $(".Registered_div").animate({ width: "50%", opacity: "1" });
      $("#Switch_Registered").animate({ opacity: "0" });
      $("#Switch_Login").animate({ opacity: "1" });
      $("#Switch_Registered").slideUp();
      $("#Switch_Login").slideDown();
    }, //滑动门效果
    ...mapActions({
      setuserinfo: "setuserinfo",
    }),
    login() {
      if (
        this.checkusername(this.loginForm.username) &&
        this.checkpassword(this.loginForm.password)
      ) {
        //信息合法
        //this.$message.success("规则验证成功");
        login(this.loginForm.username, this.loginForm.password).then((res) => {
          //使用post请求
          //console.log(res)
          switch (res.data) {
            case "normaluser": //登陆成功
              //前端有sessionStorage, 页面刷新不会消失,只有当页面关闭时或者浏览器关闭才会删除
              window.sessionStorage.setItem("flag", "normaluser");
              window.sessionStorage.setItem(
                "username",
                this.loginForm.username
              );
              this.$message.success("~Login Success~");
              this.$router.push({ path: "/userinfo" });
              this.$emit("loginsuccess"); //刷新二级导航
              break;
            case "admin":
              window.sessionStorage.setItem("flag", "admin");
              window.sessionStorage.setItem(
                "username",
                this.loginForm.username
              );
              this.$store.state.user.username = this.loginForm.username;
              this.$message.success("~Login Success~");
              this.$router.push({ path: "/admin" });
              break;
            case "error":
              this.$message.error("~仔细检查账户和密码呢~");
              break;
          }
        });
      } else {
        this.$message.error("~按照规则输入账户密码~");
      }
    }, //登录
    register() {
      //判断所有的输入框内容符合输入规则
      if (
        this.checkusername(this.registerinfo.username) &&
        this.checkpassword(this.registerinfo.password) &&
        this.checkemail(this.registerinfo.email) &&
        this.checkidentify(this.registerinfo.identifying_code)
      ) {
        //符合输入条件
        register(
          this.registerinfo.username,
          this.registerinfo.password,
          this.registerinfo.email,
          this.registerinfo.identifying_code
        ).then((res) => {
          // console.log(res)
          switch (res.data) {
            case "000":
              this.$message.error("~验证码集为空，请再次申请验证码~");
              break;
            case "0":
              this.$message.error("~插入操作失败~");
              break;
            case "00":
              this.$message.error("~用户名或者邮箱重复~");
              break;
            case "002":
              this.$message.error("~验证码不正确，校验失败~");
              break;
            case "001":
              this.$message.error("~验证码超时或不正确，校验失败~");
              break;
            case "insertsuccess":
              window.sessionStorage.setItem("flag", "ok");
              this.$message.success("Register Success");
              this.$router.go(0);
              break;
            default:
              this.$message.error("验证码校验失败,检查后重试");
          }
        });
      } else {
        this.$message.error("~按照规则填写对应的信息~");
      }
    }, //注册
  },

  beforeCreate() {
    // document.querySelector('body').setAttribute('style', 'background-color:#fff')
  }, //修改body
  beforeDestroy() {
    // document.querySelector('body').removeAttribute('style')
  },
};
</script>
<style scoped>
span {
  font-size: 1.3rem;
}
p {
  font-size: 1.5rem;
}
div {
  display: block;
}
button {
  outline: none;
}
h1 {
  font-weight: bold;
  margin-top: 15%;
  font-size: 4rem;
}
.form {
  background: #fff;
  display: flex;
  flex-direction: column;
  /*justify-content: center;*/
  /*align-items: center;*/

  padding: 0 50px;
  height: 100%;
  text-align: center;
}
input {
  background: #eee;
  border: none;
  padding: 0.8rem 1.8rem;
  margin: 1rem 0;
  width: 100%;
  outline: none;
  border-radius: 30px;
  /*font-family: monospace;*/
  font-size: 2.3rem;
}
a {
  color: black;
  font-size: 1.5rem;
  text-decoration: none;
  margin: 20px 0;
}
.main {
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
  /*position: relative;*/
  display: flex;
  overflow: hidden;
  width: 90%;
  height: 90%;
  margin: 5%;
}
.Login_div {
  border-radius: 10px;
  background: #fff;
  width: 50%;
  height: 100%;
  opacity: 1;
  text-align: center;
}
.Options_div {
  background: #fff;
  background-color: #ff8198;
  width: 50%;
  height: 100%;
  color: #fff;
  text-align: center;
  /* 子元素垂直居中*/
}
.Options_div h1 {
  margin: 45% 0 30px 0;
}
.Options_div span {
  font-size: 1.5rem;
  letter-spacing: 1px;
}
.Options_div button {
  background: transparent;
  border: 1px solid #fff;
  border-radius: 2rem;
  color: #fff;
  font-size: 1.5rem;
  font-weight: bold;
  padding: 12px 45px;
  letter-spacing: 5px;
  margin-top: 8%;
}
.Registered_div {
  border-radius: 10px;
  background: #fff;
  width: 0;
  height: 100%;
  opacity: 0;
}

.Registered_div .submit_button {
  margin-top: 0.5rem;
}

.eneter {
  margin-top: 8%;
}
.submit_button {
  border-radius: 2rem;
  border: 1px solid rgba(255, 129, 152, 0.5);
  background: #ff8198;
  padding: 10px 30px;
  color: #fff;
  font-size: 1.5rem;
  font-weight: bold;
  text-indent: 5px;
  letter-spacing: 5px;
  white-space: nowrap;
}
#Switch_Registered {
  width: 100%;
  height: 100%;
  opacity: 1;
}
#Switch_Login {
  width: 100%;
  height: 100%;
  display: none;
  opacity: 0;
}
</style>
