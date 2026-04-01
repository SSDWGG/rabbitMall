import axios from "axios"


//做一个拦截器的封装
export function request(config) {
  const instance1 = axios.create({
    // baseURL: '/mall',
    baseURL: 'http://localhost:9000',
    timeout: 5000,
  })

  //此处是拦截器的作用
  instance1.interceptors.request.use(config => {
    return config 
  }, err => {
  })

  //此处是响应拦截,接收拦截器重新发送出来的请求     同样也需要data
  instance1.interceptors.response.use(res => {
    return res
  }, err => {

  })

  return instance1(config) //因为axios的返回值本身就是promise
}