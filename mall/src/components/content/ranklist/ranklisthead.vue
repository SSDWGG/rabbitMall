<template>
      <div class="hot_body">
        <div class="shell" v-for="(item,index) in rankheadlist" :key="item.goodsid" style=" cursor: pointer;">

          <div class="main-top" @click="detail(item.goodsid)">
            <h2>NO.{{index+1}}</h2>   <!--    销量排名x  -->
            <div class="ball">
              <img :src="item.imglist[0].goodsimg" alt="img load error~please enter F5">
            </div>
            <div class="line"></div>
            <span>榜首(NEW)爆款(HOT)折扣(SALE)</span>
          </div>
          <div class="main-bottom">
            <div class="title"> {{ item.goodstitle }}</div>
            <div class="describe">&nbsp; &nbsp; &nbsp; {{ item.goodsdescribe}}</div>
          </div>
        </div>
      </div>
</template>

<script>
export default {
  name: "Hot",
  props:{
    rankheadlist: {
      type:Array,
      default(){
        return []
      }
    }
  },
  methods:{
    detail(id){
      this.$router.push("/detail/"+id)      //动态拼接路由的id属性
    },
  }
}
</script>

<style  lang="less" scoped>
.hot_body{
  display: flex;
  width: 100vw;
  height: 100vh;
  justify-content: space-evenly;
  align-items: center;
  background-color: rgb(170, 190, 250);
}
.shell{
  /*盒子用固定大小*/
  /*排行榜3个商品 */
  width: 350px;
  height: 65vh;
  box-shadow: 0 5px 5px rgba(0, 0, 0, .2);
  overflow: hidden;
  margin:  10px;
}
.main-top{
  width: 100%;
  height: 100%;
  position: relative;
  background-color: #5f71e0;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  color: #fff;
  transition: .3s;

  .line{
    width: 8px;
    height: 100%;
    position: absolute;
    top: 0;
    transform: translate(-50%);
    background-color: rgba(255, 255, 255, .5);
  }
  .ball img{
    width: 180px;
    border-radius: 30%;
    box-shadow: 0 5px 5px rgba(0, 0, 0, .2);
    transition: .3s;
  }
  .ball{
    width: 220px;
    height: 220px;
    background-color: #5f71e0;
    border-radius: 30%;
    border: 8px solid rgba(255, 255, 255, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 99;
  }
   h2{
    transform: translate(-125px,-65px);
  }
   span{
    position: absolute;
    /*垂直排列*/
    writing-mode: tb-rl;
    font-size: .17rem;
    letter-spacing: .5px;
    transform: translate(150px,135px);
  }
}

.main-bottom{
  width: 100%;
  height: 200px;
  background-color: #fff;
  text-align: center;
  font-size: 1rem;
  color: #5f71e0;
  padding:.8rem;
  .title{
    height: 30%;
    text-overflow:ellipsis;   //超出显示省略号需要配合overflow使用
    overflow: hidden;
    padding: 0;
    font-size: 1.3rem;
    font-weight: 800;
  }
  .describe{
    height: 70%;
    display: block;
    padding:.5rem;
    text-overflow:ellipsis;   //超出显示省略号需要配合overflow使用
    overflow: hidden;
    padding: 0;
  }

}

.shell:hover .main-top{
  //空出content的值
  height: calc(65vh - 200px);
  span{
    transition: .5s;
    transform: translate(200px,135px);
  }
}
.shell:hover .ball img{
  transform: rotate(15deg) scale(1.2) translate(0px,-15px);
}



/*  */
.shell:nth-child(2) .main-top,
.shell:nth-child(2) .ball{
  background-color: #e98b1d;
}
.shell:nth-child(2) .main-bottom{
  color: #e98b1d;
}
/*  */
.shell:nth-child(3) .main-top,
.shell:nth-child(3) .ball{
  background-color: #72aea8;
}
.shell:nth-child(3) .main-bottom{
  color: #72aea8;
}
/*  */
.shell:nth-child(4) .main-top,
.shell:nth-child(4) .ball{
  background-color: #e98b1d;
}
.shell:nth-child(4) .main-bottom{
  color: #e98b1d;
}
/*  */
.shell:nth-child(5) .main-top,
.shell:nth-child(5) .ball{
  background-color: #72aea8;
}
.shell:nth-child(5) .main-bottom{
  color: #72aea8;
}
</style>