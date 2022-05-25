<template>
  <div class="goodsitem" @click="detail(goodsItem.goodsid)">
    <div class="image">
      <img v-lazy="goodsItem.imglist[0].goodsimg" />
    </div>
    <div class="content" style="padding: 14px">
      <p class="title">
        {{ goodsItem.goodstitle }}
      </p>
      <p class="describe">
        {{ goodsItem.goodsdescribe }}
      </p>
      <span class="price">￥{{ goodsItem.nowprice }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "goodsitem",
  props: {
    goodsItem: {
      type: Object,
      default() {
        return {};
      },
    },
  },
  methods: {
    detail(id) {
      // console.log(this.goodsItem)
      this.$router.push("/detail/" + id); //动态拼接路由的id属性
    },
  },
};
</script>

<style lang="less" scoped>
.goodsitem {
  margin: 2%;
  width: 28%;
  border-radius: 15px;
  border: 0.5px solid rgba(12, 12, 12, 0.1);
  box-shadow: 7px 0px 2px rgba(12, 12, 12, 0.1);
  overflow: hidden;

  //padding: 10%;

  .image {
    width: 100%;
    padding: 2px;
    img {
      width: 100%;
      border-radius: 15px;
    }
  }
  .content {
    //height: 70px;
    padding: 0 10%;
    font-size: 15px;
    overflow: hidden;
    text-align: center;
    p {
      text-overflow: ellipsis; //超出显示省略号需要配合overflow使用
      overflow: hidden;
      white-space: normal;
      margin-bottom: 3px;
    }
    .title {
      text-overflow: ellipsis; //超出显示省略号需要配合overflow使用
      overflow: hidden;
      white-space: nowrap;
      font-weight: 900;
      font-size: 2vw;
    }
    .describe {
      display: -webkit-box; //超出2行后显示省略号
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 2;
      font-size: 1.6vw;
    }
    .price {
      color: #81b3ff;
      font-size: 2.5vw;
    }
  }
}
</style>