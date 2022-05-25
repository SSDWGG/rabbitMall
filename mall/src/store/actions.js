import {
  SET_USER,
    SET_GOODSINFO
} from "./mutation-types";
import {getuserallinfo} from "@/network/login";
import {getallgoodsinfo} from "@/network/goods";

export default {             //action中进行异步操作    返回一个promise
   setuserinfo(context,payload){
    return   new Promise(  (resolve, reject)=>{
       getuserallinfo(payload)
        .then(res=>{
          context.commit(SET_USER,res.data);
          if(!!res.data){
            resolve()
          }else{
            reject()
          }
        })
    })
  },
    setgoodslist(context){
        return   new Promise(  (resolve, reject)=>{
            getallgoodsinfo()
                .then(res=>{
                    context.commit(SET_GOODSINFO,res.data);
                    if(!!res.data){
                        resolve()
                    }else{
                        reject()
                    }
                })
        })
    }


}
