import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 导入MintUI模块
import MintUI from 'mint-ui';
// 导入样式文件
import 'mint-ui/lib/style.min.css';
import Vant from 'vant';
import 'vant/lib/index.css';
// 通过Vue.use()方法将MintUI注册为插件
Vue.use(MintUI);
Vue.use(Vant)

Vue.config.productionTip = false;
Vue.prototype.qs=qs

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
