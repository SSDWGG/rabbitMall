import {deepCopyAdvanced, mohuquerylistobj} from "@/common/utils";

export default{
  //总货物
  goodslist: state => state.goodslist,

  springgoodslist(state){
    let springgoodslist = state.goodslist.filter(x=>{
      if(x.category=="spring") return x
    })
    return springgoodslist
  },
  //季节分类
  categorygoodslist: (state) => (category) => {
    let list = state.goodslist.filter(x=>{
          if(x.category== category ) return x
        })
    return list
  },

  //销量排行榜
  hotlist(state){
    //参考函数，正逆序由 -1 和1 决定
    var compare = function (prop) {
      return function (obj1, obj2) {
        var val1 = obj1[prop];
        var val2 = obj2[prop];if (val1 < val2) {
          return 1;
        } else if (val1 > val2) {
          return -1;
        } else {
          return 0;
        }
      }
    }
    // 这个方法的弊端就是undefined、function、symbol 会在转换过程中被忽略
//  let hotlist = JSON.parse( JSON.stringify(state.goodslist) )   // 这里实现了对obj的深拷贝
    let hotlist = deepCopyAdvanced(state.goodslist)
    return hotlist.sort(compare("sellcount"))
  },

  //折扣排行榜
  salelist(state){
    var compare = function (prop) {
      return function (obj1, obj2) {
        var val1 = obj1[prop];
        var val2 = obj2[prop];if (val1 < val2) {
          return -1;
        } else if (val1 > val2) {
          return 1;
        } else {
          return 0;
        }
      }
    }

    let salelist = deepCopyAdvanced(state.goodslist)

    // let salelist = JSON.parse( JSON.stringify(state.goodslist) )

    salelist.forEach(obj=>{
      obj.zhekoulv = obj.nowprice/obj.price
    })

    return  salelist.sort(compare("zhekoulv"))
  },

  //新发售排行榜
  newlist(state){
    var compare = function (prop) {
      return function (obj1, obj2) {
        var val1 = obj1[prop];
        var val2 = obj2[prop];if (val1 < val2) {
          return 1;
        } else if (val1 > val2) {
          return -1;
        } else {
          return 0;
        }
      }
    }
    let newlist = deepCopyAdvanced(state.goodslist)
    return newlist.sort(compare("createTime"))
  },

  //根据id拿到每一件货物的数据
  getgoodsbyid: (state) => (id) => {
    // find函数是浅复制元素，会把对象中的多层引用类型循环复制第一个
    let obj = {}
    state.goodslist.forEach(x=>{
     if( x.goodsid == id){
        obj = deepCopyAdvanced(x)
     }
   })
    return obj
  },
  //模糊搜索
  getgoodsbyserch: (state) => (querystr) => {
    let allgoodslist = deepCopyAdvanced(state.goodslist)
    let querylist = mohuquerylistobj(allgoodslist,querystr,"goodstitle")
    return querylist
  },
}
