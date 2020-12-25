<template>
  <div>
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="MianPage">
        <div class="index">
          <mt-header title="微微新娘" fixed class="my-header">
            <router-link to="/search" slot="right"
              ><span class="left iconfont icon-fangdajing"></span
            ></router-link>
            <span slot="left">
              <!-- 设置is-link属性后会在单元格右侧显示箭头 -->
              <van-cell
                is-link
                @click="showPopup"
                class="details_address"
                arrow-direction="down"
              >
                <span v-if="!province">全国</span>{{ province }} {{ city }}
                {{ country }}
              </van-cell>
              <van-popup
                v-model="show"
                position="top"
                :style="{ height: '50%' }"
              >
                <van-area
                  :area-list="areaList"
                  :columns-num="3"
                  ref="myArea"
                  @confirm="onConfirm"
                  @cancel="onCancel"
                  @change="onChange"
                  title="请选择婚礼举办地"
                />
              </van-popup>
            </span>
          </mt-header>

          <!-- 轮播图开始 -->
          <mt-swipe :auto="4000" class="swipe">
            <mt-swipe-item>
              <router-link to="/list">
                <img src="img/lb1.jpg" alt="" class="swipe-img" />
              </router-link>
            </mt-swipe-item>
            <mt-swipe-item>
              <router-link to="/list">
                <img src="img/lb2.jpg" alt="" class="swipe-img" />
              </router-link>
            </mt-swipe-item>
          </mt-swipe>
          <!-- 轮播图结束 -->
          <!-- 分栏一开始 -->
          <div class="nav">
            <ul>
              <li>
                <router-link :to="`/album/${Z1[0]}&${B1[0]}`" class="nav-item"
                  ><span class="color-c3 iconfont icon-zhuanji"></span
                ></router-link>
                <span>专辑</span>
              </li>
              <li>
                <router-link to="/list" class="nav-item"
                  ><span class="color-c3 iconfont icon-shipin1"></span
                ></router-link>
                <span>案例</span>
              </li>
              <li>
                <router-link :to="`/album/${Z1[1]}&${B1[1]}`" class="nav-item"
                  ><span class="color-c3 iconfont icon-huodong"></span
                ></router-link>
                <span>活动</span>
              </li>
              <li @click="kefu(info.uid)">
                <router-link to="" class="nav-item"
                  ><span
                    class="color-c3 van-icon van-icon-chat-o van-goods-action-icon__icon"
                  ></span
                ></router-link>
                <span>客服</span>
              </li>
              <!-- <li>
                <router-link to="/" class="nav-item"
                  ><span class="color-c3 iconfont icon-qiandao"></span
                ></router-link>
                <span>签到</span>
              </li> -->
            </ul>
          </div>
          <!-- 分栏一结束 -->

          <!-- 主内容区域开始-->

          <mt-navbar v-model="active" class="tabbar">
            <mt-tab-item
              class="tab-bar"
              :id="index + ''"
              v-for="(item, index) of category"
              :key="index"
              >{{ item }}</mt-tab-item
            >
          </mt-navbar>

          <!-- 住内容开始 -->

          <div class="main">
            <mt-tab-container v-model="active" swipeable>
              <mt-tab-container-item :id="active">
                <!-- 单一文章开始 -->
                <div
                  class="page"
                  v-for="(item, index) of articles"
                  :key="index"
                >
                  <!-- 图片 -->
                  <div>
                    <router-link :to="`/message/${item.id}`">
                      <img v-lazy="item.img" alt="" />
                      <p class="span4">{{ item.description }}</p>
                    </router-link>
                  </div>
                  <div class="title-bar clearfix">
                    <img class="small-photo" v-lazy="item.header_img" alt="" />
                    <span class="title">{{ item.author }}</span>
                    <span class="vip" v-if="item.vip">VIP</span>
                    <span class="xin iconfont icon-xin rf"
                      >&nbsp;{{ item.like_up }}</span
                    >
                  </div>
                </div>
                <!-- 制作人及点赞 -->
                <!-- 单一文章结束 -->
              </mt-tab-container-item>
            </mt-tab-container>
          </div>

          <!-- 主内容区域结束-->
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 底部导航栏结束 -->
    <div id="tishi">请先登录:{{ dateTime }} ,帮您转接中ing....</div>
  </div>
</template>
<style>
.site-index {
  height: 700px;
}
.foot > .tabbar {
  color: #888;
}
.foot > .mint-tabbar > .mint-tab-item.is-selected {
  color: pink;
}
.foot > .tabbar .iconfont {
  font-size: 22px;
  margin-bottom: 5px;
}
.mint-tab-item {
  padding: 3px 0;
}
.rf {
  float: right;
}
.clearfix::after {
  content: "";
  display: block;
  clear: both;
}
.index .main {
  touch-action: pan-y pinch-zoom;
}
.index .color-c3 {
  color: pink;
}
/* 设置头部 */
.index > .my-header {
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #000;
}
.index .details_address {
  color: #666;
  width: 100px;
  padding: 9px 18px;
  background-color: transparent;
}
.index > .my-header .right {
  font-weight: 900;
  font-size: 18px;
  margin-right: 10px;
}
/* 头部设置结束 */
/* 设置轮播图 */
.index > .swipe {
  margin-top: 40px;
  width: 100%;
  height: 170px;
}
.index > .swipe .swipe-img {
  width: 100%;
}
/* 轮播图设置结束 */

/* 设置分栏一 */
.index > .nav {
  margin-top: 15px;
  margin-left: 15px;
  margin-right: 15px;
}
.index > .nav > ul {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
}
.index > .nav > ul .nav-item {
  display: block;
  width: 50px;
  height: 50px;
  border: 1px solid #ccc;
  border-radius: 10px;
}
.index > .nav > ul .nav-item span {
  font-size: 26px;
  line-height: 50px;
}
.index > .nav > ul > li > span {
  display: block;
  margin-top: 5px;
  font-size: 12px;
}
/* 分栏一设置结束 */
/* 设置导航栏 */
.swipe-navbar {
  margin-top: 10px;
  width: 100%;
  box-shadow: 0px 3px 5px #ccc;
  height: 30px !important;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 2px solid pink !important;
  color: pink !important;
  margin-bottom: -1px !important;
}

.tabbar {
  width: 100%;
  padding-top: 10px;
}

.index .tabbar > .tab-bar {
  box-sizing: border-box;
  padding: 8px 0;
}
.index {
  text-align: left;
}
.index > .nav {
  text-align: center;
}
/* 设置导航栏结束 */
/* 主内容区域 */
.index > .main {
  margin-top: 5px;
  margin-bottom: 55px;
}
.index > .main .page .span4 {
  overflow: hidden;
  color: #666;
  font-size: 12px;
  white-space: nowrap;
  text-overflow: ellipsis;
  margin: 5px 5px;
}
.index > .main .page {
  margin-top: 7px;
  margin-bottom: 7px;
  margin-left: 3%;
  width: 45%;
  height: 240px;
  float: left;
  border: 1px solid #ddd;
  border-radius: 5px;
}
.index > .main .page > div img {
  width: 100%;
  height: 190px;
}
.index > .main .page > .title-bar {
  margin-top: 8px;
  margin-bottom: 6px;
}
.index > .main .page > .title-bar > .small-photo {
  margin-left: 5px;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  vertical-align: middle;
}
.index > .main .page > .title-bar > .title {
  margin-left: 3px;
  color: #888;
  font-size: 12px;
  line-height: 23px;
}
.index > .main .page > .title-bar > .vip {
  display: inline-block;
  transform: scale(0.6);
  font-size: 12px;
  padding: 3px 7px;
  margin-left: 8px;
  color: #c3ac66;
  background-color: #000;
  border-radius: 10px;
}
.index > .main .page > .title-bar > .xin {
  margin-right: 10px;
  font-size: 12px;
  line-height: 25px;
  position: sticky;
}
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
</style>
<script>
import areaList from "../assets/area.js";
import { Toast } from "vant";
import { mapState } from "vuex";
export default {
  data() {
    return {
      active: "0",
      category: ["推荐", "时尚星闻", "主题婚礼", "婚纱礼服"],
      articles: [],
      Z1: [1, 2],
      B1: ["专辑", "活动"],
      height: "",
      show: false,
      province: "",
      city: "",
      country: "",
      selected: "MianPage",
      areaList,
      dateTime: 3,
    };
  },
  methods: {
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
    // 客服
    kefu(kf) {
      this.uid = kf;
      if (this.$store.state.isLogined !== 1) {
        this.packaging();
      } else {
        this.$router.push("/service");
      }
    },
    load() {
      /* 获取主内容的信息 */
      this.axios
        .get("/index/art", {
          params: {
            id: this.active,
          },
        })
        .then((res) => {
          this.articles = res.data.results;
        });
    },
    //点击取消按钮时触发
    onCancel() {
      this.show = false;
      //通过 ref 可以获取到 Area 实例并调用实例方法
      //reset()根据 code 重置所有选项，若不传 code，则重置到第一项
      this.$refs.myArea.reset();
    },
    //点击右上方确认按钮时触发
    onConfirm(val) {
      (this.province = val[0].name),
        (this.city = val[1].name),
        (this.country = val[2].name);
      this.show = false;
    },
    //选项改变时触发
    onChange(picker) {
      let val = picker.getValues();
      return val;
    },
    showPopup() {
      //点击表单时下方的选项框显示
      this.show = true;
      //this.overlay = true;
    },
  },
  mounted() {
    this.load();
  },
  watch: {
    active() {
      this.load();
    },
  },
  computed: {
    ...mapState(["isLogined", "info"]),
  },
};
</script>