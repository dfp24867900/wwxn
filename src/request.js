// // request.js
 import axios from 'axios'
 import qs from 'qs'
 // 一些请求的基本配置
const service = axios.create({
   baseURL: 'http://127.0.0.1:3000',// 接口的域名地址
   headers: {
     'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8'
   }
 })
// 输出方法
export default function request(url, data = {}, method = 'post') {
  return new Promise((resolve, reject) => {
    const options = {
      url,
      method
    }
    if (method.toLowerCase() === 'get') {
      options.params = data
    } else { //检查一下，post 请求没有进来？s
      options.data = qs.stringify(data) 
    }
    // console.log(options)
    service(options)
       .then(res => {
        resolve(res.data)
      })
      .catch(error => {
        reject()
        console.error(error)
      })
  })
}