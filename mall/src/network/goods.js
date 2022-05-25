import {
    request
} from "./request";

// 获取全部goods信息
export function getallgoodsinfo() {
    return request({
        url: 'allgoodsinfo',
        method: "post"
    })
}
// 获取被下架的goods
export function getoutgoods() {
    return request({
        url: 'getoutgoods',
        method: "post"
    })
}
// （余货量查询）
// export  function firstbuy(goodsid,size) {
//     return request({
//         url:'firstbuy',
//         method:"post",
//         params:{
//             goodsid,size
//         }
//     })
// }
//  购买商品下单
export function secondbuy(userid, goodsid, size) {
    return request({
        url: 'buy',
        method: "post",
        params: {
            userid,
            goodsid,
            size
        }
    })
}

export function addsizecount(goodsid, size, count) {
    return request({
        url: 'addsizecount',
        method: "post",
        params: {
            goodsid,
            size,
            count
        }
    })
}

export function editsizecount(goodsid, size, count) {
    return request({
        url: 'editsizecount',
        method: "post",
        params: {
            goodsid,
            size,
            count
        }
    })
}