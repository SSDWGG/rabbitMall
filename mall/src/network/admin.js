import {request} from "./request";
//引入模块      参数加密序列化模块
// import qs from 'qs'

// user的分页查询
export  function pagequery(pageNum,pageSize) {
    return request({
        url:'allUser',
        method:"post",
        params:{
            pageNum,pageSize
        }
    })
}

// userinfo的分页查询
export  function userinfopagequery(pageNum,pageSize) {
    return request({
        url:'allUserinfo',
        method:"post",
        params:{
            pageNum,pageSize
        }
    })
}

// order的分页查询
export  function orderpagequery(pageNum,pageSize) {
    return request({
        url:'allorder',
        method:"post",
        params:{
            pageNum,pageSize
        }
    })
}

// goods的分页查询
export  function goodspagequery(pageNum,pageSize) {
    return request({
        url:'allgoodspagequery',
        method:"post",
        params:{
            pageNum,pageSize
        }
    })
}

//switch切换属性（全是update，所以这里全部使用put请求）   先使用post请求
export  function attributechange(id,name,targe) {
    return request({
        url:'attributechange',
        method:"put",
        params:{
            id,name,targe
        }
    })
}

//模糊查询
export  function dimquery(queryinfo) {
    return request({
        url:'dimquery',
        method:"post",
        params:{
            queryinfo
        }
    })
}

//添加用户
export  function addUser(username,password,email) {

    return request({
        url:'addUser',
        method:"post",
        params:{
            username,password,email
        }
    })
}

//修改用户
export  function editUser(id,username,password,email) {

    return request({
        url:'editUser',
        method:"put",
        params:{
            id,username,password,email
        }
    })
}

//删除用户
export  function deleteUser(id) {

    return request({
        url:'deleteUser',
        method:"post",
        params:{
           id
        }
    })
}

//修改userinfo      这里id是userinfoid
export  function editUserinfo(id,age,adress) {

    return request({
        url:'editUserinfo',
        method:"put",
        params:{
            id,age,adress
        }
    })
}



//test对象传参          使用qs依旧无法把参数翻到对象中传输 ，所以依旧使用单个参数传递的办法  可以说用parms传参
export  function test(user) {
    return request({
        url:'testobj',
        method:"post",                  //get请求，post请求需要改写请求头
        params:{},
        data:{
            user
        }
    })
}

//test对象传参          使用qs依旧无法把参数翻到对象中传输 ，所以依旧使用单个参数传递的办法  可以说用parms传参
export  function test2(username) {

    return request({
        url:'testobj2',
        method:"post",
        params:{
            username
        }
    })
}