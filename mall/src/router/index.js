import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'


//弹出页面路由
const ShopDetail = () => import("views/Home/ShopDetail/ShopDetail")
const ranklist = () => import("components/content/ranklist/ranklist")
const firstinit = () => import("views/Home/firstinit/firstinit")


//管理员子路由
const Admin = () => import("views/Admin/Admin")
const HelloAdmin = () => import("views/Admin/HelloAdmin/HelloAdmin")
const ShowAll = () => import("views/Admin/ManageUser/ShowAll")
const userinfo = () => import("views/Admin/ManageUser/userinfo")
const ManageOrder = () => import("views/Admin/ManageOrder/ManageOrder")
const ManageGoods = () => import("views/Admin/ManageGoods/ManageGoods")
const AdminLog = () => import("views/Admin/AdminLog/AdminLog")
const error = () => import("views/Error/error")

//用户子路由
const Login = () => import("views/Home/LoginAndRgstr/Login") //使用别名的路由懒加载
const Home = () => import("views/Home/Home/Home")
const Userinfo = () => import("views/Home/Userinfo/Userinfo")
const ShowGoods = () => import("views/Home/ShowGoods/ShowGoods")
const UserWelcome = () => import("views/Home/UserWelcome/UserWelcome")
const Deposit = () => import("views/Home/Deposit /Deposit")
const all = () => import("views/Home/ShowGoods/all")
const detail = () => import("views/Home/Detail/detail")


const updateuserinfo = () => import("views/Home/UpdateUserinfo/updateuserinfo")
const ForgetPassword = () => import("views/Home/ForgetPassword/ForgetPassword")

Vue.use(VueRouter)

const routes = [{
    path: '/',
    redirect: '/firstinit'
  }, //自动重定向
  {
    path: '/firstinit', //地址栏访问错误
    component: firstinit,
    meta: {
      title: 'welcome~~'
    }
  },
  {
    path: '/home',
    component: Home,
    meta: {
      title: '小站欢迎大人的到来~',
      scrollToTop: true
    }, //用户系统  首页
    children: [ //以后子路由使用官方文档写法，不写/   可以使用父路由/子路由跳转
      {
        path: '',
        component: UserWelcome
      }, //  子路由默认页（在网址中输入其他子路由页面会被自动重定向）
      {
        path: '/userwelcome',
        component: UserWelcome,
        meta: {
          title: '小站欢迎大人的到来~',
          scrollToTop: true
        }
      }, //欢迎用户光临网站页  首页默认路径，默认子路由
      {
        path: '/userinfo',
        component: Userinfo,
        meta: {
          title: '您高贵的信息如下',
          scrollToTop: true
        }
      }, //用户个人账户
      {
        path: '/updateuserinfo',
        component: updateuserinfo,
        meta: {
          title: '小站全力为您效劳',
          scrollToTop: true
        }
      }, //用户个人信息
      {
        path: '/deposit',
        component: Deposit,
        meta: {
          title: '为店铺打call',
          scrollToTop: true
        }
      }, //充值
      {
        name: 'login',
        path: '/login',
        component: Login,
        meta: {
          title: '让我看看账号',
          scrollToTop: true
        }
      }, //登录
      {
        path: '/forgetpassword',
        component: ForgetPassword,
        meta: {
          title: '改改***改改',
          scrollToTop: true
        }
      }, //忘记密码
      {
        path: '/showgoods',
        component: ShowGoods,
        meta: {
          title: '商品在此',
          scrollToTop: true
        },
        children: [{
            path: '',
            component: all
          },
          {
            path: '/all',
            component: all,
            meta: {
              title: '所有商品为您献上',
              scrollToTop: true
            }
          },
          {
            path: '/spring',
            component: all,
            meta: {
              title: '春暖花开',
              scrollToTop: true
            }
          },
          {
            path: '/summer',
            component: all,
            meta: {
              title: '夏日炎炎',
              scrollToTop: true
            }
          },
          {
            path: '/autumn',
            component: all,
            meta: {
              title: '秋意微凉',
              scrollToTop: true
            }
          },
          {
            path: '/winter',
            component: all,
            meta: {
              title: '冬日暖心',
              scrollToTop: true
            }
          },
          {
            path: '/search',
            component: all,
            meta: {
              title: '小站全力为您效劳',
              scrollToTop: true
            }
          },
        ]
      }, //商品展示
    ]
  },
  {
    path: '/shopdetail',
    component: ShopDetail,
    meta: {
      title: 'YGMALL',
      scrollToTop: true
    }
  }, //店铺详情
  {
    name: "detail",
    path: '/detail/:id',
    component: detail,
    meta: {
      title: '献上全部细节',
      scrollToTop: true
    }
  }, //携带商品id跳转具体商品

  //  排行榜路由重定向
  {
    path: '/newarrive',
    component: ranklist,
    meta: {
      title: '最最最最新精品',
      scrollToTop: true
    }
  },
  {
    path: '/hot',
    component: ranklist,
    meta: {
      title: '无敌热卖',
      scrollToTop: true
    }
  },
  {
    path: '/sale',
    component: ranklist,
    meta: {
      title: '折扣之王',
      scrollToTop: true
    }
  },

  {
    path: '/admin', //管理员系统
    component: Admin,
    redirect: '/HelloAdmin', //子路由默认显示该页面
    meta: {
      title: 'salute admin ！',
      requireAuth: true
    },
    children: [{
        path: '',
        component: HelloAdmin,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      },
      {
        path: '/HelloAdmin',
        component: HelloAdmin,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      },
      {
        path: '/ShowAll',
        component: ShowAll,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      }, //账号信息
      {
        path: '/userself',
        component: userinfo,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      }, //用户信息
      {
        path: '/ManageOrder',
        component: ManageOrder,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      }, //订单管理
      {
        path: '/ManageGoods',
        component: ManageGoods,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      }, //商品管理
      {
        path: '/AdminLog',
        component: AdminLog,
        meta: {
          title: 'salute admin ！',
          requireAuth: true
        }
      }, //商品管理

    ],
  },

  {
    path: '/error', //地址栏访问错误
    component: error,
    meta: {
      title: '小站无辜555~'
    }
  },
]

const router = new VueRouter({
  routes,
  mode: 'history',
  //设置锚点链接跳转
  scrollBehavior(to, from, savedPosition) {

    //锚点跳转
    if (to.hash) {
      // 如果你的連結是帶 # 這種
      // to.hash 就會有值(值就是連結)
      // 例如 #3
      return {
        selector: to.hash
      }
    }

    //消除子路由的滚动条相互影响
    const position = {}
    if (to.matched.some(m => m.meta.scrollToTop)) {
      position.x = 0
      position.y = 0
    }
    return position
  }
})

//重复点击不报错   a标签加路由会被算作双次点击
const VueRouterPush = VueRouter.prototype.push

VueRouter.prototype.push = function push(to) {
  return VueRouterPush.call(this, to).catch(err => err)
}

//需要拦截管理员页面和付款页面需要拦截其余页面放行（用户系统的网址子路由跳转重定向到首页）
router.beforeEach((to, from, next) => {
  //路由中所有的ifelse判断都要在内部实现next，不要在默认路径上面放置next
  // 修改网页title
  if (to.matched[to.matched.length - 1].meta.title) {
    document.title = to.matched[to.matched.length - 1].meta.title
  } else {
    document.title = '小站欢迎大人的到来~'
  }

  // console.log(from.path)
  if (store.state.havebug) {
    store.state.user = {}
    store.state.goodslist = []
  }
  //身份验证拦截
  if (to.matched.some(res => res.meta.requireAuth)) { // 验证是否需要登陆
    if (sessionStorage.getItem('flag') == 'admin') { // 查询本地存储信息是否已经登陆
      next();
    } else {
      next({
        path: '/error', // 未登录则跳转至login页面
        // query: {redirect: to.fullPath}登陆成功后回到当前页面，这里传值给login页面，to.fullPath为当前点击的页面
      });
    }
  }

  //  网页商品数据不存在（刷新或者创建） ,请求goods数据
  if (store.state.goodslist.length == 0) {
    store.dispatch("setgoodslist")
      .then(res => {
        //有用户登录标记但是用户数据不存在
        if ((!!window.sessionStorage.getItem('username')) && (JSON.stringify(store.state.user) === '{}')) {
          store.dispatch("setuserinfo", window.sessionStorage.getItem('username'))
            .then(res => {
              return next(); //放行
            })
        } else {
          return next();
        } //放行
      })
  } else {
    //有用户登录标记但是用户数据不存在

    if ((!!window.sessionStorage.getItem('username')) && (JSON.stringify(store.state.user) === '{}')) {

      store.dispatch("setuserinfo", window.sessionStorage.getItem('username'))
        .then(res => {
          // console.log("网页刷新，用户数据请求成功")
          return next(); //放行
        })
    } else {
      return next();
    } //放行
  }

})


export default router