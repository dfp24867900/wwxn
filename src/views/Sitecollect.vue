<template>
  <div>
    <!-- 页头 -->
    <mt-header
      title="我的收藏"
      class="collect_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back' @click="didiback"></mt-button>
      </router-link> 
    </mt-header>
    <!-- 顶部选项卡 -->
    <mt-navbar v-model="collect_active" class="collect_nav">
      <mt-tab-item id="collect_1">
        案例      
      </mt-tab-item>
      <mt-tab-item id="collect_2">
        婚礼人
      </mt-tab-item>
    </mt-navbar>
    <div>
      <mt-tab-container v-model="collect_active">
        <mt-tab-container-item id="collect_1" >
          <!-- 外层位置 -->
          <div class="collect_community" v-for="(article,index) in articles" :key="index"  >
            <router-link :to='`/details/${article.cid}`'>           
            <!-- 上方图片位置 -->
            <div>
              <img :src="`/img/list/${article.pic}`" alt="">
            </div>
            <!-- 下方文字描述 -->
            <div>
              <!-- 标题 -->
              <p>{{article.title}}</p>
              <!-- 标签 -->
              <p>{{article.manner}}</p>
              <!-- 价格 -->
              <p>¥{{article.price}}</p>
              <!-- 浏览数量 -->
              <p> <img src="../assets/image/site/collect/collect_eye.png" alt=""> {{article.visits}}人浏览</p>
            </div>
            </router-link>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="collect_2">
          <!-- 外层位置 -->
          <div class="collect_treasure">
            <!-- 左侧图片位置 -->
            <div>
              <img src="../assets/image/site/collect/collect_wedding.jpg" alt="">
            </div>
            <!-- 右侧文字描述 -->
            <div>
              <!-- 文字描述 -->
              <p>致爱名师 |Sukwing Koo：细嗅蔷薇，向心而为</p>
            </div>
          </div>
          <div class="collect_treasure">
            <!-- 左侧图片位置 -->
            <div>
              <img src="../assets/image/site/collect/collect_wedding.jpg" alt="">
            </div>
            <!-- 右侧文字描述 -->
            <div>
              <!-- 文字描述 -->
              <p>致爱名师 |Sukwing Koo：细嗅蔷薇，向心而为</p>
            </div>
          </div>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>

<style>
  /* 定义页面顶部的样式 */
  .collect_header{
    background: linear-gradient(to top, #fcfbfa, #fcf4f5);
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
  }

  /* 设置顶部选项卡的样式 */
  .collect_nav{
    box-shadow: 0 2px 5px 2px #bbb;
    border-top: 1px solid #ccc;
    font-size: 16px;
    color: #aaa;
  }
  .mint-navbar .mint-tab-item.is-selected{
    color: #333 !important;
    font-size: 16px !important;
    border-bottom: 0 !important;
  }

  /* 设置案例位置的样式 */
  .collect_community{
    width: 100%;
    height: 260px;
    position: relative;
  }
  /* 案例上方图片部分的位置 */
  .collect_community>a>div:first-child{
    width: 100%;
    height: 70%;
    overflow: hidden;
    position: absolute;
    border-radius: 5px;
    left: 4%;
    top: 6%;
  }
  .collect_community>a>div:first-child>img{
    width: 92%;
    border-radius: 5px;
  }
  /* 设置案例文字位置 */
  .collect_community>a>div:last-child{
    width: 92%;
    height: 50px;
    position: absolute;
    left: 4%;
    top: 80%;
  }
  .collect_community>a>div:last-child>p:first-child{
    position: absolute;
    top: 0px;
    left: 2px;
    color: #333;
  }
  .collect_community>a>div:last-child>p:last-child,.collect_community>a>div:last-child>p:nth-child(2){
    position: absolute;
    top: 22px;
    left: 2px;
    font-size: 12px;
    color: rgb(83, 78, 78);
  }
  .collect_community>a>div:last-child>p:nth-child(3){
    position: absolute;
    top: 5px;
    left: 80%;
    font-size: 16px;
    color: #900;
  }
  .collect_community>a>div:last-child>p:last-child{
    position: absolute;
    top: 22px;
    left: 73%;
    line-height: 14px;
  }
  .collect_community>a>div:last-child>p:last-child>img{
    width: 12px;
    height: 12px;
    margin-top: 2px;
  }

  /* 设置婚礼人区域的位置 */
  .collect_treasure{
    width: 97%;
    height: 160px;
    margin-top: 10px;
    margin-left: 10px;
    position: relative;
    border-radius: 5px;
  }
  .collect_treasure>div:first-child{
    position: absolute;
    top: 0;
    left: 0px;
    width: 40%;
    height: 150px;
    border-radius: 5px;
    overflow: hidden;
  }
  .collect_treasure>div:first-child>img{
    width: 100%;
  }
  .collect_treasure>div:last-child{
    width: 50%;
    position: absolute;
    top: 65px;
    left: 45%;
    font-size: 14px;
    line-height: 18px;
    color: #333;
    font-family:"Microsoft Yahei";
    border-bottom: 1px dotted #aaa;
  }
  
</style>

<script>
export default {
    data(){
        return {
            //存储收藏信息
            articles:[],
            collect_active:"collect_1"
        }
    },
    methods:{
       didiback(){
            window.history.go(-1);
        }
    }
    ,
    mounted(){    
      if(this.$route.params.uid2){
          //获取地址栏中的参数
          let uid = this.$route.params.uid;
          let uid2 = this.$route.params.uid2;
          //向服务器发送请求以获取指定ID的文章信息
          this.axios.get('/user/sitecollect',{
              params:{
                  uid:uid,
                  uid2:uid2
              }
          }).then(res=>{
            this.articles=res.data;
          });
        }else{
          //获取地址栏中的参数
          let uid = this.$route.params.uid;
          //向服务器发送请求以获取指定ID的文章信息
          this.axios.get('/user/sitecollect',{
              params:{
                  uid:uid
              }
          }).then(res=>{
            this.articles=res.data;
          });
        }
    }
       
}
</script>