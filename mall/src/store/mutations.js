import {
  SET_USER,
  SET_GOODSINFO
} from "./mutation-types";

export default {

  [SET_USER](state, user) {
    //为什么不需要对象深拷贝？？？      地址赋值？
    state.user = user;
  },
  [SET_GOODSINFO](state, goodsinfo) {
    state.goodslist = goodsinfo;
  }
}
