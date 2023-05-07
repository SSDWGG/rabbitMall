import Vue from 'vue'
import App from './App.vue'
//安装使用element
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);
//引入vuex     （页面刷新vuex数据消失，window.session不消失）
import store from "./store";
//引入less
import less from 'less'
Vue.use(less)
//图片懒加载插件
import VueLazyLoad from 'vue-lazyload'
Vue.use(VueLazyLoad, {
  error: "http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/lazy_errorimg.png",
  loading: "http://panshi-on.oss-cn-hangzhou.aliyuncs.com/yunxiaoding-mini/other/mall/img/chunse.png",
})
//动画库
import animated from 'animate.css'
Vue.use(animated)
//国际化
import i18n from './i18n/index'
//引入route
import router from "./router"


Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
  store,
  i18n
}).$mount('#app')