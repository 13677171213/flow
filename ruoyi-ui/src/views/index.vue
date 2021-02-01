<template lang="html">

 <el-container>
  <el-aside style="width:70%;height:850px;">
   <div style="width:100%;height:800px;">
     <div id="container" style="width: 100%;height: 840px"></div>
   </div>
  </el-aside>
  <el-container>
    <!-- <el-header>
      <div id="weather-v2-plugin-standard"></div>
      </el-header> -->
    <el-main>Main</el-main>
  </el-container>
</el-container>
</template>
  
<script>
import { AMapManager, lazyAMapApiLoaderInstance } from 'vue-amap'
import { getjwdList, getDeviceData } from "@/api/device/device";
let amapManager = new AMapManager()

export default {
 data() {
    return {
     jwd:[],
     deviceName:undefined,
     deviceData:[],
     deviceNameCode:[],
    }
  },
  mounted() {
    this.carGPSIP();
  //    //天气插件配置
  //   window.WIDGET = {
  //     CONFIG: {
  //       layout: 2,
  //       width: "490",
  //       height: "450",
  //       background: 4,
  //       dataColor: "FFFFFF",
  //       backgroundColor: "102047",
  //       borderRadius: 0,
  //       key: "9qacv9iOEG",
  //     },
  //   };
  //   //引入天气插件
  //   const s = document.createElement("script");
  //   s.type = "text/javascript";
  //   s.src =
  //     "https://apip.weatherdt.com/standard/static/js/weather-standard-common.js?v=2.0";
  //   document.body.appendChild(s);
   },

  methods: {  
   
    //高德地图插件
    carGPSIP() {
      getjwdList().then((response) => {
        
         this.jwd = response.data.jwdList;
        
          let lnglatss=[];//经纬度
          let deviceAlias=[];//设备别名
          let deviceName=[];//设备名称
          let val=[];//水流量
          let tsTime =[]//最后时间
          //循环取出想要的数据
          for (let i = 0; i < this.jwd.length; i++) {           
              
                tsTime.push(this.jwd[i].tsTime);
                val.push(this.jwd[i].val);
                lnglatss.push(this.jwd[i].location); 
                deviceName.push(this.jwd[i].deviceName); 
                deviceAlias.push(this.jwd[i].deviceAlias); 
              }   
            //将取出来的经纬度转成数组格式
              if(lnglatss.length>0){
               var arr  = lnglatss;
                var arrs = []
                for(var i=0;i<arr.length;i++){
                arrs.push(arr[i].split(","))
              } 
           }
              
            
            //初始化地图对象，加载地图
            var map = new AMap.Map(
              "container", 
              {resizeEnable: true, zoom: 11}
              );
            var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});
            //遍历生成多个标记点
            for (var i = 0, marker; i < arrs.length; i++) {
              var marker = new AMap.Marker({
                position:arrs[i],//不同标记点的经纬度
                map: map
              });
             
              marker.content = '<span>设备地点：'+ deviceAlias[i] +'</span><br/>';
              marker.content += '<span>设备名称：'+deviceName[i]+'</span><br/>';
              marker.content += '<span>最后流量：'+ val[i] +'</span><br/>';
              marker.content += '<span>'+ tsTime[i] +'</span><br/>';
              marker.on('mouseover', markerClose);
              marker.on('mouseout', markerClose);
              marker.on('mouseout', markeropen);
            }

            function markeropen(e) {
              infoWindow.close(map, e.target.getPosition());
            }
            function markerClose(e) {
              infoWindow.setContent(e.target.content);
              infoWindow.open(map, e.target.getPosition());
            }
        
            map.setFitView();
     })

    }  
    
  },
  
}
</script>

<style lang="css">
.container {
  width: 100%;
  height: 100%;
  position: relative;
  left: 50%;
  top: 50%;
  transform: translate3d(-50%, -50%, 0);
  border: 1px solid #999;
}
.search-box {
  position: absolute;
  z-index: 5;
  width: 30%;
  left: 13%;
  top: 10px;
  height: 30px;
}
.search-box input {
  float: left;
  width: 80%;
  height: 100%;
  border: 1px solid #30ccc1;
  padding: 0 8px;
  outline: none;
}
.search-box button {
  float: left;
  width: 20%;
  height: 100%;
  background: #30ccc1;
  border: 1px solid #30ccc1;
  color: #fff;
  outline: none;
}
.tip-box {
  width: 100%;
  max-height: 260px;
  position: absolute;
  top: 30px;
  overflow-y: auto;
  background-color: #fff;
}
</style>