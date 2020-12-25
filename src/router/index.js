import Vue from 'vue'
import VueRouter from 'vue-router'
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
import Details from '../views/Details.vue'

Vue.use(VueRouter)

const routes = [
<<<<<<< HEAD
  {
    path: '/details/:id',
    component: Details
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
    component: Site,
    meta:{showFooter:true}
  },
  {
    path: '/siteshopping/:uid/:uid2?',
    component: Shopping
  },
  {
    path: '/sitecollect/:uid/:uid2?',
    component: Sitecollect
  },
  { path: '/service', name: 'Service', component: Service },
  { path: '/search', name: 'Search', component: Search },
  { path: "/searchlist/:keyword", component: SearchList },
  // { path: "/list/:keyword", component: List ,meta:{showFooter:true}},
  // { path: '/service', name: 'Service', component: Service },
  { path: "/list", component: List,meta:{showFooter:true} },
  // { path: '/service', name: 'Service', component: Service },
  // { path: '/search', name: 'Search', component: Search },
  {
    path: '/about',
    name: 'About',
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
=======
  { path: '/details/:id', component: Details },
  { path: '/siteback', component: Siteback },
  { path: '/siteset', component: Siteset },
  { path: '/sitegold', component: Sitegold },
  { path: '/personal', component: Personal },
  { path: '/join', component: Join },
  { path: '/sitemsg', component: Sitemsg },
  { path: '/sitenote', component: Sitenote },
  { path: '/site', component: Site, meta: { showFooter: true } },
  { path: '/siteshopping/:uid', component: Shopping },
  { path: '/sitecollect/:uid', component: Sitecollect },
  { path: '/service', name: 'Service', component: Service },
  { path: '/search', name: 'Search', component: Search },
  { path: "/searchlist/:keyword", component: SearchList },
  { path: "/list", component: List, meta: { showFooter: true } },
  { path: '/about', name: 'About', component: () => import(/* webpackChunkName: "about" */ '../views/About.vue') },
>>>>>>> a20b5025246b1a130904f55b608a7511c5308e8d
  { path: "/login", component: Login },
  { path: "/register", component: Register },
  { path: '/message/:id', component: Message },
  { path: '/album/:id', component: Album, meta: { showFooter: true } },
  { path: '/', component: Index, meta: { showFooter: true } },
  { path: '/index', component: Index, meta: { showFooter: true } }
]
//获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
