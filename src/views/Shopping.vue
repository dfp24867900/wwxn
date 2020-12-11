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
        <!-- 右下加减按钮 -->
        <div>
          <button>-</button>
          <input type="text" value="3">
          <button>+</button>
        </div>
      </div>
    </div> 
    <!-- 页尾 -->
    <div class="shopfoot">
      <p><input type="checkbox"/> 全选</p>
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
    height: 60%;
    background-color: #fff;
    position: absolute;
    top: 2%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:first-child{
    width: 80%;
    font-weight: 600;
    position: absolute;
    top: 5%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:nth-child(2){
    width: 96%;
    font-size: 12px;
    position: absolute;
    top: 30%;
    left: 2%;
  }
  .shop>div:last-child>div:first-child>p:last-child{
    width: 60%;
    font-weight: 600;
    position: absolute;
    left: 38%;
    top: 70%;
  }
  .shop>div:last-child>div:first-child>p:last-child>span{
    color: #900;
  }
  .shop>div:last-child>div:last-child{
    width: 50%;
    height: 35%;
    position: absolute;
    top: 60%;
    left: 48%;
  }
  .shop>div:last-child>div:last-child>button{
    display: inline-block;
    width: 32%;
    height: 80%;
    border-radius: 5px;
    border: 1px solid #ddd;
    background-color: transparent;
    position: absolute;
    top: 20%;
    left: 0;
  }
  .shop>div:last-child>div:last-child>button:first-child{
    left: 64%;
  }
  .shop>div:last-child>div:last-child>input{
    display: inline-block;
    width: 25%;
    height: 70%;
    border: 0;
    padding: 3px;
    position: absolute;
    top: 20%;
    left: 32%;

  }
  .shopfoot{
    width: 100%;
    height: 6%;
    background-color: #f4f4f4;
    position: fixed;
    top: 94%;
  }
  .shopfoot>p:first-child{
    font-weight: 600;
    width: 20%;
    height: 80%;
    position: absolute;
    top: 30%;
    left:2%;
  }
  .shopfoot>p:nth-child(2){
    width: 50%;
    height: 10%;
    line-height: 80%;
    position: absolute;
    left: 40%;
    top: 40%;
  }
  .shopfoot>p:nth-child(2)>span{
    color: #900;
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