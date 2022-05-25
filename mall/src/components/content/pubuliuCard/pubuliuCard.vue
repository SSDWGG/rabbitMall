<template>
  <div class="card-item">
    <div class="shell">
      <div class="item" v-for="(item,index) in this.carditem" :key="item.goodsid" style=" cursor: pointer;">
        <div @click="detail(item.goodsid)">
          <div class="image">
            <img v-lazy="item.imglist[0].goodsimg">
          </div>
          <div class="content">
            <p class="title">
              {{ item.goodstitle }}
            </p>
            <p class="describe">
              {{ item.goodsdescribe}}
            </p>
            <span class="price">{{ item.price }}</span>
<!--       销量     <span class="price">{{ item.price }}</span>-->
          </div>
        </div>
      </div >
    </div>

  </div>
</template>

<script>
export default {

  name: "Carditem",
  props:{
    carditem: {
      type:Array,
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

.shell {
  width: 100%;
  column-count:4;
  column-gap: 15px;
  padding: 10px;
  box-shadow: 10px 10px 5px rgba(12, 12, 12, .1);
}


.item{
  -webkit-column-break-inside: avoid;   //阻止元素被分页
  width: 100%;
  border: .5px solid rgba(12, 12, 12, .1) ;
  box-shadow:  7px 0px 2px rgba(12, 12, 12, .1);
  border-radius: 5px;
  margin: 5px;

}
.image{
  border-radius: 5px;
  width: 100%;
  padding: 10%;
  padding-bottom: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
.image img {
  width: 100%;
  border-radius: 5px;
  vertical-align: top;        //去除图片自带垂直边距

}
.content{
  height: 70px;
  padding: 0 10% ;
  font-size:15px;
  overflow: hidden;
  text-align: center;
  p{
    text-overflow:ellipsis;   //超出显示省略号需要配合overflow使用
    overflow: hidden;
    white-space: normal;
    margin-bottom: 3px;
  }
  .title{
    text-overflow:ellipsis;   //超出显示省略号需要配合overflow使用
    overflow: hidden;
    white-space: nowrap;
     font-weight: 1000;
     font-size: 1.1rem;
  }
  .describe{
    display: -webkit-box;         //超出2行后显示省略号
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    font-size: .7rem;
  }
  .sellcount{
    color: #81ffe8;
    font-size: .7rem;
  }
  .price{
    color: #81b3ff;
    margin-right: .7rem;
  }
}
//
//@media (max-width:2000px) {
//  .shell {
//    column-count: 5;
//  }
//}
//
//@media (max-width:1200px) {
//  .shell {
//    column-count: 4;
//  }
//}
//
//@media (max-width:850px) {
//  .shell {
//    column-count: 3;
//  }
//}
//
//@media (max-width:600px) {
//  .shell {
//    column-count: 2;
//  }
//}
</style>