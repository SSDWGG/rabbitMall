<template>
  <div class="uw_bg">
    <el-container>
      <el-header class="head" id="top">
        <div class="shopmanage">
          <img :src="require('assets/img/userwelcome/shopmange.jpeg')" />
        </div>
        <div class="nav">
          <ul>
            <li>
              <a href="#newarrive">{{ $t("common.newarrivals") }}</a>
            </li>
            <li>
              <a href="#hot">{{ $t("common.hot") }}</a>
            </li>
            <li>
              <a href="#sale">{{ $t("common.sale") }}</a>
            </li>
          </ul>
        </div>
      </el-header>
      <div class="linemax"></div>
      <el-main class="userwelcome_body">
        <!--海报-->
        <div class="img1">
          <img :src="require('assets/img/userwelcome/userwelcome1.jpg')" />
        </div>

        <!-- 上新货物-->
        <div class="newarrive" id="newarrive">
          <div class="navitemchild">
            <a>{{ $t("common.newarrivals") }}</a>
          </div>
          <div>
            <goods :goodslist="newarrivegoods"></goods>
          </div>
          <div style="width: 100%" @click="seeranklist('/newarrive')">
            <viewmore></viewmore>
          </div>
          <div class="line"></div>
        </div>

        <!--热卖衣物-->
        <div class="hot" id="hot">
          <div class="navitemchild">
            <a>{{ $t("common.hot") }}</a>
          </div>

          <div>
            <goods :goodslist="hot"></goods>
          </div>

          <div style="width: 100%" @click="seeranklist('/hot')">
            <viewmore></viewmore>
          </div>
          <div class="line"></div>
        </div>

        <!--折扣衣物-->
        <div class="sale" id="sale">
          <div class="navitemchild">
            <a>{{ $t("common.sale") }}</a>
          </div>
          <div>
            <goods :goodslist="sale"></goods>
          </div>
          <div class="viewmorediv" @click="seeranklist('/sale')">
            <viewmore></viewmore>
          </div>
          <div class="line"></div>
        </div>

        <!--店铺规则介绍-->
        <div class="shoprule">
          <img :src="require('assets/img/userwelcome/shoprule.jpg')" />
        </div>

        <!--回到顶部  -->
        <div class="backtop">
          <a class="backtopbtn" href="#top" style="cursor: pointer"></a>
          <img :src="require('assets/img/userwelcome/backtop.jpg')" />
        </div>
      </el-main>
      <el-backtop
        :bottom="100"
        :right="30"
        style="
          background-color: transparent;
          width: 7vw;
          height: 7vw;
          box-shadow: 0 0 2px rgba(0, 0, 0, 0.42);
        "
      >
        <div
          style="
            border-radius: 50%;
            text-align: center;
            line-height: 4vw;
            color: rgba(255, 129, 152, 0.8);
            font-size: 4vw;
            font-family: monospace;
          "
        >
          up
        </div>
      </el-backtop>
    </el-container>
  </div>
</template>

<script>
import goods from "@/components/content/goods/goods";
import viewmore from "@/components/common/viewmore";
import eventBus from "@/common/eventBus";
import { mapGetters } from "vuex";
export default {
  name: "UserWelcome",
  computed: {
    ...mapGetters({
      hotlist: "hotlist",
      salelist: "salelist",
      newlist: "newlist",
    }),
  },
  components: {
    goods,
    viewmore,
  },
  created() {
    //每个排行榜只显示前5个信息
    this.hot = this.hotlist.slice(0, 5);
    this.sale = this.salelist.slice(0, 5);
    this.newarrivegoods = this.newlist.slice(0, 5);
  },
  data() {
    return {
      newarrivegoods: [],
      hot: [],
      sale: [],
    };
  },
  methods: {
    seeranklist(path) {
      //使用时间总线bus的坑点：1  emit必须写在destoryed和他的钩子函数中    2on接收必须写在create和他的钩子中，因为生命周期的问题
      //bus的on接收端需要在destory里面销毁，否则数据会被累加
      //所以这里我不使用   解析路径然后分别发送每一个排行榜的数据   而是在destroyed中发送全部排行榜的数据，然后再接收端按需获取
      this.$router.push(path);
    },
  },
  // destroyed() {
  //   //这里的list都是getter中排序完毕的数据
  //   eventBus.$emit('newlist',this.newlist);
  //   eventBus.$emit('hotlist',this.hotlist);
  //    eventBus.$emit('salelist',this.salelist);
  // }
};
</script>

<style lang="less" scoped>
.uw_bg {
  background-color: #ffffff;
  border-left: 1px solid rgba(241, 246, 209, 0.5);
}
.head {
  height: auto !important;
  .nav {
    width: 100%;
    margin: 50px 0;
    ul {
      width: 100%;
      list-style: none;
      display: flex;
      align-self: center;
      justify-content: space-around;
      li {
        font-size: 2.6vw;
        font-family: monospace;
        a:hover {
          color: #ff8198;
        }
      }
    }
  }
}

.userwelcome_body {
  padding: 0;
}
.line {
  border: 0.5px solid #ddd;
  width: 94%;
  margin: 20px auto;
}
.linemax {
  border: 1px solid rgba(221, 221, 221, 1);
  width: 100%;
  margin: 20px auto;
}
img {
  width: 100%;
  vertical-align: bottom;
}
.navitemchild {
  width: 100%;
  height: 9vw;
  display: flex;
  align-self: center;
  justify-content: center;
  a {
    // line-height: 7rem;
    font-size: 9vw;
    font-family: "Academy Engraved LET";
    margin-top: 1rem;
  }
}

.backtop {
  position: relative;
  width: 100%;
  .backtopbtn {
    position: absolute;
    top: 12%;
    left: 38%;
    width: 230px;
    height: 100px;
  }
}
.shopmanage {
  width: 100%;
  margin-top: 10px;
}
.img1 {
  width: 100%;
}
.shoprule {
  width: 100%;
}
.newarrive {
  width: 100%;
}

.viewmorediv {
  width: 100%;
  height: 100px;
  display: flex;
  align-self: center;
  justify-content: center;
}
</style>