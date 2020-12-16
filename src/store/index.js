import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogined:localStorage.getItem('isLogined') || 0,
    info:JSON.parse(localStorage.getItem('info')) || {},
  },
  getters:{
    counts(state){
      return state.friends.length;
    }
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
    }
  },
  //发送异步请求
  actions: {
    getServerData(context){
      axios.get('/user').then(res=>{
          context.commit('addFriendMutation',res.data);
      });
    }
  },
  modules: {
  }
})
