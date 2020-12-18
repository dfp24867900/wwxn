import Vue from 'vue';
import VueRouter from 'vue-router';
import List from '../views/List.vue';
import Service from '../views/Service.vue';
import Login from '../views/Login.vue';
import Shopping from '../views/Shopping.vue';
import Sitecollect from '../views/Sitecollect.vue';
import Site from '../views/Site.vue';
import Sitenote from '../views/Sitenote.vue';
import Sitemsg from '../views/Sitemsg.vue';
import Join from '../views/Join.vue';
import Personal from '../views/Personal.vue';
import Sitegold from '../views/Sitegold.vue';
import Siteset from '../views/Siteset.vue';
import Siteback from '../views/Siteback.vue';
import SearchList from '../views/SearchList.vue';
import Register from '../views/Register.vue';
import Search from '../views/Search.vue';
import Index from '../views/Index.vue';
import Album from '../views/Album.vue';
import Message from '../components/Message.vue';
import Detail from '../views/Detail.vue';

Vue.use(VueRouter)

const routes = [
  { path: '/detail',              name: 'detail',         component: Detail      },
  { path: '/siteback',            name: 'siteback',       component: Siteback    },
  { path: '/siteset',             name: 'siteset',        component: Siteset     },
  { path: '/sitegold',            name: 'sitegold',       component: Sitegold    },
  { path: '/personal',            name: 'personal',       component: Personal    },
  { path: '/join',                name: 'join',           component: Join        },
  { path: '/sitemsg',             name: 'sitemsg',        component: Sitemsg     },
  { path: '/sitenote',            name: 'sitenote',       component: Sitenote    },
  { path: '/site',                name: 'site',           component: Site        },
  { path: '/siteshopping',        name: 'siteshopping',   component: Shopping    },
  { path: '/sitecollect',         name: 'sitecollect',    component: Sitecollect },
  { path: '/searchlist/:keyword', name: 'searchlist',     component: SearchList  },
  { path: '/list/:keyword',       name: 'list',           component: List        },
  { path: '/service',             name: 'service',        component: Service     },
  { path: '/list',                name: 'list',           component: List        },
  { path: '/service',             name: 'service',        component: Service     },
  { path: '/search',              name: 'search',         component: Search      },
  { path: '/login',               name: 'login',          component: Login       },
  { path: '/register',            name: 'register',       component: Register    },
  { path: '/message/:id',         name: 'message',        component: Message     },
  { path: '/album/:id',           name: 'ablum',          component: Album       },
  { path: '/',                    name: 'index',          component: Index       },

  {
    path: '/about',
    name: 'About',
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
