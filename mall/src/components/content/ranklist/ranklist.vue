<template>
  <div class="bg">
    <ranklisthead :rankheadlist="rankheadlist" ></ranklisthead>
<!--    all ranklist data-->
    <el-container>
      <el-header>
        <el-page-header @back="goBack" content="RankList" title="Go Back"></el-page-header>
      </el-header>

      <el-main>
        <pubuliu-card :carditem="ranklist"></pubuliu-card>
      </el-main>

      <el-backtop :bottom="60" :right="60" style="background-color: transparent;width: 5rem;height: 5rem; box-shadow: 0 0 2px rgba(0,0,0,.42);">
        <div
            style="{
          /*height: 50%;*/
          /*width: 50%;*/
          border-radius: 50%;
          text-align: center;
          line-height: 5rem;
          color: rgba(255,129,152,0.8);
          font-size: 3rem;
          font-family: monospace;
          }"
        >up</div>
      </el-backtop>

    </el-container>
    <zhezhao :runtime=600></zhezhao>
  </div>
</template>

<script>
import ranklisthead from "@/components/content/ranklist/ranklisthead";
import eventBus from "@/common/eventBus";
import pubuliuCard from "components/content/pubuliuCard/pubuliuCard.vue"
import zhezhao from "@/components/common/zhezhao";
import  {mapGetters} from "vuex";
export default {
  name: "ranklist",
  components:{
    ranklisthead,
    pubuliuCard,
    zhezhao
  },
  computed:{
    ...mapGetters({
      hotlist:'hotlist',
      salelist:'salelist',
      newlist:'newlist',
    })
  },
  data(){
    return{
      ranklist:[],
      rankheadlist:[],//取前三条
    }
  },
  created() {
    // switch (this.$route.path) {
    //   case '/newarrive' :
    //     eventBus.$on('newlist',(data)=>{
    //        console.log(data)
    //       // console.log("bus on开启")
    //       this.ranklist = data
    //       this.rankheadlist = data.slice(0,3)
    //     }) ;
    //     break;
    //   case '/hot' :
    //     eventBus.$on('hotlist',(data)=>{
    //       console.log(data)
    //       // console.log("bus on开启")
    //       this.ranklist = data
    //       this.rankheadlist = data.slice(0,3)
    //     });
    //     break;
    //   case '/sale' :
    //     eventBus.$on('salelist',(data)=>{
    //       console.log(data)
    //       // console.log("bus on开启")
    //       this.ranklist = data
    //       this.rankheadlist = data.slice(0,3)
    //     });
    //     break;
    // }
    // console.log("bus on会被滞后后执行")
    switch (this.$route.path) {
      case '/newarrive' :
          this.ranklist = this.newlist
          this.rankheadlist = this.ranklist.slice(0,3)
         ;
        break;
      case '/hot' :
        this.ranklist = this.hotlist
        this.rankheadlist = this.ranklist.slice(0,3)
        ;
        break;
      case '/sale' :
        this.ranklist = this.salelist
        this.rankheadlist = this.ranklist.slice(0,3)
        ;
        break;
    }

  },
  methods: {
    goBack() {
      this.$router.go(-1);
    }
  }
  // destroyed() {
  //   eventBus.$off()
  // }


}
</script>

<style lang="less" scoped>
.bg{
  /*background-color: rgb(170, 190, 250);*/
  background-color: rgba(241, 246, 209, 0.5);
}
.el-header{
  height: 40px !important;
  .el-page-header{
    margin: 15px;
    //font-family: monospace;
  }
}
.el-main{
  padding: 5px 10px;
}
</style>