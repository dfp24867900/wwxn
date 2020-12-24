<template>
  <div class="details">
    <!-- 头部导航栏开始 -->
    <mt-header title="薇薇新娘" fixed>
      <router-link to="/list" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/search" slot="right"
        ><mt-button icon="search"></mt-button
      ></router-link>
    </mt-header>
    <!-- 头部导航栏结束 -->
    <!-- 轮播图开始 -->
    <div>
      <van-swipe :autoplay="3000" class="carouse">
        <van-swipe-item v-for="(img, index) of images" :key="index">
          <img :src="`/${img}`" />
        </van-swipe-item>
      </van-swipe>
    </div>
    <!-- 轮播图结束-->
    <!-- 顶部选项卡开始 -->
    <nav>
      <van-sticky :offset-top="40">
        <mt-navbar v-model="active">
          <mt-tab-item
            :id="item.id.toString()"
            v-for="(item, index) of category"
            :key="index"
          >
            {{ item.category_name }}
          </mt-tab-item>
        </mt-navbar>
      </van-sticky>
    </nav>
    <!-- 顶部选项卡结束 -->
    <!-- 面板区域开始 -->
    <section class="details-main">
      <mt-tab-container swipeable v-model="active">
        <!-- 商品详情 -->
        <mt-tab-container-item id="1">
          <div class="detail-top">
            <!--副标题  -->
            <van-row>
              <van-col span="14">{{ briMsg.title }}</van-col>
              <van-col span="8" offset="2">
                <van-icon name="eye-o" size="8" />
                <span>{{ briMsg.visits }}人浏览</span>
              </van-col>
            </van-row>
            <!-- 类型 -->
            <div
              class="detail-main-from"
              v-for="(msge, index) in messages"
              :key="index"
            >
              <span>#{{ msge }}</span>
            </div>
            <!-- 日期 -->
            <div class="detail-time">
              <van-icon name="calendar-o" size="15" />
              <span>{{ briMsg.grounding }}</span>
            </div>
            <!-- 价格明细 -->
            <div>
              <van-row class="detail-price">
                <van-col span="12"
                  >¥{{ parseInt(briMsg.price).toFixed(2) }}</van-col
                >
                <van-col span="12">
                  <van-rate v-model="value" icon="like" void-icon="like-o" />
                </van-col>
              </van-row>
            </div>
            <!-- 酒店 -->
            <div class="detail-hotel">
              <img src="../assets/image/icon/jiudian.png" />
              <p>{{ briMsg.case_address }}</p>
            </div>
          </div>
          <!-- 设计效果图 -->
          <div class="detail-content">
            <p>设计效果图</p>
            <viewer :images="effectPic">
              <img
                v-for="(src, index) in effectPic"
                :src="`/${src}`"
                :key="index"
              />
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
                :src="briMsg.photo"
                class="detail-item-avatar"
              />
              <span class="detail-info-nickname"
                >策划师 [{{ briMsg.director }}] :</span
              >
              <!-- 内容简述开始 -->
              <div class="rich-content">
                <p>{{ briMsg.descr }}</p>
              </div>
              <div>
                <!-- 图片详图开始 -->
                <img
                  v-for="(img, index) of imageList"
                  :key="index"
                  v-lazy="`/${img}`"
                  class="lazyImages"
                />
                <!-- 图片详图结束 -->
              </div>

              <!--内容简述开始 结束 -->
            </div>
            <div class="team">
              <p>婚礼团队:</p>
              <van-row type="flex" justify="space-between">
                <van-col
                  span="9"
                  v-for="(team, index) of weddingteam"
                  :key="index"
                >
                  <van-image
                    round
                    width="2rem"
                    height="2rem"
                    lazy-load
                    :src="require(`../assets/image/avatar${team.portrait}`)"
                  />
                  <div>
                    <p>{{ team.tname }}</p>
                    <span>{{ team.job }}</span>
                    <span>¥{{ team.emolument }}</span>
                  </div>
                </van-col>
              </van-row>
            </div>
          </div>
        </mt-tab-container-item>
        <!-- 价格明细 -->
        <mt-tab-container-item id="2">
          <div>
            <div class="details-price-top">
                          <van-icon name="gem" />             <span
                >执行人员</span
              >
                        
            </div>
            <div>
              <van-collapse v-model="activeNames">
                <van-collapse-item
                  v-for="(quotation, index) of quotations"
                  :key="index"
                  :name="index"
                  :title="`${quotation.item}`"
                >
                  <van-cell-group>
                    <div class="details-price-content">
                                          
                      <div>
                                              <span>内容:</span>
                                              <span>{{
                          quotation.serContent
                        }}</span>
                                            
                      </div>
                                          
                      <div>
                                              <span>水平:</span>
                                              <span>{{
                          quotation.servicelevel
                        }}</span>
                                            
                      </div>
                                          
                      <div>
                                              <span>单价:</span>
                                              <span>{{
                          quotation.univalence
                        }}</span>
                                            
                      </div>
                                          
                      <div>
                                              <span>数量:</span>
                                              <span>{{
                          quotation.amount
                        }}</span>
                                            
                      </div>
                                          
                      <div>
                                              <span>单位:</span>
                                              <span>{{ quotation.unit }}</span>
                                            
                      </div>
                                          
                      <div>
                                              <span>总价:</span>
                                              <span>{{
                          quotation.univalence * quotation.amount
                        }}</span>
                                            
                      </div>
                                        
                    </div>
                  </van-cell-group>
                </van-collapse-item>
              </van-collapse>
            </div>
          </div>
        </mt-tab-container-item>
        <!-- 新人评价 -->
        <mt-tab-container-item id="3">
          <div class="comment-container" v-if="comments.length > 0">
            <!-- 标题 -->
            <p>———— · 新人评价 ·————</p>
            <!-- 新人信息开始 -->
            <div v-for="(comment, index) of comments" :key="index">
              <div class="comment-info">
                <!-- 头像 -->
                <van-image
                  round
                  width="2rem"
                  height="2rem"
                  lazy-load
                  :src="require(`../assets/image/avatar${comment.usericon}`)"
                />

                <!-- 昵称 -->
                <div>
                  <p>新人:{{ comment.mName }}</p>
                  <p>对本场婚礼的评价</p>
                </div>
              </div>
              <div class="comment-mark">
                <van-row>
                  <van-col span="12"> 对 {{ comment.staff }} 说 </van-col>
                  <van-col span="12">
                    <span class="comments-item-head-star star5"> </span>
                  </van-col>
                </van-row>
                <div>
                  <p>{{ comment.content }}</p>
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
      <van-goods-action v-show="isShow">
        <van-goods-action-icon
          icon="chat-o"
          text="客服"
          color="#ee0a24"
           @click="kefu(info.uid)"
          dot
        />
        <van-goods-action-icon
          icon="gift-o"
          text="收藏"
          color="#ee0a24"
          to=""
          @click="skip1(info.uid)"
          dot
        />
        <van-goods-action-icon
          icon="balance-o"
          text="订单区"
          color="#ee0a24"
          to=""
          @click="skip(info.uid)"
          dot
        />
        <van-goods-action-button
          color="#969799"
          text="加入收藏"
          @click="addtofavorites(info.uid)"
        />
        <van-goods-action-button
          type="danger"
          text="立即订购"
          @click="addtoshop(info.uid)"
        />
      </van-goods-action>
    </footer>
    <!-- 底部导航栏结束 -->
    <div id="tishi">请先登录:{{ dateTime }} ,帮您转接中ing....</div>
  </div>
</template>
<style scoped>
#tishi {
  width: 100%;
  color: #fff;
  font-size: 24px;
  position: fixed;
  top: 40px;
  line-height: 400px;
  height: 100%;
  background: rgba(0, 0, 0, 0.3);
  text-align: center;
  display: none;
}

.details > :first-child {
  background-image: -moz-linear-gradient(bottom, #fcfbfa, #fcf4f5);
  background-image: -webkit-linear-gradient(bottom, #fcfbfa, #fcf4f5);
  background-image: -o-linear-gradient(bottom, #fcfbfa, #fcf4f5);
  background-image: -ms-linear-gradient(bottom, #fcfbfa, #fcf4f5);
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  border-bottom: 1px solid #e9e6e6;
  color: rgb(20, 19, 19);
  font-weight: bold;
  font-size: 18px;
  padding-top: 2px;
}
/* 轮播图 */
.carouse {
  margin-top: 41px;
  width: 100%;
  height: 185px;
}
.carouse img {
  width: 100%;
  height: 185px;
}
/* 导航栏 */
.mint-navbar .mint-tab-item {
  padding: 9px 0;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 2px solid #d44026;
  color: #ec5114;
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
}
.mint-navbar {
  margin-top: 1px;
}
/* 面板区 */
.details-main {
  margin-top: 4px;
  margin-bottom: 50px;
  font-size: 12px;
  color: #a9a3a3;
  background: #f1ecec;
}
.detail-top,
.detail-content,
.detail-footer,
.comment-container {
  padding: 23px 20px 2px;
  margin-bottom: 8px;
  background: white;
}
.detail-footer {
  margin-bottom: 5px;
}
.detail-content {
  padding-top: 10px;
}
.details-main .van-row {
  font-size: 22px;
  color: rgb(61, 59, 59);
  margin-top: 10px;
}
.detail-price > .van-col:first-child {
  color: rgb(228, 60, 30);
  font-weight: 600;
}
.van-col--8,
.detail-price > .van-col:nth-child(2) {
  text-align: right;
}
.details-main .van-row span,
.details-main .detail-time span {
  font-size: 12px;
  vertical-align: middle;
  padding-left: 3px;
}
.van-icon::before {
  vertical-align: middle;
}
.van-icon-eye-o::before {
  vertical-align: text-top;
}
.details-main .detail-main-from {
  display: inline-block;
  width: 53px;
  height: 17px;
  border: 1px solid #c1baba;
  border-radius: 3px;
  margin-right: 6px;
  margin-top: 6px;
  font-size: 12px;
  text-align: center;
  line-height: 1.5;
  color: #8a8787;
}
.details-main .detail-time {
  margin-top: 5px;
  margin-bottom: 5px;
}
.van-rate {
  vertical-align: middle;
}
.details-main .detail-hotel {
  margin-top: 15px;
  display: flex;
  align-items: center;
}
.details-main .detail-hotel > img {
  width: 20px;
  height: 20px;
  padding: 3px;
}
.detail-content {
  padding-bottom: 15px;
}
.detail-content::after {
  content: "";
  clear: both;
  display: block;
}
.detail-content > p,
.detail-info-nickname,
.team > p {
  font-size: 18px;
  color: rgb(63, 61, 61);
}
.detail-content img {
  width: 97px;
  height: 78px;
  margin: 5px 2px 0px 0px;
  border-radius: 3px;
  float: left;
}
.lazyImages {
  width: 100%;
  border-radius: 3px;
  margin-bottom: 5px;
}
/* 婚礼团队 */
.info {
  width: 94%;
  background: #f7f4f4;
  padding: 10px;
}
.detail-info-avatar,
.detail-item-avatar {
  position: relative;
  top: 5px;
  left: 4px;
}
.detail-info-nickname {
  font-size: 15px;
  margin-bottom: 6px;
  margin-left: 10px;
  /* vertical-align: middle; */
}
.rich-content {
  padding: 5px 0;
  line-height: 1.7;
  font-size: 15px;
  color: rgb(29, 28, 28);
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
  color: #232628;
  border-radius: 20px;
}

.team > p {
  margin-top: 22px;
  margin-bottom: 18px;
}
.team .van-row > .van-col {
  width: 160px;
  height: 49px;
  border: 1px solid rgba(0, 0, 0, 0.05);
  box-shadow: 4px 2px 6px 2px #a9a3a3;
  padding: 4px;
  margin-bottom: 4px;
  display: flex;
}
.team .van-row > .van-col div {
  font-size: 14px;
  padding: 4px 2px;
  line-height: 1.2;
}
.team .van-row > .van-col div > p + span {
  color: #8a8686;
  padding-left: 0px;
}
.team .van-row > .van-col div > span + span {
  padding-left: 15px;
  font-weight: 600;
}
/* 报价明细 */
.details-price-top {
  margin: 17px 12px;
  padding-left: 117px;
  font-size: 24px;
  color: #666;
  text-shadow: 0px 1px 9px #e23314;
  animation: heartBeat 2.5s infinite;
}
.details-price-content span {
  line-height: 2.5;
  padding-left: 20px;
}
/* 新人评价 */
.comment-container > p:first-child {
  font-size: 18px;
  color: #666;
  text-align: center;
  padding-top: 25px;
  padding-bottom: 25px;
}
.comment-container {
  padding: 0px 27px;
}
.comment-info {
  display: flex;
  align-items: center;
  margin-top: 12px;
}
.comment-info > p {
  margin: 4px;
}

.comment-info > div:nth-child(2) {
  margin-left: 5px;
  line-height: 18px;
}

.comment-info > div:nth-child(2) > p:nth-child(2) {
  color: #979797;
  font-size: 14px;
}

.comment-mark {
  border-bottom: 3px dashed rgba(0, 0, 0, 0.1);
}

.comment-mark .van-row {
  margin-top: 30px;
  font-size: 16px;
  clear: both;
}

.comment-mark > div:nth-child(2) > p {
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
import {
  Rate,
  NavBar,
  Lazyload,
  Col,
  Row,
  VanImage,
  ImagePreview,
  Collapse,
  CollapseIte,
  Toast,
} from "vant";
import { mapState } from "vuex";
import { mapMutations } from "vuex";
export default {
  computed: {
    ...mapState(["isLogined", "info"]),
  },
  data() {
    return {
      active: "1",
      imageList: [],
      images: [],
      effectPic: [],
      value: 3,
      activeNames: [""],
      // 存储请求获取的分类数据,数组类型
      category: [],
      briMsg: {},
      comments: [],
      messages: [],
      weddingteam: [],
      quotations: [],
      isShow: true,
      // show:false,
      sum: 0,
      dateTime: 3,
      uid: "",
    };
  },

  methods: {
    // 封装
    packaging() {
      tishi.style.display = "block";
      var time = setInterval(() => {
        if (this.dateTime <= 0) {
          this.$router.push("/login");
          clearInterval(time);
        } else {
          this.dateTime -= 1;
        }
      }, 1000);
    },
    // 收藏

    skip1(d) {
      this.uid = d;
      if (this.$store.state.isLogined !== 1) {
        this.packaging();
      } else {
        this.$router.push(`/sitecollect/${this.uid}`);
      }
    },

    // 预定跳转
    skip(c) {
      this.uid = c;
      if (this.$store.state.isLogined !== 1) {
        this.packaging();
      } else {
        this.$router.push(`/siteshopping/${this.uid}`);
      }
    },
    // 立即预定
    addtoshop(b) {
      this.uid = b;
      if (this.$store.state.isLogined == 1) {
        //获取地址栏中的参数
        let id = this.$route.params.id;
        // console.log(this.$route.params.id)
        this.axios
          .get("/details/shop?", {
            params: {
              id: id,
              uid: this.uid,
              //  uid:urid
            },
          })
          .then((res) => {
            let cart = res.data;
            if (cart.code == 1) {
              Toast(cart.message);
            } else {
              Toast(cart.message);
            }
          });
      } else {
        this.packaging();
      }
    },

    // 添加收藏
    addtofavorites(a) {
      this.uid = a;
      if (this.$store.state.isLogined == 1) {
        //获取地址栏中的参数
        let id = this.$route.params.id;
        // console.log(this.$route.params.id)
        this.axios
          .get("/details/collection?", {
            params: {
              id: id,
              uid: this.uid,
              //  uid:urid
            },
          })
          .then((res) => {
            let cart = res.data;
            if (cart.code == 1) {
              Toast(cart.message);
            } else {
              Toast(cart.message);
            }
          });
      } else {
        this.packaging();
      }
    },
    // 客服
    kefu(kf){
      this.uid = kf;
      if (this.$store.state.isLogined !== 1) {
        this.packaging();
      } else {
        this.$router.push(`/service`);
      }
    }
  },

  // 向后台发送请求
  mounted() {
    // 发送HTTP请求以获取服务器详情页导航分类
    this.axios.get("/details/category").then((res) => {
      // 获取服务器返回的结果；
      let results = res.data.results;
      // 将服务器返回结果存储到category变量中
      this.category = results;
    });

    // 获取详情信息
    // 获取地址栏的参数
    let id = this.$route.params.id;
    // console.log(id)
    this.axios
      .get("/details/information", {
        params: {
          id: id,
        },
      })
      .then((res) => {
        // 获取服务器返回的结果；
        this.briMsg = res.data.results;
        this.messages = res.data.results.manner.split("&");
        // 轮播图
        this.images = res.data.results.carousel.split("&");
        // 设计效果图
        this.effectPic = res.data.results.effectPic.split("&");
        //   this.images = require(images)
        // 详情图
        this.imageList = res.data.results.mPhoto.split("&");
        // 策划师头像
        this.briMsg.photo = require("../assets/" + res.data.results.photo);
      });
    // 获取团队信息
    let tid = this.$route.params.id;
    this.axios
      .get("/details/team", {
        params: {
          tid: id,
        },
      })
      .then((res) => {
        this.weddingteam = res.data.results;
        console.log(res.data.results);
      });

    //获取价格明细表
    let qid = this.$route.params.id;
    this.axios
      .get("/details/quotations", {
        params: {
          qid: id,
        },
      })
      .then((res) => {
        this.quotations = res.data.results;
        // console.log(this.quotations)
      });
    // 获取新人评论信息
    let cid = this.$route.params.id;
    this.axios
      .get("/details/comment", {
        params: {
          cid: id,
        },
      })
      .then((res) => {
        this.comments = res.data.results;
      });
  },
};
</script>