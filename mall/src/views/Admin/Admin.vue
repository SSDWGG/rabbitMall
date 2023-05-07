<template>
  <el-container class="home-container">
    <!--头部布局-->
    <el-header>
      <div>
        <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/rabbitlogo.png" alt class="logo_img" />
        <span>YG AdminSystem</span>
      </div>
      <el-button type="info" @click="logout">安全退出</el-button>
    </el-header>
    <el-container>
      <!--侧边布局-->
      <el-aside :width="isCollapse ? '64px' : '150px'">
        <!-- 侧边栏伸缩该显示的大小  -->
        <!--伸缩按钮-->
        <div class="toggle-button" @click="toggleCollapase">|||</div>
        <!--侧边栏菜单区 unique-opened="true" 只保持一个菜单展开 collapse绑定侧边的内容是否伸缩
        collapse-transition伸缩表单动画是否开启 router开启路由 active-text-color 颜色
        default-active展示的子路径-->

        <el-menu
          :default-active="activePath"
          background-color="#545c64"
          text-color="#fff"
          active-text-color="#ffd04b"
          unique-opened
          :collapse-transition="false"
          class="el-menu-vertical-demo"
          :router="true"
          :collapse="isCollapse"
        >
          <!--          一级菜单-->
          <el-submenu index="usermanage">
            <template slot="title">
              <i class="el-icon-location"></i>
              <!-- 图标-->
              <span slot="title">用户管理</span>
            </template>
            <!--           二级菜单-->
            <el-menu-item index="ShowAll" @click="saveNavState('ShowAll')"
              >账号信息</el-menu-item
            >
            <el-menu-item index="userself" @click="saveNavState('userself')"
              >用户个人信息</el-menu-item
            >
          </el-submenu>

          <el-submenu index="ordermanage">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span slot="title">物单管理</span>
            </template>
            <el-menu-item
              index="ManageOrder"
              @click="saveNavState('ManageOrder')"
              >订单管理</el-menu-item
            >
            <!--            带图标的二级菜单-->
            <el-menu-item
              index="ManageGoods"
              @click="saveNavState('ManageGoods')"
            >
              <i class="el-icon-menu"></i>
              <span slot="title">货物管理</span>
            </el-menu-item>
          </el-submenu>

          <el-menu-item index="AdminLog" @click="saveNavState('AdminLog')">
            <i class="el-icon-menu"></i>
            <span slot="title">管理员日志</span>
          </el-menu-item>
        </el-menu>
      </el-aside>
      <!--主体布局-->
      <el-main>
        <!--子路由的显示区域-->
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
/*引入后台管理界面的样式*/
import "@/assets/css/admin_global.css";
export default {
  name: "Admin",
  data() {
    return {
      isCollapse: false,
      activePath: "", // 显示当前路径
    };
  },
  // 类似onload
  created() {
    this.activePath = window.sessionStorage.getItem("activePath"); // 取出session里的访问路径  展示退出之前的路径子画面
  },
  methods: {
    logout() {
      window.sessionStorage.clear(); //清除用户的账户密码
      this.$store.state.user = {};
      this.$router.push("/login");
    },
    // 切换菜单折叠与展开
    toggleCollapase() {
      this.isCollapse = !this.isCollapse;
    },
    // 保存二级菜单的路径
    saveNavState: function (activePath) {
      // console.log(activePath)
      window.sessionStorage.setItem("activePath", activePath); // 存放点击的二级菜单的路径到session
      this.activePath = activePath; // 给点击的菜单添加高亮（展示）
    },
  },
};
</script>

<style lang="less" scoped>
//@import "../../assets/css/admin_global.css";       组件引用样式表不能继承body属性，找不到body属性
//less-loder  版本不要过高
.el-header {
  background-color: #373d41;
  display: flex;
  justify-content: space-between; // 左右贴边
  padding-left: 0%; // 左边界
  align-items: center; // 水平
  color: #fff;
  font-size: 20px;
  > div {
    //左侧div加布局
    display: flex;
    align-items: center;
    span {
      margin-left: 15px;
    }
    .logo_img {
      height: 60px;
    }
  }
}
.el-aside {
  background-color: #333744;
  .el-menu {
    border-right: none; // 对其右边框
  }
}
.el-main {
  background-color: #eaedf1;
}
.home-container {
  height: 100%;
}

.iconfont {
  margin-right: 10px;
}
.toggle-button {
  background-color: #4a5064;
  font-size: 10px;
  line-height: 24px;
  color: #fff;
  text-align: center;
  letter-spacing: 0.2em;
  cursor: pointer; // 显示鼠标指针为：小手
}
.el-menu-vertical-demo {
  overflow: hidden;
}
el-menu-item {
  height: 20px;
}
</style>