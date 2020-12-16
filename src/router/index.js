import Vue from 'vue'
import VueRouter from 'vue-router'
import Address from '../components/Address.vue'
import List from '../views/List.vue'
import Service from '../views/Service.vue'
import Login from '../views/Login.vue'
import Shopping from '../views/Shopping.vue'
import Sitecollect from '../views/Sitecollect.vue'
import Site from '../views/Site.vue'
import Sitenote from '../views/Sitenote.vue'
import Sitemsg from '../views/Sitemsg.vue'
import Join from '../views/Join.vue'
import Personal from '../views/Personal.vue'
import Sitegold from '../views/Sitegold.vue'
import Siteset from '../views/Siteset.vue'
import Siteback from '../views/Siteback.vue'
import SearchList from '../views/SearchList.vue'
import Register from '../views/Register.vue'
import Search from '../views/Search.vue'
import Index from '../views/Index.vue'
import Album from '../views/Album.vue'
import Message from '../components/Message.vue'

import Detail from '../views/Detail.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/detail/:lid',
    component: Detail
  },
  {
    path: '/siteback',
    component: Siteback
  },
  {
    path: '/siteset',
    component: Siteset
  },
  {
    path: '/sitegold',
    component: Sitegold
  },
  {
    path: '/personal',
    component: Personal
  },
  {
    path: '/join',
    component: Join
  },
  {
    path: '/sitemsg',
    component: Sitemsg
  },
  {
    path: '/sitenote',
    component: Sitenote
  },
  {
    path: '/site',
    component: Site
  },
  {
    path: '/siteshopping',
    component: Shopping
  },
  {
    path: '/sitecollect',
    component: Sitecollect
  },
<<<<<<< HEAD
  // {path: '/', name: 'Home', component: Home },
  // { path: '/', name: 'Home', component: Home },
  { path: "/address", component: Address },
  { path: "/list", component: List },
  { path: '/service', name: 'Service', component: Service },
  // {path: '/', name: 'Home', component: Home },
  {path: '/search', name: 'Search', component: Search },
=======
  { path: "/address", component: Address },
  { path: "/searchlist/:keyword", component: SearchList },
  { path: "/list/:keyword", component: List },
  { path: '/service', name: 'Service', component: Service },
  { path: "/address", component: Address },
  { path: "/list", component: List },
  { path: '/service', name: 'Service', component: Service },
  { path: '/search', name: 'Search', component: Search },
>>>>>>> 578020edcad33d231f4dfcb1a437fc50f70cec6b
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  { path: "/login", component: Login },
<<<<<<< HEAD
  {path:"/register",component:Register},
=======
  { path: "/login", component: Login },
  { path: "/register", component: Register },
>>>>>>> 578020edcad33d231f4dfcb1a437fc50f70cec6b
  {
    path: '/message',
    component: Message
  },

  {
    path: '/album/:id',
    component: Album
  },
  {
    path: '/',
    component: Index
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
