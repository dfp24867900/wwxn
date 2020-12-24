<template>
  <div id="gold">
    <!-- 页头 -->
    <mt-header title="我的钱包" class="gold_header">
      <router-link to="/site" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 上方区域 -->
    <div id="goldup">
      <!-- 余额部分 -->
      <p>¥<span>10000.00</span></p>
      <!-- 文字描述 -->
      <p>账户余额</p>
      <!-- 提现按钮 -->
      <p>
        <button @click="pay">预约支付</button>
      </p>
      <!-- 资金明细 -->
      <p>
        <router-link to=""> 资金明细 > </router-link>
      </p>
      <!-- 步骤 -->
      <div>
        <div>
          <p>1</p>
          填写提现银行
        </div>
        <div>
          <p>2</p>
          等待银行操作
        </div>
        <div>
          <p>3</p>
          提示提现成功
        </div>
      </div>
    </div>
    <!-- 下方区域 -->
    <div id="golddown">
      <p>最新提现状态</p>
      <div>
        <!-- 提现记录区域 -->
        <p>暂无提现记录</p>
      </div>
    </div>
  </div>
</template>
<script>
import { Toast } from "vant";
export default {
  methods: {
    pay() {
      this.$messagebox
        .confirm("是否确定支付定金")
        .then(() => {
          Toast("支付成功");
          this.$router.push("/list");
        })
        .catch((error) => {});
    },
  },
};
</script>
<style >
.gold_header {
  background: linear-gradient(to top, #fcfbfa, #fcf4f5);
  color: #333 !important;
  font-family: "Microsoft Yahei";
  font-size: 16px !important;
  border-bottom: 1px solid #ccc;
}
#goldup {
  width: 100%;
  height: 260px;
  position: relative;
}
#goldup > p {
  width: 100%;
  height: 20%;
  position: absolute;
  text-align: center;
}
#goldup > p:first-child {
  position: absolute;
  top: 15%;
}
#goldup > p:first-child > span {
  font-size: 30px;
}
#goldup > p:nth-child(2) {
  top: 30%;
  color: #aaa;
}
#goldup > p:nth-child(3) {
  top: 47%;
  color: #999;
}
#goldup > p:nth-child(3) > button {
  width: 80%;
  height: 80%;
  border: 0;
}
#goldup > p:nth-child(4) {
  top: 66%;
}
#goldup > p:nth-child(4) > a {
  color: #333;
  font-size: 14px;
}
#goldup > div {
  width: 100%;
  height: 20%;
  font-size: 12px;
  line-height: 20px;
  text-align: center;
  position: absolute;
  left: 0%;
  top: 85%;
  display: flex;
  justify-content: space-around;
}
#goldup > div p {
  width: 20px;
  height: 20px;
  line-height: 20px;
  margin: 0 auto;
  border: 1px solid #900;
  border-radius: 50%;
}
#golddown {
  width: 90%;
  height: 300px;
  margin-top: 10px;
  border-top: 1px solid #ccc;
  padding: 10px;
  position: relative;
}
#golddown > p {
  width: 60%;
  font-weight: 600;
  position: absolute;
  top: 10px;
  left: 5%;
}
#golddown > div {
  width: 90%;
  height: 50%;
  background-color: #999;
  border-radius: 5px;
  text-align: center;
  position: absolute;
  top: 20%;
  left: 5%;
}
#golddown > div > p {
  width: 50%;
  text-align: center;
  position: absolute;
  top: 45%;
  left: 25%;
  color: rgb(85, 81, 81);
}
</style>