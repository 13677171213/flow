<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
          <el-form-item label="水表名称" label-width="100px" prop="watermeterName">
            <el-input
              v-model="queryParams.watermeterName"
              placeholder="请输入水表名称"
              clearable
              size="small"
              style="width:80%"
              @keyup.enter.native="handleQuery"
            />
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
         <!-- </el-col>
       </el-row> -->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="materList"
    >
      <el-table-column  width="55" align="center" />
      <el-table-column
        label="水表ID"
        align="center"
        prop="watermeterId"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="水表名称"
        align="center"
        prop="watermeterName"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="水表地址"
        align="center"
        prop="address"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="抄读值"
        align="center"
        prop="readNumber"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="抄读时间"
        align="center"
        prop="readingDate"
        :show-overflow-tooltip="true"/>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
export default {
  name: "WaterValue",
 
  data() {
    return {    
      id: undefined,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      //列表数据
      materList:[],
      // 弹出层标题
      title: "",
      //表单默认可输入
      readonly: true,
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
    
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {

      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      this.$request({
        url: "/hydrology/value/list",
        method: "get",
        params: this.queryParams,
      }).then((response) => {
        this.materList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
  },
};
</script>
<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 64px;
  height: 64px;
  line-height: 64px;
  text-align: center;
}
.avatar {
  width: 64px;
  height: 64px;
  display: block;
}
</style>