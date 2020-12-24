<template>
  <div class="bride_list">
     <div class="top">
       <!-- 顶部 -->
       <mt-header title="案例">
         <router-link to="/index" slot="left">
        <mt-button icon="back" ></mt-button>
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
           <!-- 案例筛内容 -->
            <div class="content1">
              <span class="title">场景</span>
                <div class="flex-row">
                  <button v-for="(item,index) of scene" :key="index" @click="screen_1($event,index)" data-scene="item" class="item"  :style="{background:my_color}">{{item}}</button>
                </div>
                <span class="title">风格</span>
                <div class="flex-row">
                   <button v-for="(item,index) of manner" :key="index"  @click="screen_2($event,index)" class="item" >{{item}}</button>
                </div>
                <span class="title">颜色</span>
                  <div class="flex-row">
                   <button v-for="(item,index) of color" :key="index"  class="item1"  :style="{background:item}"></button>
                  </div>
                 <span class="title">价格</span>
                 <div class="flex-row">
                  <button v-for="(item,index) of price" :key="index" @click="screen_3($event,index)" class="item" >{{item}}</button>
                </div>
                <mt-tabbar>
                  <button class="reset" @click="reset">重置</button>
                  <button class="confirm" @click="confirm">确定</button>
                </mt-tabbar>
            </div>
            <!-- 案例筛选内容结束 -->
         </van-action-sheet>
       </div>
       <!-- 顶部导航栏结束 -->
     </div>
     <!-- 面板区域开始 -->
     <div class="main">
       <mt-tab-container v-model="active">
         <mt-tab-container-item :id="active">
           <div v-show="found" class="not_found">
             <img src="/img/icon/icon5.png">
             <p>找不到该案例</p>
           </div>
           <router-link :to="`/details/${item.cid}`" v-for="(item,index) of list" :key="index">
              <div class="content">
               <img class="content_img" v-lazy="`/img/list/${item.pic}`">
               <p>
                 <span>{{item.title}}</span>
                 <span>￥{{item.price}}</span>
               </p>
               <p>
                 <span>#{{item.manner}}#{{item.scene}}#{{item.color}}</span>
                 <img src="/img/icon/icon.png" class="watch_icon">
                 <span class="my_span">{{item.visits}}</span>
                  </p>
              </div>
           </router-link>
         </mt-tab-container-item>
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
      my_color:"#f1f1f1",
      list:[],
      //保存场景
      scene:["草坪","教堂","户外","室内","其他"],
      //保存风格
      manner:["复古","梦幻","大气","主题","简洁","新中式","小清新","唯美","韩式","森系","西式","传统"],
      //保存颜色
      color:["#ff0","#ffa8bc","#ff5d00","#3767ea","#49bcc3","#009000"],
      //保存价格
      price:["5千以下","5千-1万","1万-2万","2万-3万"],
      //保存选中的数据
      screen:[],
      screen1:"",
      screen2:"",
      screen3:"",
      found:false
    }
  },
  methods:{
    //价格升序
    price_asc(){
      this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
      this.list=[];
      this.icon_toggle=false;
      this.axios.get("/list/price_asc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        });
        this.$indicator.close();
      })
    },
    //价格降序
    price_desc(){
     this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
      this.list=[];
      this.icon_toggle=true;
      this.axios.get("/list/price_desc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem)
        });
        this.$indicator.close();
      })
    },
    //筛选分类
    sort_click(){
      this.show=true;
    },
    defaults(){
      this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
      this.found=false;
      this.list=[];
      this.axios.get("/list/defaults").then(result=>{
      console.log(result.data);
      this.list=result.data.results;
      this.$indicator.close();
    })
    },
    //浏览量升序
    vistis_asc(){
     this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
      this.found=false;
       this.list=[];
       this.icon_vistis=false;
       this.axios.get("/list/vistis_asc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        })
        this.$indicator.close();
       })
    },
    //浏览量降序
    vistis_desc(){
      // this.load();
      this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
      this.found=false;
      this.list=[];
      this.icon_vistis=true;
      this.axios.get("/list/vistis_desc").then(result=>{
        let arr=result.data.results;
        arr.forEach(elem=>{
          this.list.push(elem);
        });
        this.$indicator.close();
      })
  },
  //确认触发按钮事件,获取后台信息
  confirm(){
   this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
    this.show=false;
    this.list=[];
    this.screen=[];
    if(this.screen1!=""){
      this.screen.push({scene:this.screen1});
    }
    if(this.screen2!=""){
      this.screen.push({manner:this.screen2});
    }
    if(this.screen3!=""){
      this.screen.push({price:this.screen3});
    }
    console.log(this.screen);
    if(this.screen.length>0){
     //arr1.forEach(elem=>{
        //向后台发请求,获取后台数据
      this.axios.get("/list/scene",{params:{alter:this.screen}}).then(result=>{
        if(result.data.code==200){
          console.log(result.data.results);
          this.list=result.data.results;
          this.found=false;
        }else{
          console.log(1);
         this.list=[];
         this.found=true;
        }
        this.$indicator.close();
      })
    //})
    }else{
       this.found=false;
       this.$toast({
         message:"请选择要筛选的内容",
         position: 'center',
         duration: 3000
       });
    }
  },
  //重置触发按钮事件
  reset(){
    //点击重置,所有按钮全部变回最初的样子
    this.screen1="";
    this.screen2="";
    this.screen3="";
    var btns=document.querySelectorAll(".item")
    for(var btn of btns){
      btn.style.backgroundColor="#f1f1f1";
      btn.style.color="#999";
    }
  },
  //场景
  screen_1(e,value){
     //e.target获取当前正在点击的元素 
    let btn=e.target;
    if(this.screen1!=this.scene[value]){
       btn.style.backgroundColor="#57d2cd";
       btn.style.color="#fff";
       $(e.target).siblings().css("background","#f1f1f1");
       $(e.target).siblings().css("color","#999");
       this.screen1=this.scene[value];
       console.log(this.screen1);
    }else if(this.screen1!=""){
       this.screen1="";
       btn.style.backgroundColor="#f1f1f1";
       btn.style.color="#999";
    }
  },
  //风格
  screen_2(e,value){
    let btn=e.target;
    if(this.screen2!=this.manner[value]){
      btn.style.backgroundColor="#57d2cd";
      btn.style.color="#fff";
      $(e.target).siblings().css("background","#f1f1f1");
      $(e.target).siblings().css("color","#999");
      this.screen2=this.manner[value];
   }else if(this.screen2!=""){
      this.screen2=""
      btn.style.backgroundColor="#f1f1f1";
      btn.style.color="#999";
    }
  },
  //价格
  screen_3(e,value){
    let btn=e.target;
    if(this.screen3!=this.price[value]){
      btn.style.backgroundColor="#57d2cd";
      btn.style.color="#fff";
      $(e.target).siblings().css("background","#f1f1f1");
      $(e.target).siblings().css("color","#999");
      switch(value){
        case 0 : this.screen3='0-5000';
        break; 
        case 1 :this.screen3='5000-10000';
        break; 
         case 2 :this.screen3='10000-20000';
        break; 
         case 3 :this.screen3='20000-30000';
        break; 
        default:return;
      }
      
   }else if(this.screen3!=""){
      this.screen3=""
      btn.style.backgroundColor="#f1f1f1";
      btn.style.color="#999";
    }
  }
},
  mounted(){
    this.$indicator.open({
      text:'加载中...',
      spinnerType:'fading-circle'
    });
    this.found=false;
    this.axios.get("/list/defaults").then(result=>{
      console.log(result.data);
      this.list=result.data.results;
      this.$indicator.close();
    })
  }
}
</script>

<style>
/* 不能发现案例 */
.bride_list .not_found{
  text-align: center;
  margin-top: 170px;
}
.bride_list .my_span{
  color: #999;
}
.bride_list .reset{
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
.bride_list .confirm{
  height: 40px;
  width: 150px;
  background:#57d2cd ;
  border: 0;
  outline: none;
  border-radius: 5px;
  color: #fff;
  margin-left: 25px;
}
.bride_list .mint-tabbar{
  background-image: none !important;
  background: transparent !important;
}
.bride_list .flex-row{
  margin-top: 10px;
  display: flex;
  flex-wrap: wrap;
}
 .bride_list .item,.item1{
  display: inline-block;
  height: 30px;
  width: 70px;
  background: #f1f1f1;
  border-radius: 100px;
  text-align: center;
  line-height: 30px;
  margin:0px  10px 15px 5px;
  color: #999999;
  padding: 0;
  border: 0;
}
.bride_list .title{
  display: inline-block;
  font-size: 18px;
  font-weight: bold;
  text-align: left !important;
  margin-left: 10px;
}
.bride_list .content1{
  padding: 16px 16px 160px;
}
.bride_list .mint-header{
  background:linear-gradient(to top, #fcfbfa, #fcf4f5) !important;
  font-size: 16px !important;
  color: #000;
  font-weight: bold;
  border-bottom: 1px solid #e8e8e8;
}
.bride_list .top{
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  z-index: 333;
}
/* 图标的样式 */
.bride_list .icon_img{
  width: 0.7rem;
  height: 0.7rem;
  vertical-align: top;
}
.bride_list .icon_img1{
  width: 0.6rem;
  height: 0.6rem;
  vertical-align: baseline;
}
.bride_list .mint-navbar .mint-tab-item{
  font-size: 15px;
  font-weight: bold;
}
.bride_list .main{
  margin-top: 87px;
  margin-bottom: 55px;
}
.bride_list .content{
  padding: 10px 20px;
}
.bride_list .content_img{
  width: 335px;
  height: 200px;
}
.bride_list .mint-navbar .mint-tab-item{
  padding: 14px;
}
.bride_list .mint-header-title{
  font-size: 14px;
}
.bride_list .content>p:nth-child(2){
  margin-top: 10px;
}
.bride_list .content>p:nth-child(2)>span:first-child{
  display: inline-block;
  width: 11rem;
  font-size: 18px;
  font-weight: bold;
  color: #333;
}
.bride_list .content>p:nth-child(2)>span:nth-child(2){
  font-size: 18px;
  color: rgb(231, 46, 46);
  font-weight: bold;
  margin-left: 4.7rem;
}
.bride_list .content>p:nth-child(3){
  margin-top: 10px;
}
.bride_list .content>p:nth-child(3)>span:first-child{
  display: inline-block;
  width: 13rem;
  font-size: 12px;
  color: #999999;
}
.bride_list .watch_icon{
  width: 1rem;
  height: 1rem;
  vertical-align: top;
  margin-left: 3rem;
}
</style>
