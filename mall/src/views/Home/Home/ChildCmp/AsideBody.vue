<template>
    <div class="asidebody">
      <div class="nav-warpper">
        <a v-for="(item,index) in titles"
        :key= "index" :class="isActive(index) ? 'activeClass' : '' ">
          <span @click="goto(index)">
            {{item}}
          </span>
        </a>
      </div>
    </div>
</template>

<script>
export default {
  name: "AsideBody",
  data() {
    return {   //会有默认选中
    }
  },
  created() {
    //每次刷新会被执行该方法
    let i = window.sessionStorage.getItem("titleindex")
    if(i!=null) this.goto(i)
  },
  mounted() {},
  computed: {}, //计算属性中的表达式只会被计算一次，将结果缓存，所以不能使用变量计算    和v-show和v-if的效果差不多区别
  props:{
    titles:{
      type:Array,
      default(){            //显示的二级目录名字
        return []
      }
    },
    titlesrouter:Array,
    default(){            //二级目录跳转路径
      return []
    }
  },
  methods:{
    goto(titleindex){
      //放在了单击事件里   所以这个参数是  当前点击的那一个的index
      //根据titleindex转换成rouer的index
      let routerindex = titleindex;
      let path = this.titlesrouter[routerindex];
      if(path=="null"||path==null||path==" "){
        return;
      }else {
        window.sessionStorage.setItem("titleindex",titleindex)       //上传当前被点击的路由index（title转换前）
        this.$router.push(path)
      }
    },
    isActive(index){
        //每一次点击都会完全遍历       思路：当前的路径和路径数据对比，取出一样的路径index   路径index转换成title的index加上活跃样式
      // console.log(index)        每点击一次 参数回依次传递（全部index，该函数会被执行inde.length次）     1   2   3  4
      function getArrayIndex(arr, obj) {
        var i = arr.length;
        while (i--) {
          if (arr[i] === obj) {
            return i;
          }
        }
        return -1;
      }       //找到相同字符串返回索引，否则返回-1
      let path = this.$route.path.substring(1)
      let i = getArrayIndex(this.titlesrouter,path)
      return i==index?true:false

    }
  }

}
</script>

<style  lang="less" scoped>
.asidebody{
  //普通选项
  a{
    display: block;
    font-size: 1.8vw;
    font-weight: 300;
    line-height: 200%;
    letter-spacing: .5px;
    text-transform: uppercase;
    text-decoration: none;
    white-space: nowrap;
  }
  //标题元素
  a:nth-child(1){
    color: #000;
    line-height: 300%;
    font-weight: 700;
    font-size: 2.2vw;
  }
  //  被选中元素     要改 颜色，下划线

  }
  //使文字区到合适位置
  .nav-warpper{
   padding: 0px 0px 20px 30px;
  }

  //被选中的a样式
  .activeClass span{
    border-bottom: 2px solid rgba(85, 165, 50, 0.8);

  }
</style>