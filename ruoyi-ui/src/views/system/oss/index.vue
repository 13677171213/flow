<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      label-width="68px"
    >
      <el-form-item label="名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="uploadHandle"
          v-hasPermi="['sys:oss:edit']"
          >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['sys:oss:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['sys:oss:edit']"
          >删除</el-button
        >
      </el-col>
    </el-row>

    <el-table
      v-loading="loading"
      :data="postList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文件名称" align="center" prop="fileName" width="220px" />
      <el-table-column label="类型" align="center" prop="fileType" />
      <el-table-column label="链接地址(点击复制)" align="center" prop="url">
        <template slot-scope="scope">
          <el-tooltip placement="top">
            <div slot="content">点击复制</div>
            <span style="display:block;cursor:pointer;width:100%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;" class="tag-read" :data-clipboard-text="scope.row.url" @click="copy">{{scope.row.url}}</span>  
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="排序" align=" center" prop="" />
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label=" 操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['sys:oss:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['sys:oss:edit']"
            >删除</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="showImg(scope.row.url)"
            v-hasPermi="['sys:oss:edit']"
            >查看</el-button
          >
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
    <!-- 弹窗, 上传文件 -->
    <OssUpload
      v-if="uploadVisible"
      ref="upload"
      @getDataList="getDataList"
    ></OssUpload>
    <!-- 添加或修改岗位对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="500px"
      append-to-body
      :close-on-click-modal="false"
    >
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input
            v-model="form.content"
            placeholder="请输入内容"
            type="textarea"
            :autosize="{ minRows: 6, maxRows: 10 }"
          />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="联系方式" prop="phone">
          <el-input
            v-model="form.phone"
            type="text"
            placeholder="请输入联系方式"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import Clipboard from "clipboard";
import { getToken } from "@/utils/auth";
import OssUpload from "./oss-upload";
export default {
  name: "Post",
  components: {
    OssUpload,
  },
  data() {
    return {
      uploadVisible: false,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 岗位表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      // 用户导入参数
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        title: [{ required: true, message: "标题不能为空", trigger: "blur" }],
        content: [{ required: true, message: "内容不能为空", trigger: "blur" }],
      },
    };
  },
  created() {
    this.getList();
    //this.reportLoad();
  },
  methods: {
    copy() {
      var clipboard = new Clipboard(".tag-read");
      clipboard.on("success", (e) => {
        success("复制成功"); //这里你如果引入了elementui的提示就可以用，没有就注释即可
        // 释放内存
        clipboard.destroy();
      });
      clipboard.on("error", (e) => {
        // 不支持复制
        console.log("该浏览器不支持自动复制");
        // 释放内存
        clipboard.destroy();
      });
    },
    /** 查询岗位列表 */
    getList() {
      this.loading = true;
      this.$request({
        url: "/sys/oss/list",
        method: "get",
        params: this.queryParams,
      }).then((response) => {
        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 上传文件
    uploadHandle() {
      this.uploadVisible = true;
      this.$nextTick(() => {
        this.$refs.upload.init();
      });
    },
    showImg(url) {
      this.$alert(`<img src="${url}" style="width: auto">`, "", {
        dangerouslyUseHTMLString: true,
        confirmButtonText: "关闭",
        callback: (action) => {},
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
        title: undefined,
        content: undefined,
        name: undefined,
        desception: undefined,
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
      this.title = "添加反馈信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.id || this.ids;
      //get(postId)
      this.$request({
        url: "/sys/oss/" + postId,
        method: "get",
      }).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改反馈信息";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          //this.form.jf_month = this.checkedCities;
          if (this.form.id != undefined) {
            //update(this.form)
            this.$request({
              url: "/sys/oss",
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
            //add(this.form)
            this.$request({
              url: "/sys/oss",
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
    /** 删除按钮操作 */
    handleDelete(row) {
      var that = this;
      const Ids = [row.id] || this.ids;
      this.$confirm('是否确认删除编号为"' + Ids + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      }).then(function () {
        return that
          .$request({
            url: "/sys/oss/delete",
            method: "post",
            data: Ids,
          })
          .then((response) => {
            console.log(response);
            that.getList();
            that.msgSuccess("删除成功");
          })
          .catch(function () {});
      });
    },
  },
};
</script>