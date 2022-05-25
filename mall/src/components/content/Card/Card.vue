<template>
  <div class="goodslist">
    <goodsitem v-for="(item,index) in goodslist" :key="index" :goods-item="item">
    </goodsitem>
  </div>
</template>

<script>
import goodsitem from "@/components/content/goods/goodsitem";

export default {
  name: "Card",
  components:{
    goodsitem,
  },
  props:{
    goodslist: {
      type:Array,
      default(){
        return []
      }
    }
  },
}
</script>

<style scoped>
.goodslist{
  width: 100%;
  display: flex;
  flex-wrap: wrap;
}
</style>