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
        ><span style="color: #000000">用户个人信息</span></el-breadcrumb-item
      >
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <!-- 搜索模块   clearable输入框内容是否可以清空  @clear清空输入框输入值触发重新获取所有用户数据（回到初始状态） -->
      <el-row :gutter="25">
        <el-col :span="10">
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
      </el-row>
      <!--表格主体-->
      <el-table :data="userlist" border stripe v-loading="loading">
        <el-table-column label="id" prop="id"></el-table-column>
        <el-table-column label="用户名" prop="username"></el-table-column>
        <el-table-column label="头像" prop="tximg">
          <template slot-scope="scope">
            <img v-lazy="scope.row.tximg" style="width: 75px" />
          </template>
          <!-- <img src="/tximg/tx2.jpeg">   图片放到public文件夹里面不需要写前缀  和放在assets里面不一样      -->
        </el-table-column>
        <el-table-column label="地址" prop="adress"></el-table-column>
        <el-table-column label="年纪" prop="age"></el-table-column>
        <el-table-column label="操作" class="caozuo">
          <template slot-scope="scope">
            <!-- 修改 -->
            <el-tooltip effect="dark" content="修改个人信息" :enterable="false">
              <el-button
                type="primary"
                icon="el-icon-edit"
                size="mini"
                @click="showEditDialog(scope.row)"
              ></el-button>
            </el-tooltip>
            <!-- 清空 -->
            <el-tooltip effect="dark" content="清空个人信息" :enterable="false">
              <el-button
                type="danger"
                icon="el-icon-delete"
                size="mini"
                @click="deleteUser(scope.row.id)"
              ></el-button>
            </el-tooltip>

            <!-- 修改用户头像
            <el-tooltip effect="dark" content="修改用户头像 "  :enterable="false"></el-tooltip>-->
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页模块-->
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

    <!-- 修改信息弹出框 -->
    <el-dialog
      title="修改用户信息"
      :visible.sync="editDialogVisible"
      width="50%"
      @colse="editDialogClosed"
    >
      <el-form
        :model="editForm"
        :rules="editFormRules"
        ref="editFormRef"
        label-width="70px"
      >
        <!-- id（user表的标识，不是userinfo的索引） -->
        <el-form-item label="标识" prop="id">
          <el-input v-model="editForm.id" disabled></el-input>
        </el-form-item>
        <!-- 用户名 -->
        <el-form-item label="用户名" prop="username">
          <el-input v-model="editForm.username" disabled></el-input>
        </el-form-item>
        <!-- 年龄 -->
        <el-form-item label="年龄" prop="age">
          <el-input v-model="editForm.age"></el-input>
        </el-form-item>
        <!-- 地址 -->
        <el-form-item label="地址" prop="adress">
          <el-input v-model="editForm.adress"></el-input>
        </el-form-item>
        <!-- 头像（需要额外上传，不在修改表单内修改头像）
        <el-form-item label="地址" prop="adress">
          <el-input v-model="editForm."></el-input>
        </el-form-item> -->
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="canceledituser()">取 消</el-button>
        <el-button type="primary" @click="editUserInfo">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>




<script>
import { userinfopagequery, dimquery, editUserinfo } from "@/network/admin";
import { setadminlog } from "@/network/admin2";

export default {
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

      editDialogVisible: false, // 控制修改用户对话框显示/隐藏

      editForm: {
        id: "",
        username: "",
        adress: "",
        age: 0,
        tximg: "",
      }, // 修改userinfo表单

      editFormRules: {
        adress: [
          { required: true, message: "请输入地址", trigger: "blur" },
          { min: 6, max: 50, message: "请输入具体地址", trigger: "blur" },
        ],
        age: [{ required: true, message: "请输入年龄", trigger: "blur" }],
      }, // 修改用户表单验证规则

      loading: false, //是否加载
    };
  },
  created() {
    this.getUserList();
  },
  methods: {
    getUserList() {
      userinfopagequery(this.queryInfo.pageNum, this.queryInfo.pageSize).then(
        (res) => {
          // console.log(res);
          this.userlist = res.data.data; // 将返回数据赋值
          this.total = res.data.numbers; // 总个数
        }
      );
    }, //分页查询

    dimquery(queryinfo) {
      if (queryinfo.length != 0) {
        dimquery(queryinfo).then((res) => {
          console.log(res.data);
          this.userlist = res.data.datauserinfo;
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

    showEditDialog(rowinfo) {
      this.editForm = {
        id: rowinfo.id,
        username: rowinfo.username,
        adress: rowinfo.adress,
        age: rowinfo.age,
        tximg: rowinfo.tximg,
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
        await editUserinfo(
          this.editForm.id,
          this.editForm.age,
          this.editForm.adress
        ).then((res) => {
          switch (res.data) {
            case "error":
              this.$message.error("~修改操作失败~");
              break;
            case "updatesuccess":
              this.$message.success("~edit Success~");

              setadminlog(
                this.$store.state.user.username,
                "修改了用户id为：" + this.editForm.id + "的个人信息"
              );
              this.editDialogVisible = false; //隐藏
              this.getUserList();
              break;
          }
        });
      });
    }, // 确认修改（修改后的用户名和邮箱不能重复，最后需要清空输入框的内容)

    deleteUser(id) {
      (this.editForm.adress = ""),
        (this.editForm.age = 18),
        (this.editForm.tximg = "");
      editUserinfo(
        id,
        this.editForm.age,
        this.editForm.adress,
        this.editForm.tximg
      ).then((res) => {
        switch (res.data) {
          case "error":
            this.$message.error("~修改操作失败~");
            break;
          case "updatesuccess":
            this.$message.success("~clean Success~");
            setadminlog(
              this.$store.state.user.username,
              "初始化了用户id为：" + id + "的账号信息"
            );
            this.editDialogVisible = false; //隐藏
            this.getUserList();
            break;
        }
      });
    }, // 清空
  },
};
</script>
<style lang="less" scoped>
</style>