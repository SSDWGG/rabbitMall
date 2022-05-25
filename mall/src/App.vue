<template>
  <div id="app">
    <div class="smallwidth">
      <div class="bg">
        <div class="tip">
          <p>该项目暂未适应小屏设备</p>
          <p>为了您的良好浏览体验</p>
          <p>您可以使用更大的屏幕或者设备</p>
          <p>感谢理解关注😉</p>
          <p>Thanks❤️</p>
        </div>
      </div>
    </div>
    <router-view class="mark"></router-view>
  </div>
</template>
<script>
export default {
  name: "App",
  created() {
    //浏览器警告
    console.log(
      "%c安全警告！！",
      " text-shadow: 0 1px 0 #ccc,0 2px 0 #c9c9c9,0 3px 0 #bbb,0 4px 0 #b9b9b9,0 5px 0 #aaa,0 6px 1px rgba(0,0,0,.1),0 0 5px rgba(0,0,0,.1),0 1px 3px rgba(0,0,0,.3),0 3px 5px rgba(0,0,0,.2),0 5px 10px rgba(0,0,0,.25),0 10px 10px rgba(0,0,0,.2),0 20px 20px rgba(0,0,0,.15);font-size:5em;color:red;"
    );
    console.log(
      "%c此浏览器功能专供开发者使用。请不要在此粘贴执行任何内容，这可能会导致您的账户受到攻击，给您带来损失 ！",
      "font-size:2em;color:blue;"
    );
  },
};
</script>
<!--不要在全局中加一些东西，首先考虑mixin添加-->
<!--  全局样式可以影响所有的组件-->
<style>
@import "assets/css/base.css";
.mask::-webkit-scrollbar {
  width: 0;
}
@font-face {
  font-family: "UbuntuMono-Bold";
  src: url("assets/font/Ubuntu_Mono/UbuntuMono-Bold.ttf");
}
@media screen and (max-width: 865px) {
  .smallwidth {
    width: 100%;
    height: 100%;
    background-color: rgba(241, 246, 209, 1);
    position: fixed;
    top: 0;
    left: 0;
    z-index: 99999;
    letter-spacing: 2px;
  }
  .tip {
    position: fixed;
    top: 50%;
    left: 50%;
    text-align: center;
    z-index: 99;
    transform: translate(-50%, -50%);
  }

  /* 背景 */
  @import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");

  /* :root {
  font-size: 15px;    在程序入口进行改写rem适配
} */

  .bg {
    font-family: "Quicksand", sans-serif;
    margin: 0;
    min-height: 100vh;
    background-color: #e493d0;
    background-image: radial-gradient(
        closest-side,
        rgba(235, 105, 78, 1),
        rgba(235, 105, 78, 0)
      ),
      radial-gradient(
        closest-side,
        rgba(243, 11, 164, 1),
        rgba(243, 11, 164, 0)
      ),
      radial-gradient(
        closest-side,
        rgba(254, 234, 131, 1),
        rgba(254, 234, 131, 0)
      ),
      radial-gradient(
        closest-side,
        rgba(170, 142, 245, 1),
        rgba(170, 142, 245, 0)
      ),
      radial-gradient(
        closest-side,
        rgba(248, 192, 147, 1),
        rgba(248, 192, 147, 0)
      );
    background-size: 130vmax 130vmax, 80vmax 80vmax, 90vmax 90vmax,
      110vmax 110vmax, 90vmax 90vmax;
    background-position: -80vmax -80vmax, 60vmax -30vmax, 10vmax 10vmax,
      -30vmax -10vmax, 50vmax 50vmax;
    background-repeat: no-repeat;
    animation: 10s movement linear infinite;
  }

  .bg::after {
    content: "";
    display: block;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
  }

  span {
    position: relative;
    z-index: 10;
    display: flex;
    min-height: 100vh;
    width: 100%;
    justify-content: center;
    align-items: center;
    font-size: 5rem;
    color: transparent;
    text-shadow: 0px 0px 1px rgba(255, 255, 255, 0.6),
      0px 4px 4px rgba(0, 0, 0, 0.05);
    letter-spacing: 0.2rem;
  }

  @keyframes movement {
    0%,
    100% {
      background-size: 130vmax 130vmax, 80vmax 80vmax, 90vmax 90vmax,
        110vmax 110vmax, 90vmax 90vmax;
      background-position: -80vmax -80vmax, 60vmax -30vmax, 10vmax 10vmax,
        -30vmax -10vmax, 50vmax 50vmax;
    }
    25% {
      background-size: 100vmax 100vmax, 90vmax 90vmax, 100vmax 100vmax,
        90vmax 90vmax, 60vmax 60vmax;
      background-position: -60vmax -90vmax, 50vmax -40vmax, 0vmax -20vmax,
        -40vmax -20vmax, 40vmax 60vmax;
    }
    50% {
      background-size: 80vmax 80vmax, 110vmax 110vmax, 80vmax 80vmax,
        60vmax 60vmax, 80vmax 80vmax;
      background-position: -50vmax -70vmax, 40vmax -30vmax, 10vmax 0vmax,
        20vmax 10vmax, 30vmax 70vmax;
    }
    75% {
      background-size: 90vmax 90vmax, 90vmax 90vmax, 100vmax 100vmax,
        90vmax 90vmax, 70vmax 70vmax;
      background-position: -50vmax -40vmax, 50vmax -30vmax, 20vmax 0vmax,
        -10vmax 10vmax, 40vmax 60vmax;
    }
  }
}
@media screen and (min-width: 865px) {
  .smallwidth {
    display: none;
  }
}
</style>
