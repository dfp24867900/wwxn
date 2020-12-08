<template>
<!-- 定位 -->
  <div class="area">
    <mt-header title="微微新娘"  fixed>
       <span slot="left">
         <!-- 设置is-link属性后会在单元格右侧显示箭头 -->
         <van-cell is-link @click="showPopup" class="details_address" icon="location-o" arrow-direction="down">
           <span v-if="!province">选择地址:</span>{{province}} {{city}}  {{country}}
         </van-cell>
         <van-popup v-model="show" position="top" :style="{ height: '50%' }">
         <van-area :area-list="areaList" :columns-num="3" ref="myArea"
            @confirm="onConfirm" @cancel="onCancel"  @change="onChange" title="请选择婚礼举办地"  />  
        </van-popup> 
      </span> 
      
    </mt-header>
  </div>
</template>
<script>
import areaList from '../assets/area.js';
import { Toast } from 'vant';
export default {
  data(){
    return{
      height:"",
      show:false,
      province:"",
      city:"",
      country:"",
      areaList
    }
  },
  methods:{
  //点击取消按钮时触发
			onCancel() {
        this.show = false;
        //通过 ref 可以获取到 Area 实例并调用实例方法
        //reset()根据 code 重置所有选项，若不传 code，则重置到第一项
        this.$refs.myArea.reset()
        },
  //点击右上方确认按钮时触发
		 onConfirm(val) {
        this.province= val[0].name,
        this.city=val[1].name,
        this.country=val[2].name;
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
    }
  }
}
</script>
<style scoped>
.area>:first-child{
  background-color:white;
  color:pink;
  font-size: 24px;
  font-weight: bold;
}
.details_address{
  color:#666;
  width: 100px;
}
</style>