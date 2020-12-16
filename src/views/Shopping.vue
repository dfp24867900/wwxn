<template>
<div>
    <!-- 页面头部 -->
    <mt-header
      title="我的订单"
      class="shop_header"
    >
      <router-link to="/site" slot="left" >
        <mt-button icon='back'></mt-button>
      </router-link> 
    </mt-header>
    <!-- 商品模块 -->
    <div class="shop">
      <!-- 左侧照片 -->
      <div>
        <img src="../assets/image/site/collect/collect_sur.jpg" alt="">
      </div>
      <!-- 右侧文字描述 -->
      <div>
        <!-- 右上文字描述 -->
        <div>
          <!-- 标题 -->
          <p>简约+质感泰式</p>
          <!-- 描述 -->
          <p>这是一条假的描述语段,仅仅是占着位置而已</p>
          <!-- 单价 -->
          <p>
            单价:<span>¥23850.00</span>
          </p> 
        </div>
      </div>
    </div> 
    <!-- 页尾 -->
    <div class="shopfoot">
      <p>
        合计:
        <span>¥23850.00</span>
      </p>
      <button>结算</button>  
    </div>
</div>  
</template>


<style>
  .shop_header{
    background-color: #ffffff!important;
    color: #333 !important;
    font-family:"Microsoft Yahei";
    font-size: 16px !important;
    border-bottom: 1px solid #ccc;
  }
  .shop{
    width: 98%;
    height: 120px;
    color: #333;
    font-size: 14px;    
    font-family:"Microsoft Yahei";
    margin-left: 1%;
    position: relative;
  }
  .shop>div:first-child{
    width: 45%;
    height: 96%;
    overflow: hidden;
    position: absolute;
    left: 1%;
    top: 2%;
  }
  .shop>div:first-child>img{
    width: 100%;
    height: 100%;
    border-radius: 5px;
  }
  .shop>div:last-child{
    width: 53%;
    height: 96%;
    position: absolute;
    left: 47%;
    top: 2%;
  }
  .shop>div:last-child>div:first-child{
    width: 96%;
    height: 98%;
    background-color: #fff;
    position: absolute;
    top: 2%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:first-child{
    width: 80%;
    font-weight: 600;
    font-size: 20px;
    position: absolute;
    top: 5%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:nth-child(2){
    width: 96%;
    font-size: 16px;
    font-weight: 500;
    color: #393939;
    position: absolute;
    top: 30%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:last-child{
    width: 90%;
    font-weight: 700;
    font-size: 16px;
    position: absolute;
    left: 10%;
    top: 70%;
  }
  .shop>div:last-child>div:first-child>p:last-child>span{
    color: #900;
    font-style: italic;
    font-size: 22px;
  }
  .shopfoot{
    width: 100%;
    height: 6%;
    background-color: #f4f4f4;
    position: fixed;
    top: 94%;
  }
  .shopfoot>p:first-child{
    width: 50%;
    height: 10%;
    line-height: 80%;
    position: absolute;
    left: 5%;
    top: 40%;
  }
  .shopfoot>p:first-child>span{
    color: #900;
    font-weight: 600;
    font-style: italic;
  }
  .shopfoot>button{
    width: 25%;
    height: 100%;
    background-color: #ff93a0;
    color: #f5f5f5;
    border: 0;
    border-radius: 5px;
    position: absolute;
    top: 10%;
    left: 75%;
  }
</style>

<script>
export default {
   data() {
    return {
      checked: true,
    };
  },
}
</script>