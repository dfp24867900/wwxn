<template>
<div class="details">
  <!-- 头部导航栏开始 -->
  <mt-header title="薇薇新娘" fixed>
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right"
        ><mt-button icon="search"></mt-button
      ></router-link>
    </mt-header>
   <!-- 头部导航栏结束 -->
       <!-- 轮播图开始 -->
        <div>
          <van-swipe :autoplay='3000' class="carouse">
            <van-swipe-item v-for="(image,index) in images" :key="index">
              <img v-lazy="image">
            </van-swipe-item>
          </van-swipe>
        </div>
        <!-- 轮播图结束-->
  <!-- 顶部选项卡开始 -->
  <nav>
      <van-sticky :offset-top="40">
    <mt-navbar v-model="active"> 
      <mt-tab-item id="1">商品详情</mt-tab-item>
      <mt-tab-item id="2">价格明细</mt-tab-item>
      <mt-tab-item id="3">客户评论</mt-tab-item>
    </mt-navbar>
  </van-sticky>
  </nav>
  <!-- 顶部选项卡结束 -->
  <!-- 面板区域开始 -->
  <section class="details-main">
    <mt-tab-container swipeable v-model="active">
      <!-- 商品详情 -->
      <mt-tab-container-item id="1" >
        <div class='detail-top'>
          <!--副标题  -->
          <van-row>
              <van-col span="14">简约+质感泰式</van-col>
              <van-col span="8" offset="2">
                <van-icon name="eye-o" size="8"/>
                <span>502人浏览</span>
              </van-col>
          </van-row>
        <!-- 类型 -->
        <div class="detail-main-from" v-for="(msge,index) in messages" :key="index">
          <span >{{msge}}</span> 
        </div>
        <!-- 日期 -->
        <div class="detail-time">
          <van-icon name="calendar-o" size="15"/>
          <span>2020年10月24日</span>
        </div>
        <!-- 价格明细 -->
        <div>
          <van-row class="detail-price">
            <van-col span="12">¥28430.00</van-col>
            <van-col span="12">
             <van-rate v-model="value" icon="like" void-icon="like-o" />
            </van-col>
          </van-row>
        </div>
        <!-- 酒店 -->
        <div class='detail-hotel'>
            <img src="../assets/image/icon/jiudian.png">
            <p>友豪锦江酒店</p>
        </div> 
        </div>
        <!-- 设计效果图 -->
        <div class="detail-content" >
          <p>设计效果图</p> 
            <!-- <div v-for="(image,index) in images" :key="index" @click="browse">
              <img v-lazy="image" >
            </div> -->

            <viewer :images="images">
          <img v-for="(src,index) in images" :src="src" :key="index" >

          </viewer>
        </div>
        <!-- 婚礼团队 -->
        <div class="detail-footer">
          <div class="info">
            <!-- 头像 -->
           <van-image
                width="37"
                height="35"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
                 class="detail-item-avatar"
              />
          <span class='detail-info-nickname'>策划师 [大钊] :</span>
           <!-- 内容简述开始 -->
        <div class="rich-content" >
            <p>打破香槟系婚礼靠花艺的堆砌，用线条感制造质感，且多用线条花材，使花艺不显油腻，设计平滑的喷绘吊顶，让低层高的厅吊顶也不显压抑，打造出高级简约的质感泰式婚礼</p>
        </div>
        <div>
            <!-- 图片详图开始 -->
          <img v-for="(img,index) in imageList" :key="index" v-lazy="img"  class="lazyImages"  
          />
          <!-- 图片详图结束 -->
          <div class="comments-more"  >
            <span >加载更多</span>
          </div>
       
        </div>
        
      <!--内容简述开始 结束 -->
      </div>
          <div class="team">
            <p>婚礼团队:</p>
          <van-row type="flex" justify="space-between">
            <van-col span="9">
              <van-image
                width="35"
                height="33"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
              />
              <div >
                <p>  大钊</p>  
                <span>策划师</span>
                <span>¥1890.00</span>
              </div>
          
            </van-col>
            <van-col span="9">
               <van-image
               width="35"
                height="33"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
              />
              <div >
                <p>  大钊</p>  
                <span>策划师</span>
                <span>¥1890.00</span>
              </div>
            </van-col>

             <van-col span="9">
               <van-image
                width="35"
                height="33"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
              />
              <div >
                <p>  大钊</p>  
                <span>策划师</span>
                <span>¥1890.00</span>
              </div>
            </van-col>

             <van-col span="9">
               <van-image
                width="35"
                height="33"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
              />
              <div >
                <p>  大钊</p>  
                <span>策划师</span>
                <span>¥1890.00</span>
              </div>
            </van-col>
            
            <van-col span="9">
               <van-image
                width="35"
                height="33"
                lazy-load
                 round
                 src="https://img.izhaowo.com/img/9_B7220C59-07B9-445D-9C5A-07AAF7BAF8C4.png?x-oss-process=image/resize,m_fill,w_200,h_200,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center"
              />
              <div >
                <p>  大钊</p>  
                <span>策划师</span>
                <span>¥1890.00</span>
              </div>
            </van-col>
          </van-row> 
          </div>
           
        </div>
       
      </mt-tab-container-item>
      <!-- 价格明细 -->
      <mt-tab-container-item id='2' >
        <div class="details-price">
          <div class="details-price-title">
            <van-icon name="gem" />
            <span>执行人员</span>
          </div>
        <div>
          <van-collapse v-model="activeNames">
            <van-collapse-item title="平面设计师" name="1">
                <van-cell-group>
                  <van-cell title="项目" value="平面设计师" />
                  <van-cell title="服务内容" value="呈现婚礼的画面样式、设计KV和场景的配合" />
                  <van-cell title="服务水平" value="专业中级" />
                  <van-cell title="单价(元)" value="200" />
                  <van-cell title="数量" value="1.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="200"  class="price"/>
                </van-cell-group>
            </van-collapse-item>
            <van-collapse-item title="场布师" name="2">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景布置样式、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="400" />
                  <van-cell title="数量" value="5.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="2000" class="price"/>
                </van-cell-group>
              </van-collapse-item>
            <van-collapse-item title="高级花艺师" name="3">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景花艺设计、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="800" />
                  <van-cell title="数量" value="2.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="1600" class="price" />
                </van-cell-group>
            </van-collapse-item>
             <van-collapse-item title="合计" name="4">
               <van-cell-group>
                  <van-cell title="合计(元)" value="3800元" class="price" />
                </van-cell-group>
              </van-collapse-item>
          </van-collapse>
        </div>

        <div class="details-price-title">
            <van-icon name="gem" />
            <span>执行人员</span>
          </div>
        <div>
          <van-collapse v-model="activeNames">
            <van-collapse-item title="平面设计师" name="1">
                <van-cell-group>
                  <van-cell title="项目" value="平面设计师" />
                  <van-cell title="服务内容" value="呈现婚礼的画面样式、设计KV和场景的配合" />
                  <van-cell title="服务水平" value="专业中级" />
                  <van-cell title="单价(元)" value="200" />
                  <van-cell title="数量" value="1.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="200"  class="price"/>
                </van-cell-group>
            </van-collapse-item>
            <van-collapse-item title="场布师" name="2">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景布置样式、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="400" />
                  <van-cell title="数量" value="5.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="2000" class="price"/>
                </van-cell-group>
              </van-collapse-item>
            <van-collapse-item title="高级花艺师" name="3">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景花艺设计、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="800" />
                  <van-cell title="数量" value="2.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="1600" class="price" />
                </van-cell-group>
            </van-collapse-item>
             <van-collapse-item title="合计" name="4">
               <van-cell-group>
                  <van-cell title="合计(元)" value="3800元" class="price" />
                </van-cell-group>
              </van-collapse-item>
          </van-collapse>
        </div>

        <div class="details-price-title">
            <van-icon name="gem" />
            <span>执行人员</span>
          </div>
        <div>
          <van-collapse v-model="activeNames">
            <van-collapse-item title="平面设计师" name="1">
                <van-cell-group>
                  <van-cell title="项目" value="平面设计师" />
                  <van-cell title="服务内容" value="呈现婚礼的画面样式、设计KV和场景的配合" />
                  <van-cell title="服务水平" value="专业中级" />
                  <van-cell title="单价(元)" value="200" />
                  <van-cell title="数量" value="1.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="200"  class="price"/>
                </van-cell-group>
            </van-collapse-item>
            <van-collapse-item title="场布师" name="2">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景布置样式、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="400" />
                  <van-cell title="数量" value="5.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="2000" class="price"/>
                </van-cell-group>
              </van-collapse-item>
            <van-collapse-item title="高级花艺师" name="3">
              <van-cell-group>
                  <van-cell title="项目" value="场布师" />
                  <van-cell title="服务内容" value="呈现婚礼各区域场景花艺设计、细节" />
                  <van-cell title="服务水平" value="专业" />
                  <van-cell title="单价(元)" value="800" />
                  <van-cell title="数量" value="2.0" />
                  <van-cell title="单位" value="人" />
                  <van-cell title="合计(元)" value="1600" class="price" />
                </van-cell-group>
            </van-collapse-item>
             <van-collapse-item title="合计" name="4">
               <van-cell-group>
                  <van-cell title="合计(元)" value="3800元" class="price" />
                </van-cell-group>
              </van-collapse-item>
          </van-collapse>
        </div>
        </div>
      </mt-tab-container-item>
      <!-- 新人评价 -->
      <mt-tab-container-item id='3' >
        <div class="comment-container">
            <!-- 标题 -->
            <p>———— · 新人评价 ·———— </p> 
            <!-- 新人信息开始 -->
            <div>
              <div class="comment-info">
                <!-- 头像 -->
                <van-image
                  round
                  width="2rem"
                  height="2rem"
                  src="https://img.yzcdn.cn/vant/cat.jpeg"/>
              <!-- 昵称 -->
                  <div>
                    <p>新人：A.m***</p>
                    <p>对本场婚礼的评价</p>
                  </div>
              </div>
              <div class='comment-mark'>
                      <van-row>
                      <van-col span="12">
                        对 策划师-Aliao 说
                      </van-col>
                      <van-col span="12">
                      <!-- <van-rate
                        v-model="value"
                        :size="15"
                        color="#ffd21e"
                        void-icon="star"
                        void-color="#999" /> -->
                         <span class="comments-item-head-star star5"> </span>
                        </van-col>
                      </van-row>
                      <div>
                        <p>aliao是我朋友给我力荐的策划师，跟他的交流很顺畅。他能知道我们需要什么，作为水瓶座的女生，我有一些天马行空的想法。他耐心倾听我的叙述，从我的描述中提取的关键词很准确。最终效果图一出来，我们的感觉就有了！这是一次就通过的方案，没有任何改动。我觉得实景比图纸还要美。我站在台上感觉已经进入了aliao为我们构建的梦里。我的金色婚纱在这个梦里熠熠生辉，每一个人都赞美我的婚纱绝美。但我知道，它能把它的美散发的淋漓尽致是因为有这个舞台的加持。我相信我的丈夫会一辈子记得那天我站在他身后，他转身回眸的一瞬间，眼睛里都是我第一次身着金纱最美的模样。我也永远不会忘记他那一刻的热泪。谢谢aliao</p>
                      </div>
              </div>
               
            </div>
            <!-- 新人信息开始 -->
            <!-- 评价内容开始 -->
            <div>
              <!-- 发表内容 -->
              <!-- 发表时间 -->
            </div>
            <!-- 评价内容结束 -->
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
  </section>
  <!-- 面板区域结束 -->
  <!-- 底部导航栏开始 -->
  <footer>
    <van-goods-action>
      <van-goods-action-icon  icon='chat-o' text='客服' color="#ee0a24" dot/>
       <van-goods-action-icon icon='cart-o' text='购物差' dot/>
      <van-goods-action-icon icon='star-o' text='收藏'  />
      <van-goods-action-button  color="#969799" text='加入购物车' />
      <van-goods-action-button type="danger" text='立即订购' />
    </van-goods-action>
  </footer>
  <!-- 底部导航栏结束 -->
</div>

</template>
<style scoped>
.details>:first-child{
  background:linear-gradient(to top, #fcfbfa, #fcf4f5);
  border-bottom:1px solid #e9e6e6;
  color:rgb(20, 19, 19);
  font-weight: bold;
  font-size:18px ;
  padding-top:2px
}
/* 轮播图 */
  .carouse{
    margin-top: 41px;
    width:100%;
    height:185px;
  }
   .carouse img{
      width:100%;
      height:185px;
   }
   /* 导航栏 */
.mint-navbar .mint-tab-item{
  padding: 9px 0
}
.mint-navbar .mint-tab-item.is-selected {
    border-bottom: 2px solid #d44026;
    color: #ec5114;
    background:linear-gradient(to top, #fcfbfa, #fcf4f5);
  }
.mint-navbar{
  margin-top: 1px;
}
/* 面板区 */
.details-main{
  margin-top: 4px;
  margin-bottom: 50px;
  font-size:12px;
  color: #a9a3a3;
  background: #f1ecec;
}
.detail-top,.detail-content,.detail-footer,.comment-container{
  padding: 23px 20px 2px;
  margin-bottom: 8px;
  background: white;
}
.detail-footer{margin-bottom: 5px;}
.detail-content{
  padding-top:10px
}
.details-main  .van-row{
  font-size:22px;
  color:rgb(61, 59, 59);
   margin-top:10px;
}
.detail-price>.van-col:first-child{
 color:rgb(228, 60, 30);
 font-weight: 600;
}
.van-col--8,.detail-price>.van-col:nth-child(2) {
  text-align: right;
}
.details-main .van-row  span,.details-main  .detail-time span{
  font-size:12px;
  vertical-align:middle;
  padding-left:3px
}
.van-icon::before{vertical-align:middle;}
.van-icon-eye-o::before {
    vertical-align: text-top;
}
.details-main .detail-main-from{
  display: inline-block;
  width:40px;
  height:17px;
  border:1px solid #c1baba;
  border-radius:3px;
  margin-right:6px;
  margin-top:6px;
  font-size:12px;
  text-align: center; 
  line-height:1.5;
  color:#8a8787
}
.details-main .detail-time{
  margin-top:5px;
  margin-bottom:5px;
}
.van-rate{
  vertical-align: middle;
}
.details-main  .detail-hotel{
 margin-top: 15px;
 display: flex;
 align-items: center;
}
.details-main  .detail-hotel>img{
  width:20px;
  height:20px;
  padding:3px;
}
.detail-content{
  padding-bottom: 15px;
}
.detail-content::after{
  content:'';
  clear: both;
  display: block;
}
.detail-content>p,.detail-info-nickname,.team>p{
  font-size:18px;
  color:rgb(63, 61, 61);
}
 .detail-content  img{
   width: 102px;
   height:78px;
   margin:5px 5px 5px 0px;
   border-radius: 3px;
   float: left;
 }
 .lazyImages{
   width:100%;
   height:218px;
   border-radius: 3px;
   margin-bottom:5px
 }
 /* 婚礼团队 */
 .info{
   width:94%;
   background: #f7f4f4;
   padding:10px
 }
.detail-info-avatar,.detail-item-avatar{
    position: relative;
    top: 5px;
    left: 4px;
  }
.detail-info-nickname{
    font-size: 15px;
    margin-bottom:6px;
     margin-left:10px;
     /* vertical-align: middle; */
}
.rich-content {
    padding: 5px 0;
    line-height: 1.7;
    font-size:15px;
    color:rgb(29, 28, 28)
}

.comments-more {
  text-align: center;
  padding: 5px 1px;
}
.comments-more:after {
  content: "";
  display: block;
  height: 0;
  clear: both;
}

.comments-more > span {
  display: inline-block;
  font-size: 0.85714286rem;
  border: 1px solid #232628;
  padding: 0.28571429rem 0.57142857rem;
  border-radius: 0.14285714rem;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-color: #f7f9fa;
  color :#232628;
  border-radius: 20px;
}


.team>p{
  margin-top:22px;
  margin-bottom: 18px;
}
.team .van-row>.van-col{
  width:160px;
  height:49px;
  border:1px solid rgba(0,0,0,.05);
  box-shadow: 4px 2px 6px 2px #a9a3a3;
  padding:4px;
   margin-bottom:4px;
  display: flex;
}
.team .van-row>.van-col div{
    font-size:14px;
    padding:4px 2px ;
    line-height:1.2;
}
.team .van-row>.van-col div>p+span{
  color:#8a8686;
  padding-left: 0px;
  
}
.team .van-row>.van-col div>span+span{
  padding-left:15px;
  font-weight: 600;
}
/* 报价明细 */
.details-price{
  font-size:18px;
  font-weight: 600;
  color:#302e2e;
  padding:13px 16px
}
.details-price-title{
  padding-bottom: 5px;
   padding-top: 5px;
}
.van-cell__title{
  font-size:16px
}
.price .van-cell__value {
  color:#d44026
}
/* 新人评价 */
.comment-container>p:first-child{
  font-size: 18px;
  color: #666;
  text-align: center;
  padding-top:25px;
  padding-bottom:25px
}
.comment-container{
  padding:0px 27px
}
.comment-info{
 display: flex;
 align-items: center;
}
.comment-info>p{
  margin:4px
}

.comment-info>div:nth-child(2){
  margin-left:5px;
  line-height: 18px;
}

.comment-info>div:nth-child(2)>p:nth-child(2){
    color: #979797;
    font-size: 14px;
}

.comment-mark{
  border-bottom: 3px dashed rgba(0,0,0,.1);
}

.comment-mark  .van-row{
    margin-top:30px;
    font-size: 16px;
    clear: both;
}

.comment-mark>div:nth-child(2)>p{
    font-size: 12px;
    padding-top: 16px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #666;
}

.comments-item-head-star {
  display: block;
  width: 13.285714rem;
  max-width: 13.285714rem;
  min-width: 4.28571429rem;
  height: 0.64285714rem;
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center center;
}

.comments-item-head-star.star5 {
  background-image: url("../assets/picture/star5.png");
}

</style>
<script>
import {Rate , NavBar,Lazyload,Col, Row, VanImage,ImagePreview ,Collapse, CollapseIte} from 'vant';
export default {
  data(){
    return {
      active:"1",
      imageList:[
        'https://img.izhaowo.com/img/70cfa27c-36e0-4f5c-9270-d77a90b76de8.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/70cfa27c-36e0-4f5c-9270-d77a90b76de8.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/70cfa27c-36e0-4f5c-9270-d77a90b76de8.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/b5195971-fc2d-4295-9f0a-1cf61613ff19.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/ee2b425f-537a-4046-8d87-a1fcfc1c3fdd.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
      ],
      images:[
        'https://img.izhaowo.com/img/70cfa27c-36e0-4f5c-9270-d77a90b76de8.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/b5195971-fc2d-4295-9f0a-1cf61613ff19.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
        'https://img.izhaowo.com/img/ee2b425f-537a-4046-8d87-a1fcfc1c3fdd.jpg?x-oss-process=image/resize,m_lfit,w_662,limit_0,g_center/watermark,image_5qiq5ZCR5rC05Y2wMi5wbmc_eC1vc3MtcHJvY2Vzcz1pbWFnZS9yZXNpemUsUF8xMDA,t_100,g_center&',
      ],
      messages:['#大气','#西式','#梦幻','#室内'
      ],
      value:3,
     activeNames: [''],
  

    }
  },

  methods: {
    
  }
}
</script>