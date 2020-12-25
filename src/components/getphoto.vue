<template>
    <div class="getPhone">
        <input accept="image/*" type="file" @change="acceptImage"/>
        <van-popup v-model="showload" :close-on-click-overlay="false">
            <van-loading class="loadimg" type="spinner" ></van-loading>
        </van-popup>
    </div>
</template>
<script>
import { Dialog } from 'vant';
export default {
    name:"getPhoto",
    props:["index2"],
    data(){
        return{
            showload:false
        };
    },
    methods:{
        acceptImage(){
            let file = event.target.files[0];
            if(file.size >= 6291456) {
            // console.log("超过6MB数据大小，请重新选择上传");
                Dialog.alert({
                    title: '提示',
                    message: '超过6MB数据大小，请重新选择上传'
                }).then(() => {
                    // on close
                });
            }else{
                this.showload = true;
                let form = new FormData(); 
                form.append('file',file,file.name);
                this.$axios.post("请求地址",form,{
                    headers:{'Content-Type':'multipart/form-data'}
                }).then(response => {
                    this.showload = false;
                    let data = {
                        url:response.data.url,
                        index:this.index2 //用index来区分是哪个模块调用的，进而去做不同的操作
                    };
                    this.$emit("imgsrc",data);
                }).catch(error => {
                    Dialog.alert({
                        title: '提示',
                        message: '上传失败'
                    }).then(() => {
                        // on close
                    });
                })
            }
        }
    }
}
</script>
<style scoped>
    .getPhone{
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }
    input{
        width: 100%;
        height: 100%;
        position: absolute;
        opacity: 0;
        z-index: 999;
        top: 0;
        left: 0;
    }
    .loadimg{
        padding: 10px;
        border-radius: 5px;
    }
</style>
