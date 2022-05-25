<template>
    <div class="all_body">

<!--      搜索界面显示（可以做成面包屑导航）-->
      <div v-show="serchtag">
        <div class="serachhead">
         全站商品的搜索结果如下:
        </div>
        <div class="nofind" v-show="nolist">
         we are sorry there is not find goods you want
        </div>
      </div>
<!--      商品列表-->
      <Card :goodslist="goodlist"></Card>
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
          /*font-family: monospace;*/
          }"
        >up</div>
      </el-backtop>
    </div>
</template>

<script>
import Card from "@/components/content/Card/Card";
import pubuliuCard from "components/content/pubuliuCard/pubuliuCard.vue"
import  {mapGetters} from "vuex";
export default {
  name: "all",
  computed:{
    ...mapGetters({
      allgoods:'goodslist',
      springgoods:'springgoodslist',
      categorygoodslist:'categorygoodslist',
      getgoodsbyserch:'getgoodsbyserch',
    })
  },
  components:{
    Card,
    pubuliuCard
  },
  data(){
    return{
      goodlist:[],
      serchtag:false,
      query:'',
      nolist:false,
    }
  },
  created() {
    //获取所有商品数据
    this.goodlist= this.allgoods
  },
  watch:{
    $route:{
      immediate:true,
      handler(newval,oldval){
       if(!!oldval){
         if(oldval.path=='/search'){
           //对搜索退出的路径使标记初始化
           this.goodlist=[]
           this.serchtag=false
           this.query=''
           this.nolist=false
         }
       }
        switch (newval.path) {
          case '/all':
            this.goodlist= this.allgoods
            ;break;
          case '/spring':
            this.goodlist= this.springgoods
            ;break;
          case '/summer':
            this.goodlist= this.categorygoodslist("summer")
            ;break;
          case '/autumn':
            this.goodlist= this.categorygoodslist("autumn")
            ;break;
          case '/winter':
            this.goodlist= this.categorygoodslist("winter")
            ;break;
          case '/search':
            this.serchtag=true
            //  拿到搜索参数
            this.query= newval.query.query
            //  从vuex搜索相似数据
            let querylist =  this.getgoodsbyserch(this.query)
            //结果非空可以输出
            if(querylist.length==0){
              this.nolist = true;
            }
            this.goodlist = querylist
            ;break;
        }

      }
    }
  }
}
</script>

<style lang="less" scoped>
.serachhead{
  display: flex;
  align-items: center;
  justify-content: left;
  //font-family: monospace;
  font-size: 1.2em;
  font-weight: 500;
  margin-top: 20px;
}
.nofind{
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  //font-family: monospace;
  font-size: 2.1rem;
  font-weight: 300;
  margin-top: 16rem;
}
</style>