import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Address from '../components/Address.vue'
import List from '../views/List.vue'
<<<<<<< HEAD
import Service from '../views/Service.vue'
=======
import Login from '../views/Login.vue'
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0

Vue.use(VueRouter)

const routes = [
  {path: '/', name: 'Home', component: Home },
  {path:"/address",component:Address},
  {path:"/list",component:List},
<<<<<<< HEAD
  {path: '/service',name: 'Service',component: Service},
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
=======
  {path:"/login",component:Login},
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
