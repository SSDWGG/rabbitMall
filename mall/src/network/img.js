import {request} from "./request";

export  function upload(file) {   //  使用分布传递参数，后台只接受json格式，axios的这个怎么专json？
    return request({
        url:'/upload',
        method:"post",
        params:file
    })
}
