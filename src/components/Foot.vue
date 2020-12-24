<template>
    <div class="foot">
        <mt-tabbar fixed v-model="selected" class="tabbar">
            <mt-tab-item id="MianPage">
                <div class="iconfont icon-shouye"></div>
                <span>首页</span>
            </mt-tab-item>
            <mt-tab-item id="Case">
                <div class="iconfont icon-xingqiu2"></div>
                <span>案例</span>
            </mt-tab-item>
            <mt-tab-item id="Mine">
                <div class="iconfont icon-wo"></div>
                <span>我的</span>
            </mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<style>
    .foot>.tabbar{
        color: #888;
    }
    .mint-tabbar>.mint-tab-item.is-selected{
        color: pink;
    }
     .foot>.tabbar .iconfont{
         font-size: 22px;
         margin-bottom: 5px;
     }
     .mint-tab-item {
         padding: 3px 0;
     }
</style>
<script>
export default {
    data(){
        return{
            selected:'MianPage'
        }
    },
    watch:{
        selected(){
            if(this.selected=='MianPage') {
                this.$router.push('/');
                this.selected='MianPage';
            }else if(this.selected=='Case'){
                this.$router.push('/list');
                this.selected='Case';
            }else if(this.selected=='Mine'){
                this.$router.push('/site');
                this.selected='Mine';
            }
        }
    }
}
</script>