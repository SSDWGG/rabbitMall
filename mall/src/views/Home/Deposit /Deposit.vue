<template>
  <div class="bd">
    <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/cats.svg" class="bg-img" alt="">
    <div class="sessionquit" @click="logout"
         style=" cursor: pointer;z-index: 2;position: absolute;top: 5%;font-size: 1.6rem;font-weight: 500">quit</div>

    <div class="card-group">
      <div class="card">
        <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/rabbitlogo.png" alt="logo" style="width: 80px">
         <p style="font-size: 1.3rem;font-weight: 700;color: #ff8198;margin: .3rem">感恩回馈，超级加赠</p>
        <p>充值200额外加赠20！</p>
        <p>充值500额外加赠70！</p>
        <p>充值1000额外加赠180！</p>
        <p>充值5000额外加赠1000！</p>
        <p>还在等啥，来晚了就没啦~</p>
      </div>
      <div class="card">
        <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/rabbitlogo.png" alt="logo" style="width: 80px">
        <p style="font-size: 1.2rem;font-weight: 700;color: #ff8198;margin: .3rem">加入俱乐部，享福利购</p>
        <p>会员身份，解锁多重权益</p>
        <p>入群享天天折扣福利</p>
        <p>限时至高可加赠1000元</p>
        <p>您还在观望？</p>
        <p>快来加入我们的会员体系~</p>
      </div>
      <div class="card" style="line-height: 3rem">
        <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/rabbitlogo.png" alt="logo" style="width: 80px">
        <p style="font-size: 1.9rem;font-weight: 700;color: #ff8198;margin: 0 auto;">冲鸭！！！</p>
        <p style="font-size: 1.9rem;font-weight: 700;color: #ff8198;margin: 0 auto;">买光这家！</p>
        <input type="text"  v-model="number" placeholder="输入充值金额" >
        <div class="sessionquit" @click="deposit(number)" style=" cursor: pointer;margin: 10% auto;">点我入会</div>
      </div>
    </div>
    <el-drawer
        title="充值成功~请查收~"
        :visible.sync="drawer"
        size="50%">
      <div>
        <el-button @click="innerDrawer = true">支持小站作者❤️</el-button>
        <el-drawer
            title="您的每一次支持都能让小站发展的更好~"
            :append-to-body="true"
            :before-close="handleClose"
            :visible.sync="innerDrawer">
          <p>欢迎学习交流，点赞和关注我的<a style="color: #72aea8;font-size: 1.5rem" @click="newwindow( 'https://github.com/SSDWGG')">GitHub</a>，感激不尽！</p>
          <p>原创网站,功能不定期更新,可以催更</p>
          <p>_(:зゝ∠)_添加wechat，作者期待聆听您的建议</p>
          <img src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/addwechat.jpeg" style="width: 200px">
          <p>_(:зゝ∠)_土豪请随意thanks</p>
          <img  src="http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/alipay.jpeg" style="width: 200px">
        </el-drawer>
      </div>
    </el-drawer>
  </div>
</template>

<script>

export default {
  name: "Deposit",
  data(){
    return{
      drawer: false,
      innerDrawer: false,
      number:'',

    }
  },
  methods:{
    deposit(number){
      if(!number){
        this.$message.warning('需要输入按钮上方的充值金额哦~');
      }else {
        if(!this.$store.state.user.id){
          this.$confirm("您没有登录哦，请先登录，再选购呦")
        }
        else{
          console.log("111111")
          this.drawer = true
        }
      }
    },
    handleClose(done) {
      this.$confirm('小站作者感激涕零的给你点了个大大的赞~thanks❤️')
          .then(_ => {
            this.$confirm("感谢again~")
            done();
          })
          .catch(_ => {});
    },
    newwindow(path){
      window.open(path, '_blank');
    },
    logout() {
      this.$router.go(-1)
    },
  }
}
</script>

<style lang="less" scoped>
.bd {
  position: relative;
  margin: 0;
  min-height: 100vh;
  background-color: #e493d0;
  background-image:
      radial-gradient(closest-side, rgba(235, 105, 78, 1), rgba(235, 105, 78, 0)),
      radial-gradient(closest-side, rgba(243, 11, 164, 1), rgba(243, 11, 164, 0)),
      radial-gradient(closest-side, rgba(254, 234, 131, 1), rgba(254, 234, 131, 0)),
      radial-gradient(closest-side, rgba(170, 142, 245, 1), rgba(170, 142, 245, 0)),
      radial-gradient(closest-side, rgba(248, 192, 147, 1), rgba(248, 192, 147, 0));
  background-size:
      130vmax 130vmax,
      80vmax 80vmax,
      90vmax 90vmax,
      110vmax 110vmax,
      90vmax 90vmax;
  background-position:
      -80vmax -80vmax,
      60vmax -30vmax,
      10vmax 10vmax,
      -30vmax -10vmax,
      50vmax 50vmax;
  background-repeat: no-repeat;
  animation: 10s movement linear infinite;
}
.bd::after {
  content: '';
  display: block;
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
}
@keyframes movement {
  0%, 100% {
    background-size:
        130vmax 130vmax,
        80vmax 80vmax,
        90vmax 90vmax,
        110vmax 110vmax,
        90vmax 90vmax;
    background-position:
        -80vmax -80vmax,
        60vmax -30vmax,
        10vmax 10vmax,
        -30vmax -10vmax,
        50vmax 50vmax;
  }
  25% {
    background-size:
        100vmax 100vmax,
        90vmax 90vmax,
        100vmax 100vmax,
        90vmax 90vmax,
        60vmax 60vmax;
    background-position:
        -60vmax -90vmax,
        50vmax -40vmax,
        0vmax -20vmax,
        -40vmax -20vmax,
        40vmax 60vmax;
  }
  50% {
    background-size:
        80vmax 80vmax,
        110vmax 110vmax,
        80vmax 80vmax,
        60vmax 60vmax,
        80vmax 80vmax;
    background-position:
        -50vmax -70vmax,
        40vmax -30vmax,
        10vmax 0vmax,
        20vmax 10vmax,
        30vmax 70vmax;
  }
  75% {
    background-size:
        90vmax 90vmax,
        90vmax 90vmax,
        100vmax 100vmax,
        90vmax 90vmax,
        70vmax 70vmax;
    background-position:
        -50vmax -40vmax,
        50vmax -30vmax,
        20vmax 0vmax,
        -10vmax 10vmax,
        40vmax 60vmax;
  }
}
.bg-img {
  position: absolute;
  top: 30%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
}
.card-group {
  position: absolute;
  top: 30%;
  z-index: 3;
  width: 100%;
  height: 80%;
  overflow: hidden;
  display: flex;
  gap: 1rem;
  margin: 1rem;

}
.card {
  width: 314px;
  height: 412px;
  color: #FFF;
  padding: 20px;
  line-height: 2em;
  letter-spacing: 2px;
  background-color: rgba(196, 196, 196, 0.3);
  border-top: 1px solid rgba(255, 255, 255, 0.5);
  border-left: 1px solid rgba(255, 255, 255, 0.5);
  box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.15);
  border-radius: 12px;
  backdrop-filter: blur(5px);
  box-sizing: border-box;
    input{
      background-color: rgba(255, 255, 255, 0);
      border-radius: 30px;
      border: 0px;
      outline: none;
      padding-left: 20%;
    }
}
.card p {
  // text-indent: 2em;
  display: flex;
  align-items: center;
  justify-content: center;
  white-space:nowrap
}
@media screen and (max-width: 768px) {
  .bg-img {
    position: fixed;
    top: 0px;
    left: auto;
    right: 0px;
    transform: rotate(-145deg) translateY(100%);
  }
  .card-group {
    flex-direction: column;
    overflow-y: auto;
    height: auto;
    padding-top: 50px;
    padding-bottom: 50px;
  }
  .card {
    box-shadow: 0px 2px 30px rgba(0, 0, 0, 0.1);
  }
}
.sessionquit{
  width: 100px;
  height: 50px;
  border-radius: 50px;
  border: .5px solid rgba(12, 12, 12, .1) ;
  box-shadow:  7px 0px 2px rgba(12, 12, 12, .1);
  display: flex;
  align-self: center;
  justify-content: center;
  line-height: 50px;
  font-size: 1rem;
  font-weight: 300;
}
.sessionquit:hover{
  border: .1px solid #8c8c8c;
}
/deep/ .el-drawer{
  width: 30% !important;
  font-size: 2rem;
  background-color: rgba(241, 246, 209, .9);
}
</style>