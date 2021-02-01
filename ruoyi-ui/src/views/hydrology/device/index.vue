<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
          <el-form-item label="设备名称" label-width="100px" prop="device">
            <el-input
              v-model="queryParams.device"
              placeholder="请输入设备名称"
              clearable
              size="small"
              style="width:80%"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="设备状态" label-width="100px"  prop="deviceStatus">
              <el-select
                v-model="queryParams.deviceStatus"
                placeholder="设备状态"
                clearable
                size="small"
              >
              <el-option
              v-for="item in statusoptions"
              :key="item"
              :label="item"
              :value="item"
            />
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
         <!-- </el-col>
       </el-row> -->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['order:clientData:add']"
          >新增</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="deviceList"
    >
      <el-table-column  width="55" align="center" />
      <el-table-column
        label="设备名"
        align="center"
        prop="deviceName"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="设备别名"
        align="center"
        prop="deviceAlias"
        :show-overflow-tooltip="true"/>
      <el-table-column
        label="是否绑定"
        align="center"
        prop="binding"
        :show-overflow-tooltip="true"/>
      <el-table-column
        prop="createBy"
        label="创建人"
        align="center"/>
      <el-table-column
        prop="createTime"
        label="创建时间"
        align="center"/>
        <el-table-column
        prop="remark"
        label="备注"
        align="center"/>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hydrology:device:edit']"
            >修改</el-button>  
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleBinding(scope.row)"
            v-hasPermi="['hydrology:device:edit']"
            >解绑</el-button>   
            <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['hydrology:device:info']"
            >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['hydrology:device:delete']"
            >删除</el-button> 
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="40%"
      append-to-body
      :close-on-click-modal="false"
    >
       <el-form ref="form" :model="form" :rules="rules" readonly  label-width="80px" read>
         <el-row>
          <el-col :span="12">
            <el-form-item label="设备别名" label-width="30%" prop="deviceAlias">
              <el-input v-model="form.deviceAlias" style="width:60%" placeholder="请输入设备别名" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备编号" label-width="30%" prop="deviceName">
              <el-input v-model="form.deviceName" style="width:60%" placeholder="请输入设备编号" />
            </el-form-item>
          </el-col>
         </el-row>
         <el-row>
          <el-col :span="12">
            <el-form-item label="设备密码" label-width="30%" prop="devicePwd">
              <el-input v-model="form.devicePwd" style="width:60%" placeholder="请输入设备密码"  />
            </el-form-item>
          </el-col>
          <el-col :span="12">
              <el-form-item label="经纬度" label-width="30%" prop="location">
                <el-input v-model="form.location" placeholder="请输入经纬度" style="width:60%"/>
              </el-form-item>
          </el-col>
         </el-row>
          <el-row>
          <el-col :span="24">
            <el-form-item label="备注" label-width="30%" prop="remark">
              <el-input v-model="form.remark" style="width:60%" placeholder="请输入备注"  />
            </el-form-item>
          </el-col>
          
         </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
export default {
  name: "device",
 
  data() {
    return {    
      id: undefined,
      act: undefined,
      statusoptions:["在线","离线"],
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
      deviceList:[],
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
        url: "/hydrology/device/list",
        method: "get",
        params: this.queryParams,
      }).then((response) => {
        this.deviceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        devicePwd: undefined,
        deviceAlias: undefined,
        deviceName: undefined,
        remark:undefined,
        location: undefined,
      };
      this.resetForm("form");
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "新增设备";
      this.form.id = this.getGuid();
      this.act = "add";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      this.$request({
        url: "/hydrology/device/" + id,
        method: "get",
      }).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改";
        this.act = "edit";
      });
    },
   
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          console.log("修改"+this.act);
          if (this.act == "edit") {
            this.$request({
              url: "/hydrology/device/edit",
              method: "put",
              data: this.form,
            }).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          } else {
             console.log("新增"+this.act);
            this.$request({
              url: "/hydrology/device/add",
              method: "post",
              data: this.form,
            }).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          }
        }
      });
    },
    /** 解除绑定操作 */
    handleBinding(row) {
      var that = this;
      const id = row.id;
      const deviceName = row.deviceName;
      this.$confirm('是否确认解除"' + deviceName + '"的设备?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return that.$request({
            url: '/hydrology/device/binding/'+id,
            method: 'get',
            data: id
          });
        }).then(response => {
          if(response.code = 200){
            this.getList();
            this.msgSuccess("解绑成功");
          } else {
            this.msgError(response.msg);
          } 
    });
   },
    /** 删除按钮操作 */
    handleDelete(row) {
      var that = this;
      const id = row.id;
      this.$confirm('是否确认删除计划编号为"' + id + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return that.$request({
            url: '/hydrology/device/' + id,
            method: 'delete',
            data: id
          });
        }).then(response => {
          if(response.code = 200){
            this.getList();
            this.msgSuccess("删除成功");
          } else {
            this.msgError(response.msg);
          } 
    });
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