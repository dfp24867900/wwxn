<template>
    <div class="message">
        <!-- 头部 -->
        <mt-header title="专辑"  fixed class="my-header">
            <router-link to="/" slot="left" >
                <mt-button icon="back"></mt-button>
            </router-link>
            <router-link to="/" slot="left" >
                <img src="" alt="">
                <span></span>
                <span></span>
            </router-link>
        </mt-header>
        <!-- 主内容 -->
        <div class="main">
            <div><img class="img" src="/img/message-top.png" alt=""></div>
            <p class="span1">一份承诺，十足用心</p>
            <div>
                <img class="img" :src="`/${msgImgArr[0]}`"  alt="" v-if="msgImgArr[0]">
                <img class="img" src="/img/Mg-b.jpg" alt="" v-else>
            </div>
            <p class="span2">王祖蓝和李亚男，在大家眼里一向是一对很有特点的夫妻。都说爱人间性格会相似或互补，二人大概属于后者。多才多艺的王祖蓝在大众面前总是一副嘻嘻哈哈的样子，但假如没有一个聪明又笃定的头脑，绝对扮不出这样轻巧玲珑的样子。落落大方的李亚男总是文雅又得体，打心眼儿里佩服丈夫的才华。这一冷一热，一动一静，就勾勒出了两个人幸福婚姻的模样。</p>
            <div>
                <img class="img" src="/img/message-middle.png" alt="">
                <img class="img" :src="`/${msgImgArr[1]}`" alt="" v-if="msgImgArr[0]">
                <img class="img" src="/img/Mg-b.jpg" alt="" v-else>
            </div>
            <p class="span2">共同养育后代，是继婚姻之后的第二个重大人生决定。有了孩子以后，王祖蓝说感觉最大的变化就是“腰疼咯”，虽然抱着宝宝非常开心，但是女儿一天天长大，抱起来也越来越吃力。爸爸有时候在外面工作，能轻松很多，而李亚男却每一天都要抱抱孩子，非常的不容易。照顾孩子是一件幸福又辛苦的事情，重担总是更多地落在妈妈的身上。</p>
            
        </div>
    </div>
</template>
<style>
    .message>.main{
        margin-top: 40px;
    }
    .message>.my-header{
        background: linear-gradient(to top, #fcfbfa, #fcf4f5);
        color: pink !important;
        
    }
    .message .span1{
        text-align: center;
        color: pink;
        font-size: 14px;
        margin: 5px 0;
    }
    .message .img{
        width: 100%;
    }
    .message .span2{
        margin-top: 8px;
        color: #999;
        font-size: 14px;
        padding: 0 10px;
        line-height: 28px;
        
    }
</style>
<script>
export default {
    data(){
        return{
            msgImgArr:[]
        }
    },
    mounted(){
        //获取主页传递的参数
        let id = this.$route.params.id;
        this.axios.get('/index/msg',{
            params:{
                id:id 
            }
        }).then(res=>{
            this.msgImgArr.push(res.data.result.imgOne);
            this.msgImgArr.push(res.data.result.imgTwo);
        })
    }
}
</script>