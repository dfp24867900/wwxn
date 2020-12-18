import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';

//注册成为Vue的插件
Vue.use(Vuex)

//通过构造函数来创建Vuex的Store(仓库)
export default new Vuex.Store({
  //各个组件中共享的数据
  state: {
    // 标识用户是否已经登录
    isLogined:0,
    // 存储登录用户的相关信息
    info:{},
    
  },
  getters:{
    
  },
  //改变状态
  mutations: {
    // 用户登录成功
    loginMutation(state,payload){
      //改变用户登录的状态
      state.isLogined = 1;
      //将获取到的登录用户信息存储到info中去
      state.info = payload;
    },
    // 用户注销
    logoutMutation(state){
      state.isLogined = 0;
      state.info = {};
    },
    
  },
  //发送异步请求
  actions: {
    
  },
  modules: {
  }
})
