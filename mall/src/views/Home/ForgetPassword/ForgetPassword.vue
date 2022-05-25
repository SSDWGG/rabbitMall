<template>
  <el-container>
    <el-header>
      <div class="head">Identification （Email) authenticating</div>
    </el-header>
    <el-main>
      <div v-show="emailtag">
        <!--      第一步  验证身份-->
        <div class="emailhead">
          <p>please enter you email</p>
        </div>
        <div>
          <div style="display: flex; width: 100%; margin-bottom: 30px">
            <div class="email">
              <input
                type="text"
                v-model="email"
                placeholder="  your email  "
                @blur="checkemail(email)"
              />
            </div>

            <div class="sessionquit" @click="updateidentifyingEmail(email)">
              Check
            </div>
          </div>
          <div style="display: flex; width: 100%">
            <div class="identify">
              <input
                type="text"
                v-model="identify"
                placeholder="  enter identify  "
                @blur="checkidentify(identify)"
              />
            </div>
            <div class="sessionquit" @click="identifyingcode(identify, email)">
              Confirm
            </div>
          </div>
        </div>
      </div>
      <div v-show="!emailtag">
        <!--        修改密码-->
        <div class="emailhead">
          <p>Checking Success~</p>
        </div>

        <div>
          <div style="display: flex; width: 100%; margin-bottom: 30px">
            <div class="email">
              <input
                type="text"
                v-model="password"
                placeholder="  enter password  "
                @blur="checkpassword(password)"
              />
            </div>
          </div>
          <div style="display: flex; width: 100%">
            <div class="identify">
              <input
                type="text"
                v-model="passwordagain"
                placeholder="  again  "
                @blur="checkpassword(password)"
              />
            </div>
            <div class="sessionquit" @click="checkpasswordfinall">Confirm</div>
          </div>
        </div>
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { chexkrules } from "@/assets/mixins/checkrules";
import { updatepassword } from "@/network/login";

export default {
  name: "ForgetPassword",
  data() {
    return {
      emailtag: true,
      email: "",
      identify: "",
      password: "",
      passwordagain: "",
    };
  },
  mixins: [chexkrules],
  methods: {
    checkpasswordfinall() {
      if (
        this.checkpassword(this.password) &&
        this.checkpassword(this.passwordagain)
      ) {
        if (this.password === this.passwordagain) {
          updatepassword(this.passwordagain, this.email).then((res) => {
            // console.log(res.data)
            if (res.data) {
              this.$message.success("update success");
              window.sessionStorage.clear(); //清除用户的账户密码
              this.$router.push("/login");
              this.$emit("loginsuccess");
            } else {
              this.$message.error("error");
            }
          });
        } else {
          this.$message.warning("检查两次密码的输入");
        }
      } else {
        this.$message.warning("请输入符合规则的密码");
      }
    },
  },
};
</script>

<style lang="less" scoped>
.sessionquit {
  width: 70px;
  height: 30px;
  border-radius: 30px;
  border: 0.5px solid rgba(12, 12, 12, 0.1);
  box-shadow: 7px 0px 2px rgba(12, 12, 12, 0.1);
  display: flex;
  align-self: center;
  justify-content: center;
  line-height: 30px;
  font-size: 14px;
  font-weight: 100;
  //font-family: monospace;
  margin-left: 20px;
  //style="height: 1.7em;width: 55px;font-size: .8em;line-height:  1.7em;"
}
.sessionquit:hover {
  border: 0.1px solid #8c8c8c;
}
.el-header {
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 500;
  font-size: 20px;
}
.el-main {
  .emailhead {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: #ff8198;
    margin-bottom: 30px;
  }
  .email {
    line-height: 30px;
    width: 80%;
    font-size: 30px;
    border-radius: 30px;
    padding: 2px 15px;
    background-color: rgba(241, 246, 209, 0.5);
    input {
      height: 50px;
      width: 100%;
      border: 0;
      outline: none;
      background-color: transparent;
    }
  }
  .identify {
    line-height: 30px;
    width: 80%;
    font-size: 30px;
    border-radius: 30px;
    padding: 2px 15px;
    background-color: rgba(241, 246, 209, 0.5);
    input {
      height: 50px;
      width: 100%;
      border: 0;
      outline: none;
      background-color: transparent;
    }
  }
}
</style>