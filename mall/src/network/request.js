import axios from "axios"


//做一个拦截器的封装
export function request(config) {
  const instance1 = axios.create({
    baseURL: 'http://124.223.119.218:9000/',
    // baseURL: 'http://localhost:9000/',
    timeout: 5000,
  })

  //此处是拦截器的作用
  instance1.interceptors.request.use(config => {
    // console.log(config)
    return config //拦截下来了请求，做完修改请求一定要发送出去
  }, err => {
    // console.log(err);
  })

  //此处是响应拦截,接收拦截器重新发送出来的请求     同样也需要data
  instance1.interceptors.response.use(res => {
    return res
  }, err => {

  })

  return instance1(config) //因为axios的返回值本身就是promise
}