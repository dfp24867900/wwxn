<template>
  <div class="bride_list">
     <div class="top">
       <!-- 顶部 -->
       <mt-header title="案例">
         <router-link to="/" slot="left">
           <mt-button icon="back"></mt-button>
         </router-link>
       </mt-header>
       <!-- 顶部结束 -->
       <!-- 顶部导航栏 -->
       <div>
         <mt-navbar v-model="active">
           <mt-tab-item id="1">
             <span @click="defaults">综合</span>
           </mt-tab-item>
           <mt-tab-item id="2">价格
             <img class="icon_img" src="/img/icon/icon3.png" @click="price_asc" v-if="icon_toggle">
             <img class="icon_img" src="/img/icon/icon4.png" @click="price_desc" v-else>
           </mt-tab-item>
           <mt-tab-item id="3">浏览量
             <img class="icon_img" src="/img/icon/icon3.png" @click="vistis_asc" v-if="icon_vistis">
             <img class="icon_img" src="/img/icon/icon4.png" @click="vistis_desc" v-else>
           </mt-tab-item>
           <mt-tab-item id="4">筛选
             <img src="/img/icon/icon2.png" class="icon_img1" @click="sort_click">
           </mt-tab-item>
         </mt-navbar>
         <van-action-sheet v-model="show" title="案例筛选">
            <div class="content1">
              <span class="title">场景</span>
                <div class="flex-row">
                  <router-link class="item" to="#">草坪</router-link>
                  <router-link class="item" to="#">教堂</router-link>
                  <router-link class="item" to="#">户外</router-link>
                  <router-link class="item" to="#">室内</router-link>
                  <router-link class="item" to="#">其他</router-link>
                </div>
                <span class="title">风格</span>
                <div class="flex-row">
                   <router-link class="item" to="#">复古</router-link>
                   <router-link class="item" to="#">梦幻</router-link>
                   <router-link class="item" to="#">大气</router-link>
                   <router-link class="item" to="#">主题</router-link>
                   <router-link class="item" to="#">简洁</router-link>
                   <router-link class="item" to="#">新中式</router-link>
                   <router-link class="item" to="#">小清新</router-link>
                   <router-link class="item" to="#">唯美</router-link>
                   <router-link class="item" to="#">韩式</router-link>
                   <router-link class="item" to="#">森系</router-link>
                   <router-link class="item" to="#">西式</router-link>
                   <router-link class="item" to="#">传统中式</router-link>
                </div>
                <span class="title">颜色</span>
                  <div class="flex-row">
                   <router-link class="item" to="#" style=" background-color: #ff0; opacity: 0.5;"></router-link>
                   <router-link class="item" to="#" style=" background-color: #ffa8bc; opacity: 0.5;"></router-link>
                   <router-link class="item" to="#" style=" background-color: #ff5d00; opacity: 0.5;"></router-link>
                   <router-link class="item" to="#" style=" background-color: #3767ea; opacity: 0.5;"></router-link>
                   <router-link class="item" to="#" style=" background-color: #49bcc3; opacity: 0.5;"></router-link>
                   <router-link class="item" to="#" style=" background-color: #009000; opacity: 0.5;"></router-link>
                  </div>
                 <span class="title">价格</span>
                 <div class="flex-row">
                  <router-link class="item" to="#">5千以下</router-link>
                  <router-link class="item" to="#">5千-1万</router-link>
                  <router-link class="item" to="#">1万-2万</router-link>
                  <router-link class="item" to="#">2万-3万</router-link>
                </div>
                <mt-tabbar>
                  <button class="reset">重置</button>
                  <button class="confirm">确定</button>
                </mt-tabbar>
            </div>
         </van-action-sheet>
       </div>
       <!-- 顶部导航栏结束 -->
     </div>
     <!-- 面板区域开始 -->
     <div class="main">
       <mt-tab-container v-model="active">
         <mt-tab-container-item :id="active">
           <router-link to="/" v-for="(item,index) of list" :key="index">
              <div class="content">
               <img class="content_img" :src="`/img/list/${item.pic}`">
               <p>
                 <span>{{item.title}}</span>
                 <span>￥{{item.price}}</span>
               </p>
               <p>
                 <span>#{{item.manner}}&nbsp;&nbsp;#{{item.scene}}&nbsp;&nbsp;#{{item.color}}</span>
                
                   <img src="/img/icon/icon.png" class="watch_icon">
                   <span class="my_span">{{item.visits}}</span>
                 
               </p>
              </div>
           </router-link>
         </mt-tab-container-item>
         <!-- <mt-tab-container-item id="2">22</mt-tab-container-item>
         <mt-tab-container-item id="3">33</mt-tab-container-item>
         <mt-tab-container-item id="4">44</mt-tab-container-item> -->
       </mt-tab-container>
     </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      active:"1",
      icon_toggle:true,
      icon_vistis:true,
      show:false,
      list:[]
    }
  },
  methods:{
    //价格升序
    price_asc(){
      this.list=[];
      this.icon_toggle=false;
      this.axios.get("/list/price_asc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        })
      })
    },
    //价格降序
    price_desc(){
      this.list=[];
      this.icon_toggle=true;
      this.axios.get("/list/price_desc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem)
        })
      })
    },
    //筛选分类
    sort_click(){
      this.show=true;
    },
    defaults(){
      this.list=[];
      this.axios.get("/list/defaults").then(result=>{
      console.log(result.data);
      this.list=result.data.results;
    })
    },
    //浏览量升序
    vistis_asc(){
       this.list=[];
       this.icon_vistis=false;
       this.axios.get("/list/vistis_asc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        })
       })
    },
    //浏览量降序
    vistis_desc(){
      this.list=[];
      this.icon_vistis=true;
      this.axios.get("/list/vistis_desc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        })
      })
}
  },
  mounted(){
    this.axios.get("/list/defaults").then(result=>{
      console.log(result.data);
      this.list=result.data.results;
    })
  }
}
</script>

<style>
.my_span{
  color: #999;
}
.reset{
  margin-left: 25px;
  height: 40px;
  width: 150px;
  border: 1px solid #57d2cd;
  color: #57d2cd;
  margin-bottom: 5px;
  background: #fff;
  outline: nonr;
  border-radius: 5px;
}
.confirm{
  height: 40px;
  width: 150px;
  background:#57d2cd ;
  border: 0;
  outline: none;
  border-radius: 5px;
  color: #fff;
  margin-left: 25px;
}
.mint-tabbar{
  background-image: none !important;
  background: transparent !important;
}
.flex-row{
  margin-top: 10px;
  display: flex;
  flex-wrap: wrap;
}
.item{
  display: inline-block;
  height: 30px;
  width: 70px;
  background: #f1f1f1;
  border-radius: 100px;
  text-align: center;
  line-height: 35px;
  margin:0px  10px 15px 5px;
  color: #999999;
}
.title{
  display: inline-block;
  font-size: 18px;
  font-weight: bold;
  text-align: left !important;
  margin-left: 10px;
}
.content1{
    padding: 16px 16px 160px;
}
.mint-header{
  background-color: #c8caee !important;
  font-size: 19px !important;
  color: #000;
  font-weight: bold;
}
.top{
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  z-index: 333;
}
/* 图标的样式 */
.icon_img{
  width: 0.7rem;
  height: 0.7rem;
  vertical-align: top;
}
.icon_img1{
  width: 0.6rem;
  height: 0.6rem;
  vertical-align: baseline;
}
.mint-navbar .mint-tab-item{
  font-size: 15px;
  font-weight: bold;
}
.main{
  margin-top: 87px;
}
.content{
  padding: 10px 20px;
}
.content_img{
  width: 335px;
  height: 200px;
}
.content>p:nth-child(2){
  margin-top: 10px;
}
.content>p:nth-child(2)>span:first-child{
  display: inline-block;
  width: 11rem;
  font-size: 18px;
  font-weight: bold;
  color: #333;
}
.content>p:nth-child(2)>span:nth-child(2){
  font-size: 18px;
  color: rgb(231, 46, 46);
  font-weight: bold;
  margin-left: 5.7rem;
}
.content>p:nth-child(3){
  margin-top: 10px;
}
.content>p:nth-child(3)>span:first-child{
  display: inline-block;
  width: 11rem;
  font-size: 12px;
  color: #999999;
}
.watch_icon{
  width: 1rem;
  height: 1rem;
  vertical-align: top;
  margin-left: 7rem;
}
</style>
