import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import qs from 'qs'
import axios from 'axios'
import moment from 'moment'
import 'moment/locale/zh-cn'

// 导入MintUI模块
import MintUI from 'mint-ui';
// 导入样式文件
import 'mint-ui/lib/style.min.css';
import Vant from 'vant';
import 'vant/lib/index.css';
import List from './views/List.vue'
import Site from './views/Site.vue'

Vue.component('my-list',List)
Vue.component('my-site',Site)
import Foot from './components/Footer.vue'
Vue.component('my-footer',Foot) 
// 通过Vue.use()方法将MintUI注册为插件
Vue.use(MintUI);
Vue.use(Vant)

// 导入视图
import Viewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'
Vue.use(Viewer)
Viewer.setDefaults({
Options: { 'inline': true, 'button': true, 'navbar': true, 'title': true, 'toolbar': true, 'tooltip': true, 'movable': true, 'zoomable': true, 'rotatable': true, 'scalable': true, 'transition': true, 'fullscreen': true, 'keyboard': true, 'url': 'data-source' }
})

Vue.config.productionTip = false;
Vue.prototype.qs=qs
Vue.prototype.axios=axios
axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.moment=moment



new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
