<template>
  <div>
    <el-container>

      <el-aside class="bossaside">
        <el-container>
          <el-header class="asidehead">
            <a class="logo" @click="firstrouter('home')">
              <img :src="require('assets/img/rabbitlogo.png')" alt="logo" />
            </a>
            <div
              class="primary"
              :class="{ primaryshow: primaryshow, primaryhidden: !primaryshow }"
            >
              <ul>
                <li>
                  <a :style="activeStyle" @click="newwindow('/shopdetail')">{{
                    $t("common.shopdetail")
                  }}</a>
                </li>
                <li @click="firstrouter('userinfo')">
                  <a>{{ $t("common.account") }}</a>
                </li>
                <li @click="firstrouter('showgoods')">
                  <a>{{ $t("common.allgoods") }}</a>
                </li>
              </ul>
            </div>
            <a
              :class="!primaryshow ? 'tirgger' : 'close'"
              @click="changeprimaryshow"
            >
              <img
                v-show="!primaryshow"
                :src="require('assets/img/humberger_icon.jpeg')"
              />
              <img
                v-show="primaryshow"
                :src="require('assets/img/close.gif')"
              />
            </a>
          </el-header>
          <div class="aside_body">
            <aside-body
              :titles="this.titles"
              :titlesrouter="this.titlesrouter"
              v-show="primaryshow"
            />
            <aside-body
              :titles="['二级导航!变形!']"
              :titlesrouter="[]"
              v-show="!primaryshow"
            />
          </div>
          <div class="aside_foot"></div>
        </el-container>
      </el-aside>

      <el-aside class="bossasidefeakdiv"></el-aside>

      <el-container class="main">
        <el-main>
          <router-view @loginsuccess="refreshuserinfo"></router-view>
        </el-main>
      </el-container>

      <el-tooltip content="点击我切换中文" placement="right-end">
        <mousesee class="m1" @click.native="languagechange('zh')"></mousesee>
      </el-tooltip>

      <el-tooltip content="Change To English" placement="left-end">
        <mousesee class="m2" @click.native="languagechange('en')"></mousesee>
      </el-tooltip>

      <mouserun></mouserun>

    </el-container>

    <zhezhao v-if="zzshow" :runtime="4000"></zhezhao>

  </div>
</template>

<script>
import "animate.css";
import mousesee from "@/components/common/mousesee";
import mouserun from "@/components/common/mouserun";
import zhezhao from "@/components/common/zhezhao";
import AsideBody from "@/views/Home/Home/ChildCmp/AsideBody";
import { timehello } from "@/common/utils";
export default {
  components: {
    AsideBody,
    mousesee,
    mouserun,
    zhezhao,
  },
  computed: {
    activeStyle() {
      return !this.primaryshow ? { color: "#fff" } : {}; 
        },
  },
  data() {
    return {
      titles: [],
      titlesrouter: [],
      primaryshow: true,
      hourtime: 99999,
      username: "",
      zzshow: false,
    };
  },
  created() {
    if (!window.sessionStorage.getItem("firstrouter")) {
      this.zzshow = true;
    }
    if (!!window.sessionStorage.getItem("language")) {
      this.$i18n.locale = window.sessionStorage.getItem("language");
    }
    //  拿到系统时间
    let myDate = new Date();
    this.hourtime = myDate.getHours();
    //网页刷新可以从session中获取到username
    if (!!window.sessionStorage.getItem("username")) {
      this.username = window.sessionStorage.getItem("username");
    }
    //创建或者拿到二级导航缓存（二级导航内需要用到的数据，需要在此之前被赋值，否则会出现bug）
    if (window.sessionStorage.getItem("firstrouter") == null) {
      //页面是初次创建
      // console.log("网页创造")
      this.firstrouter("home");
    } else {
      //页面刷新，拿出二级导航的路径
      // console.log("网页刷新")
      this.firstrouter(window.sessionStorage.getItem("firstrouter"));
    }
  },
  methods: {
    refreshuserinfo() {
      //拿到用户名，刷新二级导航
      this.username = window.sessionStorage.getItem("username");
      // this.$router.go(0);
      this.firstrouter("userinfo");
    },
    firstrouter(firstrouter) {
      let flag = window.sessionStorage.getItem("flag");

      if (this.$i18n.locale == "zh") {
        switch (firstrouter) {
          case "home":
            if (flag != "normaluser") {
              //用户登录判断     !this.username
              this.titles = ["心情惬意，闲逛一下   🌟 "];
            } else {
              if (this.hourtime >= 5 && this.hourtime < 9)
                this.titles = [`早晨好，${this.username}  ☕`];
              if (this.hourtime >= 9 && this.hourtime < 12)
                this.titles = [`上午好，${this.username}  ☕`];
              if (this.hourtime >= 12 && this.hourtime < 18)
                this.titles = [`下午好，${this.username}  ☕`];
              if (this.hourtime >= 18 && this.hourtime < 20)
                this.titles = [`傍晚好，${this.username}  ☕`];
              if (this.hourtime >= 20 && this.hourtime < 23)
                this.titles = [`晚间好，${this.username}  ☕`];
              if (this.hourtime >= 23 || this.hourtime < 5)
                this.titles = [`夜已深啦，尽早休息     ❤️️`];
            }
            this.$router.push("/home");
            break;
          case "userinfo":
            if (flag != "normaluser") {
              this.titles = ["登录您的帐户 🌟", "登录", "关于俱乐部"];
              this.titlesrouter = ["null", "login", "deposit"];
              this.$router.push("/login");
            } else {
              let time = timehello();
              if (time >= 23 || time < 5) {
                this.titles = [
                  "夜已深啦，尽早休息     ❤️",
                  " 账户一览",
                  "账户设置",
                ];
              } else {
                this.titles = [
                  time,
                  this.username + " 账户一览",
                  "账户设置",
                  "加入俱乐部",
                ];
              }
              this.titlesrouter = [
                "null",
                "userinfo",
                "updateuserinfo",
                "deposit",
              ];
              this.$router.push("/userinfo");
            }
            break;
          case "showgoods":
            this.titles = ["所有商品", "商品", "春", "夏", "秋", "冬"];
            this.titlesrouter = [
              "null",
              "all",
              "spring",
              "summer",
              "autumn",
              "winter",
            ];
            this.$router.push("/all"); //默认跳转all goods
            break;
        }
      } else {
        switch (firstrouter) {
          case "home":
            if (flag != "normaluser") {
              //用户登录判断     !this.username
              this.titles = [" It’s a great day  🌟 "];
            } else {
              if (this.hourtime >= 5 && this.hourtime < 9)
                this.titles = [`Good morning，${this.username}  ☕`];
              if (this.hourtime >= 9 && this.hourtime < 12)
                this.titles = [`Good forenoon${this.username}  ☕`];
              if (this.hourtime >= 12 && this.hourtime < 18)
                this.titles = [`Good afternoon${this.username}  ☕`];
              if (this.hourtime >= 18 && this.hourtime < 20)
                this.titles = [`Good evening${this.username}  ☕`];
              if (this.hourtime >= 20 && this.hourtime < 23)
                this.titles = [`Good night${this.username}  ☕`];
              if (this.hourtime >= 23 || this.hourtime < 5)
                this.titles = [`Good night     ❤️️`];
            }
            this.$router.push("/home");
            break;
          case "userinfo":
            if (flag != "normaluser") {
              this.titles = ["login account 🌟", "login in", "club"];
              this.titlesrouter = ["null", "login", "deposit"];
              this.$router.push("/login");
            } else {
              let time = timehello();
              if (time >= 23 || time < 5) {
                this.titles = ["Good night     ❤️️", "account", "set account"];
              } else {
                this.titles = [
                  time,
                  this.username + "’account",
                  "set account",
                  "join club",
                ];
              }
              this.titlesrouter = [
                "null",
                "userinfo",
                "updateuserinfo",
                "deposit",
              ];
              this.$router.push("/userinfo");
            }
            break;
          case "showgoods":
            this.titles = [
              "All Goods",
              "all",
              "spring",
              "summer",
              "autumn",
              "winter",
            ];
            this.titlesrouter = [
              "null",
              "all",
              "spring",
              "summer",
              "autumn",
              "winter",
            ];
            this.$router.push("/all"); //默认跳转all goods
            break;
        }
      }

      //把二级导航放到session
      window.sessionStorage.setItem("firstrouter", firstrouter);
    },
    changeprimaryshow() {
      this.primaryshow = !this.primaryshow;
      //  二级菜单页面切换
    },
    newwindow(path) {
      let routeUrl = this.$router.resolve(path);
      window.open(routeUrl.href, "_blank");
    },
    // 国际化语言切换
    languagechange(value) {
      // this.$i18n.locale = value; // 该页面可以响应式的数据会产生突变,可以在create阶段进行改变
      window.sessionStorage.setItem("language", value);
      this.$router.go(0);
    },
  },
};
</script>

<style  lang="less" scoped>
.bossaside {
  height: 100vh;
  width: 28vw !important;
  position: fixed;
  top: 0;
  left: 0;
}
////元素fixed脱离文档流，用来占位元素
.bossasidefeakdiv {
  height: 100vh;
  width: 28vw !important;
}
//侧边栏头部
.asidehead {
  display: flex;
  height: 18vh !important;
  padding: 2vh 1vw;
  //一级目录
  .primary {
    height: 100%; //高度填充
    flex: 6 1 auto;
    display: flex;
    align-items: center;
    // padding-right: .3vw ;
    //background-color: #ff8198;
    ul {
      display: flex;
      width: 100%;
      //子元素间隔开，或者使用margin
      justify-content: space-between;
      list-style: none;
      li {
        flex: 1;
        a {
          font-size: 1.3vw;
          font-weight: 700;
          white-space: nowrap; //字体超出不换行
        }
      }
    }
  }

  //图片
  a {
    height: 100%; //高度填充
    width: 3vw;
    flex-grow: 1;
    position: relative;
    display: flex;
    align-items: center;
  }
  .logo img {
    width: 80%;
    padding-bottom: 1.3vw;
  }
  .tirgger img {
    width: 50%;
    //图片贴右
    position: absolute;
    right: 0;
  }
  .close img {
    width: 30%;
    //图片贴右
    position: absolute;
    right: 0;
  }
}
//侧边栏内容区
.aside_body {
  height: 72vh;
  width: 100%;
  display: flex;
  justify-content: center; //水平居中
  align-items: center;
  //flex-direction: row;    设置主轴
  //align-item:center;    这个是子元素的属性少一个s
}
//侧边栏垫高
.aside_foot {
  height: 10vh;
}

.primaryshow {
  transition: opacity 0.5s;
}
.primaryhidden {
  transition-duration: 0.5s;
  opacity: 0;
}

.el-main {
  background-color: rgba(241, 246, 209, 0.5);
  color: #333;
  padding: 0px;
}
//改部分子组件的样式
.m1 {
  /deep/ .ms {
    background-color: red;
    position: fixed;
    bottom: 5vh;
    right: 5vw;
  }
}
.m2 {
  /deep/ .ms {
    background-color: green;
    position: fixed;
    bottom: 5vh;
    left: 33vw;
  }
}
</style>