<template>
  <div class="bg">
    <div class="tip">
      <span>just do it</span>
      <router-link :to="{ path: '/home' }">
        <div class="viewmore" style="cursor: pointer">
          <p>Begin</p>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
};
</script>

<style scoped>
.tip {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  z-index: 999;
}
/* 背景 */
@import url("https://fonts.googleapis.com/css2?family=Quicksand&display=swap");
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
    radial-gradient(closest-side, rgba(243, 11, 164, 1), rgba(243, 11, 164, 0)),
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
  font-size: 6rem;
  color: transparent;
  text-shadow: 0px 0px 1px rgba(255, 255, 255, 0.6),
    0px 4px 4px rgba(0, 0, 0, 0.05);
  letter-spacing: 0.1rem;
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
/* viewmore */
.viewmore {
  width: 14vw;
  height: 5vw;
  border-radius: 5vw;
  border: 0.5px solid rgba(12, 12, 12, 0.1);
  /*border: .1px solid #8c8c8c;*/
  box-shadow: 7px 0px 2px rgba(12, 12, 12, 0.1);
  display: flex;
  align-self: center;
  justify-content: center;
  margin: 3rem auto;
}
p {
  line-height: 5vw;
  font-size: 3.5vw;
  font-weight: 500;
  font-family: monospace;
}
.viewmore:hover {
  border: 0.1px solid #8c8c8c;
}
</style>