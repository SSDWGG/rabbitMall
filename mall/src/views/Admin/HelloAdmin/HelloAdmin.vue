<template>
  <div class="main">
    <p>Hello Admin: {{ $store.state.user.username}}  , Welcome~</p>
<!--    <button @click="testdxcc">test对象传参</button>-->
<!--    <button @click="testdxcc2">不使用对象传参</button>-->
  </div>

</template>

<script>
import  {test,test2} from "@/network/admin";
export default {
  name: "HelloAdmin",
  created() {
  },
  data(){
    return{
      user:{
        username:"我是u",
        password:"我是p",
        email:"我是e",
      },
    }
  },
  methods:{
    testdxcc(){
          test(this.user).then(res=>{
            console.log(res)
          })
    },
    testdxcc2(){
      test2(this.user.username).then(res=>{
        console.log(res)
      })
    },
  }
}
</script>

<style scoped>
.main{
  height: 100%;
  display: flex;
  height: 100%;
  align-items: center;
  justify-content: center;
  font-family: monospace;
  font-size: 4rem;
}
</style>