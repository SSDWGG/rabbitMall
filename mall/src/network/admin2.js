import {
    request
} from "./request";

// 订单发货
export function sendbyorderid(orderid) {
    return request({
        url: 'sendbyorderid',
        method: "post",
        params: {
            orderid
        }
    })
}

//删除订单
export function deleteorder(orderid) {
    return request({
        url: 'deleteorder',
        method: "post",
        params: {
            orderid
        }
    })
}

//根据username查找订单
export function queryorder(username) {
    return request({
        url: 'queryorder',
        method: "post",
        params: {
            username
        }
    })
}

//根据goodsname查找goods
export function querygoods(goodsname) {
    return request({
        url: 'querygoods',
        method: "post",
        params: {
            goodsname
        }
    })
}

// //switch切换属性（全是update，所以这里全部使用put请求）   先使用post请求
// export  function issellchange(id,name,targe) {
//     return request({
//         url:'issellchange',
//         method:"put",
//         params:{
//             id,name,targe
//         }
//     })
// }

//获取全部的adminlog
export function getadminloglist() {
    return request({
        url: 'getadminloglist',
        method: "post",
        params: {}
    })
}
//admin的操作记录下来
export function setadminlog(adminname, adminactive) {
    return request({
        url: 'setadminlog',
        method: "post",
        params: {
            adminname,
            adminactive
        }
    })
}
// 添加商品
export function addgoods(goodsname, category, price, goodsdescribe, goodstitle) {
    return request({
        url: 'addgoods',
        method: "post",
        params: {
            goodsname,
            category,
            price,
            goodsdescribe,
            goodstitle,
        }
    })
}

// 修改商品信息
export function editgoods(goodsid, goodsname, category, nowprice, goodsdescribe, goodstitle) {
    return request({
        url: 'editgoods',
        method: "post",
        params: {
            goodsid,
            goodsname,
            category,
            nowprice,
            goodsdescribe,
            goodstitle,
        }
    })
}