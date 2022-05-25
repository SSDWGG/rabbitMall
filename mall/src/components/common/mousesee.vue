<template>
  <div class="mouseseebd">
    <div class="ms"></div>
  </div>
</template>

<script>
export default {

  mounted() {
    //参数是默认事件
    document.addEventListener('mousemove',e => {
      const ms = document.querySelectorAll(".ms")

      const mouseX = e.clientX
      const mouseY = e.clientY

      ms.forEach(sqr => {
        const sqrX = sqr.offsetLeft
        const sqrY = sqr.offsetTop

        const diffX = mouseX -sqrX
        const diffY = mouseY -sqrY

        const radians = Math.atan2(diffY,diffX)

        const angle = radians * 180 / Math.PI

        sqr.style.transform = `rotate(${angle}deg)`
      })
    })
  },

}
</script>
<!--
打包上线出现bug   透明不显示，本地运行无bug
-->

<style scoped>
/*盒子本体*/
/*.mouseseebd{*/
/*  !*opacity:1!important;*!*/
/*  !*z-index: 99;*!*/
/*}*/
.ms{
  width: 40px;
  height: 40px;
  background-color: rgb(40, 40, 40);
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, .5);
  border-left: solid 10px #fff;
  /*默认位置   写了默认位置就无法用部分子组件样式的写法修改？？*/
  /*position: fixed;*/
  /*bottom: 5vh;*/
  /*right: 5vw;*/
}
.ms::after,.ms::before{
  /*眼睛*/
  content: '';
  width: 6px; /*大小*/
  height: 6px;
  display: block;
  position: absolute;
  border-radius: 50%;
  left: 18px;
  background-color: #fff;
}
.ms::after{
  top: 11px;
}
.ms::before{
  bottom: 11px;
}
</style>