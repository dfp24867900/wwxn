import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Address from '../components/Address.vue'
import List from '../views/List.vue'
import Service from '../views/Service.vue'
import Login from '../views/Login.vue'
import Service1 from '../components/Service.vue'

Vue.use(VueRouter)

const routes = [
  {path: '/', name: 'Home', component: Home },
  {path:"/address",component:Address},
  {path:"/list",component:List},
  {path: '/service',name: 'Service',component: Service},
  {path: '/service1',name: 'Service',component: Service1},
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {path:"/login",component:Login},
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
