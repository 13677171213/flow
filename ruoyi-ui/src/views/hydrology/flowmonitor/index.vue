<template>
    <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
        <el-form-item label="设备名称" label-width="100px" prop="deviceName">
            <el-select v-model="queryParams.deviceName"  placeholder="请选择">
                <el-option
                  v-for="item in deviceOption"
                  :key="item.id"
                  :label="item.deviceName"
                  :value="item.deviceName"
                  @click="handleQuery"
                ></el-option>
              </el-select>
          </el-form-item>
          <el-form-item>
            <el-button
              type="cyan"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
              >搜索</el-button
            >
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
              >重置</el-button
            >
          </el-form-item>
          <right-toolbar
            :showSearch.sync="showSearch"
          ></right-toolbar>
    </el-form>
    
    <div id="echarts" style="width: 100%; height: 400px;"></div>
    </div>
</template>
<script>
import echarts from 'echarts'
export default {
  name: 'Monitor',
 data() {
    return {
     echarList:[],
     // 查询参数
      queryParams: {
        deviceName:undefined,
      },
      // 显示搜索条件
      showSearch: true,
      //设备列表
      deviceOption:[],
      tsTime:[],
      val:[],
    }
  },
  //调用
  mounted(){
    this.drawLine();
  },
  created(){
    //设备下拉框遍历
    this.getEcharList();
    this.getDeviceList();
    
  },
  methods: {
     /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams;
      this.getEcharList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    //设备列表
     getDeviceList() {
      this.$request({
        url: "/hydrology/device/deviceList",
        method: "get",
        params: this.queryParams,
      }).then((response) => {
        this.deviceOption = response.deviceList;
      });
    },
    getEcharList() {
      this.val =[];
      this.tsTime =[];
      this.loading = true;
      this.$request({
        url: "/hydrology/datas/echarList",
        method: "get", 
        params: this.queryParams,
        }).then((response) => {
        this.echarList = response.data.echarList;
        // let tsTime=[];
        // let val = [];
          for (let i = 0; i < this.echarList.length; i++) {
            this.tsTime.push(this.echarList[i].tsTime); 
            this.val.push(this.echarList[i].val); 
         }
         
         this.drawLine();
      });
      
    },

  /** 查询列表 */
      //echarts图
  drawLine(){
     // 折线图 自带的代码
                this.charts = echarts.init(document.getElementById('echarts'))
                this.charts.setOption({
                  title: {
                      text: '区域水位图',
                      left: 'center'
                          },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['流量曲线图']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
 
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data:this.tsTime  
                    },
                    yAxis: {
                        type: 'value',
                        
                    },
                    series: [{
                        name: '流量',
                        type: 'line',
                        stack: '总量',
                        data:this.val,
                        smooth: true
                    }]
                })    
                      
                
            }
            
        },
        
}
</script>

<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width:1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}

.item{
  margin-bottom: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.box{
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 25%;
  height: 150px;
  background-color: #FFFFFF;
  padding-left: 20px;
  margin-right: 40px;
  border-radius: 10px;
  border-top: 1px solid #1890FF;
}


</style>
