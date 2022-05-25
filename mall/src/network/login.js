import {request} from "./request";


export  function login(username,password) {   //  使用分布传递参数，后台只接受json格式，axios的这个怎么专json？
  return request({
    url:'login',
    method:"post",
    params:{
      username,
      password
    }
  })
}

export  function register(username,password,email,identify) {
  return request({
    url:'tourist/register',
    method:"post",
    params:{
      username,
      password,
      email,
      identify

    }
  })
}

export  function email(email) {
  return request({
    url:'tourist/sendEmail',
    method:"post",
    params:{
      email
    }
  })
}

export  function upadasendemail(email) {
  return request({
    url:'tourist/forgetpasswordtest',
    method:"post",
    params:{
      email
    }
  })
}

export  function identifyingcode(code,email){
  return request({
    url:'tourist/testCode',
    method:"post",
    params:{code,email}
  })
}

export  function updatepassword(password,email){
  return request({
    url:'tourist/updatepassword',
    method:"post",
    params:{password,email}
  })
}

//获取所有用户信息，存放到state
export   function getuserallinfo(username) {
  return  request({
    url:'getuserallinfo',
    method:"post",
    params:{
      username
    }
  })
}