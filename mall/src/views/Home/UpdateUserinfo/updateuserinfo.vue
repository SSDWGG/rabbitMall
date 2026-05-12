<template>
  <el-container>
    <el-header>
      <div class="userhead">
        <div>
          <p>账户设置</p>
        </div>
      </div>
      <div class="line"></div>
      <div class="user">
        <div class="userimg">
          <img v-lazy="this.user.userinfo.tximg" />
        </div>
        <div class="hellouser">
          <p>{{ this.user.username }},的账户详情：</p>
        </div>
      </div>
    </el-header>
    <el-main>
      <div class="content">
        <div class="saidhead">
          <p>update：</p>
        </div>
        <div class="contentmain">
          <p>
            🈲 Username：<input
              type="text"
              v-model="updateform.username"
              :placeholder="user.username"
              readonly="readonly"
            />
          </p>
          <p>
            🈲 Email：<input
              type="text"
              v-model="updateform.email"
              :placeholder="user.email"
              readonly="readonly"
            />
          </p>
          <p>
            Adress：<input
              type="text"
              v-model="updateform.adress"
              :placeholder="user.userinfo.adress"
            />
          </p>
          <p>
            Age：<input
              type="text"
              v-model="updateform.age"
              :placeholder="user.userinfo.age"
            />
          </p>
          <div
            class="sessionquit"
            @click="change"
            style="font-size: 1.3rem"
            v-show="save"
          >
            保存修改
          </div>
          <a
            @click="$router.push('/forgetpassword')"
            style="
              color: #ff8198;
              font-size: 3rem;
              margin-top: 2rem;
              line-height: 3rem;
            "
          >
            Update Password?
          </a>
        </div>
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { chexkrules } from "@/assets/mixins/checkrules";
import { editUserinfo } from "@/network/admin";
export default {
  name: "updateuserinfo",
  mixins: [chexkrules],
  computed: {
    save() {
      return !(
        this.updateform.adress == "" &&
        this.updateform.username == "" &&
        this.updateform.email == "" &&
        this.updateform.age == null &&
        this.updateform.userimg == ""
      );
    },
    getinfo() {
      return this.user.id, this.user.userinfo.userinfoid;
    },
  },
  created() {
    //拿到user信息
    this.user = this.$store.state.user;
    // console.log(this.user.userinfo.userinfoid);
  },
  data() {
    return {
      user: {},
      fileList: [],
      updateform: {
        adress: "",
        username: "",
        email: "",
        age: undefined, //所有的占位符  undefind
        userimg: "",
      },
    };
  },
  methods: {
    change() {
      //    拿到改变值和没有改变的值，检验修规规则，上传数据库
      if (!this.updateform.adress)
        this.updateform.adress = this.user.userinfo.adress;
      if (!this.updateform.age) this.updateform.age = this.user.userinfo.age;

      if (
        this.checkadress(this.updateform.adress) &&
        this.checkage(this.updateform.age)
      ) {
        editUserinfo(
          this.user.id,
          this.updateform.age,
          this.updateform.adress
        ).then((res) => {
          switch (res.data) {
            case "error":
              this.$message.error("~修改操作失败~");
              break;
            case "updatesuccess":
              this.$message.success("~edit Success~");
              this.$store.state.user = {};
              break;
          }
        });
      }
    },
    newwindow(path) {
      let routeUrl = this.$router.resolve(path);
      window.open(routeUrl.href, "_blank");
    }, //忘记密码跳转

    // 上传文件相关
    beforeupload(file) {
      //上传图片前修改图片名称
      // console.log(file);
      // file.name = this.$store.state.user.id + ".jpg";  file名是固定的，为后台的文件或图片名称，不能更改,只能在后台做修改
      // console.log(file.name);
    },
    handleRemove(file, fileList) {
      // console.log(file, fileList);s
    },
    handlePreview(file) {
      // console.log(file);
    },
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },
    beforeRemove(file, fileList) {
      return this.$confirm(`确定移除 ${file.name}？`);
    },
    // 上传图片成功
    imgSuccess(res, file, fileList) {
      // console.log(res);
      // console.log(file);
      // console.log(fileList); // 这里可以获得上传成功的相关信息
      if (res == "success") {
        this.$message.success("~upload Success~");
        let that = this;
        setTimeout(function () {
          that.$router.go(0);
        }, 500);
      } else {
        this.$message.warning("error！");
      }
    },
  },
};
</script>

<style  lang="less" scoped>
.sessionquit {
  width: 100px;
  height: 50px;
  border-radius: 50px;
  border: 0.5px solid rgba(12, 12, 12, 0.1);
  /*border: .1px solid #8c8c8c;*/
  box-shadow: 7px 0px 2px rgba(12, 12, 12, 0.1);
  display: flex;
  align-self: center;
  justify-content: center;
  line-height: 50px;
  font-size: 1.3rem;
  font-weight: 300;
  //font-family: monospace;
  margin: 1rem 0;
  //transition: .6s;   控制的是内部元素的变形时间
}
.sessionquit:hover {
  border: 0.1px solid #8c8c8c;
}

.el-header {
  height: auto !important;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  //font-family: monospace;
  background-color: rgba(241, 246, 209, 0.3);
  .userhead {
    margin-top: 3rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 2rem;
    width: 100%;
    padding: 0 20px;
  }
  .user {
    width: 100%;
    display: flex;
    align-items: center;
    .userimg {
      width: 150px;
      img {
        border-radius: 50%;
        width: 100%;
      }
    }
    .hellouser {
      width: 100%;
      height: 70px;
      display: flex;
      align-items: center;
      justify-content: left;
      padding-left: 20px;
      font-size: 2rem;
      font-weight: 500;
    }
  }
}
.el-main {
  //font-family: monospace;
  display: flex;
  align-items: center;
  .content {
    display: flex;
    width: 100%;
    .saidhead {
      width: 30%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2.5rem;
      font-weight: 400;
    }
    .contentmain {
      width: 70%;
      padding-top: 4rem;
      line-height: 4rem;
      font-size: 2rem;
      //英文和数字这种连续文本也会被迫换行
      //word-wrap:break-word;
      input {
        background-color: rgba(255, 255, 255, 0);
        border-radius: 30px;
        border: 0px;
        outline: none;
      }
    }
  }
}
.line {
  border: 0.5px solid #ddd;
  width: 94%;
  margin: 10px auto;
}
.upload-demo {
  line-height: 0;
}
</style>