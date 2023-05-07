<template>

    <transition name = "zhezhao">
      <div class="zhezhaodiv" v-if="zhezhao" style="display: flex;align-items: center;justify-content:center;z-index: 999">
        <transition  name = "zzimg"  v-if="zzimgshow">
          <div style="text-align: center">
            <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/zz.gif">
            <div id="loading">
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
              <span></span>
            </div>
            <p>感谢您的关注，为您努力加载资源,即将跳转...</p>
          </div>
        </transition>
      </div>
    </transition>

</template>

<script>
export default {
  name: "zhezhao",
  data(){
    return{
      zhezhao:false,
      zzimgshow:true,
    }
  },
  props:{
    runtime: {
      type:Number,
      default(){
        return 4000           //默认运行4s
      }
    }
  },
  //要传的值     zz播放时长(6000ms)
  created() {
    let that = this     //不是用箭头函数的情况下，保存this指向
      this.zhezhao = true
      this.zz(that)
  },
  methods:{
    zz(that){//定时关闭遮罩动画
      setTimeout(function (){
        that.zzimgshow = false  //图片移动到位缓慢消失
        that.zhezhao = false
      },this.runtime)
    }
  }
}
</script>

<style scoped>
.zhezhaodiv{
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(241, 246, 209, 1);
}
.zhezhao-enter-active,
.zhezhao-leave-active{
  transition: all 3s;
}
.zhezhao-leave{
  opacity: 1;
  transform: translateX(0);
  transform: translateY(0);
}
.zhezhao-leave-to{
  opacity: 0;
  transform: translateX(100%);
  transform: translateY(-100%);
}
.zzimg-enter-active,
.zzimg-leave-active{
  transition: all .5s;
}
.zzimg-leave{
  opacity: 1;
  transform: translateY(0);
  transform: translateX(0);
}
.zzimgshow-leave-to{
  opacity: 0;
  transform: translateY(-100%);
  transform: translateX(100%);
}

#loading {
  width:200px;
  height:80px;
  margin: 10px auto;
}
#loading span {
  margin: 2px;
  height:80px;
  width:15px;
  background-color: rgba(255, 129, 152, 1);
  display:inline-block;
  animation:loader 1s infinite;
}
@keyframes loader{
  50% { height:30px; margin-top:50px; opacity:.5; }
}
#loading span:nth-child(1) {animation-delay:.1s;}
#loading span:nth-child(2) {animation-delay:.2s;}
#loading span:nth-child(3) {animation-delay:.3s;}
#loading span:nth-child(4) {animation-delay:.4s;}
#loading span:nth-child(5) {animation-delay:.5s;}
#loading span:nth-child(6) {animation-delay:.6s;}
</style>