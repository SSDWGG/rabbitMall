<template>
  <div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/HelloAdmin' }"
        ><span>管理员首页</span></el-breadcrumb-item
      >
      <el-breadcrumb-item :to="{ path: '/HelloAdmin' }"
        ><span>用户管理</span></el-breadcrumb-item
      >
      <el-breadcrumb-item
        ><span style="color: #e87bf8">账号信息</span></el-breadcrumb-item
      >
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <el-row :gutter="25">
        <el-col :span="10">
          <!-- 搜索模块   clearable输入框内容是否可以清空  @clear清空输入框输入值触发重新获取所有用户数据（回到初始状态） -->
          <el-input
            placeholder="请输入搜索内容"
            v-model="queryInfo.query"
            clearable
            @clear="getUserList"
          >
            <!--     点击属性  ：刷新数据页面       -->
            <el-button
              slot="append"
              icon="el-icon-search"
              @click="dimquery(queryInfo.query)"
              >查询</el-button
            >
          </el-input>
        </el-col>
        <!--         添加 -->
        <el-col :span="4">
          <el-button type="primary" @click="addDialogVisible = true"
            >添加用户</el-button
          >
        </el-col>
      </el-row>

      <!-- 用户列表 从userlist中循环取出数据  border边框  stripe隔行变色-->
      <el-table :data="userlist" border stripe>
        <el-table-column label="序号" type="index"></el-table-column>
        <!--   序号列     -->
        <el-table-column label="姓名" prop="username"></el-table-column>
        <!--  取出userlist中的username的数据   下同 -->
        <el-table-column label="id" prop="id"></el-table-column>
        <el-table-column label="邮箱" prop="email"></el-table-column>
        <el-table-column label="密码" prop="password"></el-table-column>
        <el-table-column label="管理员" prop="admin">
          <!--          传过来的是数字1 不是布尔类型 需要做一个动态绑定-->
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.admin"
              :active-value="1"
              :inactive-value="0"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="attributechange(scope.row.id, 'admin', scope.row.admin)"
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="状态" prop="deleted">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.deleted"
              :active-value="0"
              :inactive-value="1"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="
                attributechange(scope.row.id, 'deleted', scope.row.deleted)
              "
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="操作" class="caozuo">
          <template slot-scope="scope">
            <!-- 修改 -->
            <el-tooltip
              effect="dark"
              content="修改用户账户信息"
              :enterable="false"
            >
              <el-button
                type="primary"
                icon="el-icon-edit"
                size="mini"
                @click="showEditDialog(scope.row)"
              ></el-button>
            </el-tooltip>
            <!-- 删除 -->
            <el-tooltip effect="dark" content="深度删除用户" :enterable="false">
              <el-button
                type="danger"
                icon="el-icon-delete"
                size="mini"
                @click="deleteUser(scope.row.id)"
              ></el-button>
            </el-tooltip>
          </template>
        </el-table-column>
      </el-table>

      <!-- 分页   size-change改变每页显示条数   current-change个改变当前第几页 其余的是显示当前的页数当前的每页显示数当前数据库总数 layout功能组件-->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pageNum"
        :page-sizes="[1, 2, 5, 100]"
        :page-size="queryInfo.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>
    <!-- 创建新用户对话框（弹出框） -->
    <el-dialog
      title="添加用户"
      :visible.sync="addDialogVisible"
      width="50%"
      @close="addDialogClosed"
    >
      <!-- 内容主体区域 -->
      <el-form :model="addForm" ref="addFormRef" label-width="70px">
        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input
            v-model="addForm.username"
            placeholder="规则：字母数字下划线And账号长度1-10"
            @blur="checkusername(addForm.username)"
          ></el-input>
        </el-form-item>
        <!-- 密码 -->
        <el-form-item label="密码" prop="password">
          <el-input
            v-model="addForm.password"
            placeholder="规则：6个以上任意字符，但必须包括字母和数字"
            @blur="checkpassword(addForm.password)"
          ></el-input>
        </el-form-item>
        <!-- 邮箱 -->
        <el-form-item label="邮箱" prop="email">
          <el-input
            v-model="addForm.email"
            placeholder="请确保是未注册的邮箱，否则该账号将无法被正确添加"
            @blur="checkemail(addForm.email)"
          ></el-input>
        </el-form-item>
      </el-form>
      <!-- 内容底部区域 -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="addDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="addUser">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改用户对话框 -->
    <el-dialog
      title="修改用户信息"
      :visible.sync="editDialogVisible"
      width="50%"
      @colse="editDialogClosed"
    >
      <el-form :model="editForm" ref="editFormRef" label-width="70px">
        <!-- id -->
        <el-form-item label="标识" prop="id">
          <el-input v-model="editForm.id" disabled></el-input>
        </el-form-item>
        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input
            v-model="editForm.username"
            placeholder="规则：字母数字下划线And账号长度1-10"
            @blur="checkusername(editForm.username)"
          ></el-input>
        </el-form-item>
        <!-- 密码 -->
        <el-form-item label="密码" prop="password">
          <el-input
            v-model="editForm.password"
            placeholder="规则：6个以上任意字符，但必须包括字母和数字"
            @blur="checkpassword(editForm.password)"
          ></el-input>
        </el-form-item>
        <!-- 邮箱 -->
        <el-form-item label="邮箱" prop="email">
          <el-input
            v-model="editForm.email"
            placeholder="请确保是未注册的邮箱，否则该账号将无法被正确添加"
            @blur="checkemail(editForm.email)"
          ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="canceledituser()">取 消</el-button>
        <el-button type="primary" @click="editUserInfo">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {
  pagequery,
  attributechange,
  dimquery,
  addUser,
  editUser,
  deleteUser,
} from "@/network/admin";
import { setadminlog } from "@/network/admin2";
import { chexkrules } from "@/assets/mixins/checkrules";

export default {
  mixins: [chexkrules],
  data() {
    return {
      // 查询信息实体
      queryInfo: {
        query: "", //查询信息
        pageNum: 1, //当前页
        pageSize: 100, //每页最大数
      },
      userlist: [], // 用户列表

      total: 0, // 数据总条数

      addDialogVisible: false, // 对话框是否显示
      // 添加用户表单项
      addForm: {
        username: "",
        password: "",
        email: "",
      },
      // 控制修改用户对话框显示/隐藏
      editDialogVisible: false,
      // 修改用户注册信息
      editForm: {
        id: "", //不要使用数字类型，可能造成精度丢失
        username: "",
        password: "",
        email: "",
      },
      // // 验证规则        已使用mixin封装
      // addFormRules: {
      //   username: [
      //     { required: true, message: "请输入用户名", trigger: "blur" },
      //     { min: 5, max: 8, message: "长度在 5 到 8 个字符", trigger: "blur" },
      //   ],
      //   password: [
      //     { required: true, message: "请输入密码", trigger: "blur" },
      //     { min: 6, max: 8, message: "长度在 6 到 8 个字符", trigger: "blur" },
      //   ],
      //   email: [
      //     { required: true, message: "请输入邮箱", trigger: "blur" },
      //     { min: 5, max: 15, message: "请输入正确邮箱格式", trigger: "blur" },
      //   ],
      // },
      // // 修改用户表单验证规则
      // editFormRules: {
      //   password: [
      //     { required: true, message: "请输入密码", trigger: "blur" },
      //     { min: 6, max: 8, message: "长度在 6 到 8 个字符", trigger: "blur" },
      //   ],
      //   email: [
      //     { required: true, message: "请输入邮箱", trigger: "blur" },
      //     { min: 5, max: 20, message: "请输入正确邮箱格式", trigger: "blur" },
      //   ],
      // },
    };
  },
  created() {
    this.getUserList();
  },
  methods: {
    getUserList() {
      //注意这里传递的是一个pageNum   不是pagestart
      pagequery(this.queryInfo.pageNum, this.queryInfo.pageSize).then((res) => {
        // console.log(res)
        this.userlist = res.data.data; // 将返回数据赋值
        this.total = res.data.numbers; // 总个数
      });
    }, //分页查询

    dimquery(queryinfo) {
      if (queryinfo.length != 0) {
        dimquery(queryinfo).then((res) => {
          this.userlist = res.data.data;
        });
      } else {
        this.$message.error("查询不得为空");
      }
    }, //模糊查询（用户名）

    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getUserList(); // 数据格式发生改变重新申请数据（因为显示出来的诗句是从数据库动态的取出来展示的）
    }, // 监听pageSize改变的事件       change事件会把newsize是组件内部封装，会自动取值当前选择的选项

    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getUserList(); // 数据格式发生改变重新申请数据
    }, // 监听pageNum改变的事件

    attributechange(id, name, targe) {
      //传入唯一标识和需要切换的属性名，当前属性值
      attributechange(id, name, targe).then((res) => {
        if (res.data === "success") {
          this.$message.success("切换成功~");
          setadminlog(
            this.$store.state.user.username,
            "切换用户id为：" + id + "的" + name + "状态成" + targe
          );
        } else {
          this.$message.error("切换失败");
        }
      });
    }, //属性切换（）

    addDialogClosed() {
      this.$refs.addFormRef.resetFields();
    }, // 添加用户的对话框关闭

    addUser() {
      this.$refs.addFormRef.validate(async (valid) => {
        if (!valid) return; //判断是否通过了表单校验
        await addUser(
          this.addForm.username,
          this.addForm.password,
          this.addForm.email
        ).then((res) => {
          // console.log(res)
          switch (res.data) {
            case "0":
              this.$message.error("~插入操作失败~");
              break;
            case "00":
              this.$message.error("~用户名或者邮箱重复,请更换输入~");
              break;
            case "insertsuccess":
              this.$message.success("~Add Success~");

              setadminlog(
                this.$store.state.user.username,
                "添加了用户，用户名称为:" + this.addForm.username
              );

              this.addDialogVisible = false; //隐藏对话框
              this.getUserList(); //刷新数据
              break;
          }
        });
      });
    }, // 添加用户

    showEditDialog(rowinfo) {
      this.editForm = {
        id: rowinfo.id,
        username: rowinfo.username,
        password: rowinfo.password,
        email: rowinfo.email,
      };
      this.editDialogVisible = true;
    }, // 展示修改框（输入框内展示已经有的信息）

    editDialogClosed() {
      this.$refs.editFormRef.resetFields();
    }, // 修改对话框关闭

    canceledituser() {
      this.editDialogVisible = false;
      this.$message.info("已取消修改");
    }, //取消修改对话框

    editUserInfo() {
      this.$refs.editFormRef.validate(async (valid) => {
        if (!valid) return this.$message.error("请按照规则修改");
        // 发起请求
        await editUser(
          this.editForm.id,
          this.editForm.username,
          this.editForm.password,
          this.editForm.email
        ).then((res) => {
          // console.log(res);
          switch (res.data) {
            case "0":
              this.$message.error("~修改操作失败~");
              break;
            case "00":
              this.$message.error("~用户名或者邮箱重复,请更换~");
              break;
            case "updatesuccess":
              this.$message.success("~edit Success~");
              setadminlog(
                this.$store.state.user.username,
                "修改了用户id为：" + this.editForm.id + "的账号信息"
              );
              this.editDialogVisible = false; //隐藏
              this.getUserList();
              break;
          }
        });
      });
    }, // 确认修改（修改后的用户名和邮箱不能重复，最后需要清空输入框的内容)

    async deleteUser(id) {
      // this.$confirm是系统自带的弹框
      const confirmResult = await this.$confirm(
        "此操作将永久删除该用户, 是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        }
      ).catch((err) => err);
      if (confirmResult != "confirm") {
        // 成功删除为confirm 取消为 cancel
        return this.$message.info("已取消删除");
      }
      await deleteUser(id).then((res) => {
        // console.log(res);
        if (res.data != "success") {
          return this.$message.error("删除失败！！！");
        }
        this.$message.success("删除成功！！！");
        setadminlog(
          this.$store.state.user.username,
          "删除了id为：" + id + "的用户"
        );
        this.getUserList();
      });
    }, // 删除按钮
  },
};
</script>
<style lang="less" scoped>
</style>