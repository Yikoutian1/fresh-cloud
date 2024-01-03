<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="120px"
    >
      <el-form-item label="优惠券编号" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠卷标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入优惠卷标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠卷金额" prop="money">
        <el-input
          v-model="queryParams.money"
          placeholder="请输入优惠卷金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠卷描述" prop="desc">
        <el-input
          v-model="queryParams.desc"
          placeholder="请输入优惠卷描述"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="优惠卷开始时间" prop="start">
        <el-date-picker
          clearable
          v-model="queryParams.start"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择优惠卷开始时间"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="优惠卷到期时间" prop="end">
        <el-date-picker
          clearable
          v-model="queryParams.end"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择优惠卷到期时间"
        >
        </el-date-picker>
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
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:coupon:add']"
          >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:coupon:edit']"
          >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:coupon:remove']"
          >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:coupon:export']"
          >导出
        </el-button>
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="couponList"
      @selection-change="handleSelectionChange"
      border
      style="width: 100%"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="优惠券编号" align="center" prop="id" fixed />
      <el-table-column label="优惠卷标题" align="center" prop="title" />
      <el-table-column label="优惠卷图片地址" align="center" prop="img" />
      <el-table-column label="优惠卷金额" align="center" prop="money" />
      <el-table-column label="优惠卷描述" align="center" prop="desc" />
      <el-table-column label="最低使用金额" align="center" prop="limit" />
      <el-table-column
        label="优惠卷开始时间"
        align="center"
        prop="start"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.start, "{y}-{m}-{d} {h}:{m}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="优惠卷到期时间"
        align="center"
        prop="end"
        width="180"
      >
        <template slot-scope="scope">
          <span v-if="parseTime(Date.now()) <= parseTime(scope.row.end)">
            {{ parseTime(scope.row.end, "{y}-{m}-{d} {h}:{m}:{s}") }}
          </span>
          <el-tag v-else type="danger">优惠券已过期</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="发放总数" align="center" prop="total" />
      <el-table-column label="剩余数量" align="center" prop="num" />
      <el-table-column label="剩余百分比" align="center" width="160">
        <template slot-scope="scope">
          <el-progress
            :percentage="(scope.row.num / scope.row.total).toFixed(2) * 100"
            :color="customColors"
          ></el-progress>
        </template>
      </el-table-column>
      <el-table-column label="使用百分百" align="center" width="160">
        <template slot-scope="scope">
          <el-progress
            :percentage="
              (((scope.row.useNum * 100) / scope.row.total) * 100).toFixed(2) /
              100
            "
            :color="customColors"
          ></el-progress>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:coupon:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:coupon:remove']"
            >删除
          </el-button>
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

    <!-- 添加或修改优惠券对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="160px">
        <el-form-item label="优惠卷标题11" prop="title">
          <el-input v-model="form.title" placeholder="请输入优惠卷标题" />
        </el-form-item>
        <el-form-item label="优惠卷图片地址" prop="img">
          <el-input v-model="form.img" placeholder="请输入优惠卷图片地址" />
        </el-form-item>
        <el-form-item label="优惠卷金额" prop="money">
          <el-input v-model="form.money" placeholder="请输入优惠卷金额" />
        </el-form-item>
        <el-form-item label="优惠卷描述" prop="desc">
          <el-input v-model="form.desc" placeholder="请输入优惠卷描述" />
        </el-form-item>
        <el-form-item label="最低使用金额" prop="limit">
          <el-input v-model="form.limit" placeholder="请输入最低使用金额" />
        </el-form-item>
        <el-form-item label="优惠卷开始时间" prop="start">
          <el-date-picker
            clearable
            v-model="form.start"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择优惠卷开始时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="优惠卷到期时间" prop="end">
          <el-date-picker
            clearable
            v-model="form.end"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择优惠卷到期时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="数量" prop="num">
          <el-input v-model="form.num" placeholder="请输入数量" />
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
import {
  listCoupon,
  getCoupon,
  delCoupon,
  addCoupon,
  updateCoupon,
} from "@/api/system/coupon";

export default {
  name: "Coupon",
  data() {
    return {
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
      // 优惠券表格数据
      couponList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        title: null,
        money: null,
        desc: null,
        start: null,
        end: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      // 进度条颜色
      customColor: "#5cb87a",
      customColors: [
        { color: "#EB3324", percentage: 10 },
        { color: "#D2E61F", percentage: 20 },
        { color: "#e6a23c", percentage: 40 },
        { color: "#F08650", percentage: 60 },
        { color: "#1989fa", percentage: 80 },
        { color: "#5cb87a", percentage: 100 },
      ],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询优惠券列表 */
    getList() {
      this.loading = true;
      listCoupon(this.queryParams).then((response) => {
        this.couponList = response.rows;
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
        id: null,
        title: null,
        img: null,
        money: null,
        desc: null,
        limit: null,
        start: null,
        end: null,
        num: null,
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
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加优惠券";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getCoupon(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改优惠券";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updateCoupon(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCoupon(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal
        .confirm('是否确认删除优惠券编号为"' + ids + '"的数据项？')
        .then(function () {
          return delCoupon(ids);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "system/coupon/export",
        {
          ...this.queryParams,
        },
        `coupon_${new Date().getTime()}.xlsx`
      );
    },
    timeCompare(endtime) {
      // let a = parseTime(endtime, "{y}{m}{d}{h}{m}{s}");
      // let b = parseTime(new Date(), "{y}{m}{d}{h}{m}{s}");
      let a = endtime.getTime();
      let b = new Date().getTime();
      // 结束小于现在时间则true
      console.info("a=" + a + ",b=" + b);
      if (a <= b) return true;
      else return false;
    },
  },
  computed: {},
};
</script>
