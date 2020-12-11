// api.js
import request from '@/request'

// var baseUrl="http://127.0.0.1:3000/"
const api= {
  // 登录
  login(data) {
     return request('user/login', data)
  },
//注册接口
  register(data){
   return request('user/register', data)
  },
  // 首页接口
  index(){
    return request('index/index',"get")
  },
  // 客服
  service(data) {
    return request('user/service', data,"get")
  },
  insertNew(data) {
    return request('user/insertNew', data)
  },
}

export default api