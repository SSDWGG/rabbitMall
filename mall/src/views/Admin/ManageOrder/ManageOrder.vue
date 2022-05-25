<template>
  <div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/HelloAdmin' }"
        ><span>管理员首页</span></el-breadcrumb-item
      >
      <el-breadcrumb-item
        ><span style="color: #e87bf8">订单管理</span></el-breadcrumb-item
      >
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <el-row :gutter="25">
        <el-col :span="10">
          <!-- 搜索模块   clearable输入框内容是否可以清空  @clear清空输入框输入值触发重新获取所有用户数据（回到初始状态） -->
          <el-input
            placeholder="请输入购物者姓名进行查询"
            v-model="queryInfo.query"
            clearable
            @clear="getorderlist"
          >
            <!--     点击属性  ：刷新数据页面       -->
            <el-button slot="append" icon="el-icon-search" @click="queryorder"
              >查询or刷新</el-button
            >
          </el-input>
        </el-col>
      </el-row>

      <el-table :data="oderlist" border stripe>
        <el-table-column label="列表序号" type="index" fixed></el-table-column>
        <!--   序号列     -->
        <el-table-column label="订单编号" prop="orderid"></el-table-column>
        <!--  取出userlist中的username的数据   下同 -->
        <el-table-column label="用户账号" prop="id"></el-table-column>
        <el-table-column label="购物者姓名" prop="username"></el-table-column>
        <el-table-column label="商品名" prop="goodstitle"></el-table-column>
        <el-table-column label="商品图片" prop="goodsimg">
          <template slot-scope="scope">
            <img v-lazy="scope.row.goodsimg" style="width: 70px" />
          </template>
        </el-table-column>
        <el-table-column label="商品价格" prop="goodsprice"></el-table-column>
        <el-table-column label="商品尺寸" prop="size"></el-table-column>
        <el-table-column label="收货地址" prop="adress"></el-table-column>
        <el-table-column label="联系方式" prop="email"></el-table-column>
        <el-table-column
          label="订单创建时间"
          prop="createTime"
        ></el-table-column>
        <el-table-column
          label="订单状态修改时间"
          prop="updateTime"
        ></el-table-column>
        <el-table-column label="发货状态" prop="issend"></el-table-column>
        <el-table-column label="操作" class="caozuo" fixed="right" width="200">
          <template slot-scope="scope" style="display: flex">
            <!-- 修改 -->
            <el-tooltip effect="dark" content="去发货" :enterable="false">
              <el-button
                type="primary"
                icon="el-icon-edit"
                size="mini"
                @click="send(scope.row.orderid)"
              ></el-button>
            </el-tooltip>
            <!-- 删除 -->
            <el-tooltip effect="dark" content="删除订单" :enterable="false">
              <el-button
                type="danger"
                icon="el-icon-delete"
                size="mini"
                @click="deleteorder(scope.row.orderid)"
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
        :page-sizes="[1, 5, 10, 20]"
        :page-size="queryInfo.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </el-card>
  </div>
</template>

<script>
import { orderpagequery } from "@/network/admin";
import { formatDatechange } from "@/common/utils";
import {
  deleteorder,
  queryorder,
  sendbyorderid,
  setadminlog,
} from "@/network/admin2";

export default {
  name: "ManageOrder",
  data() {
    return {
      // 分页查询信息实体
      queryInfo: {
        query: "", //查询信息
        pageNum: 1, //当前页
        pageSize: 10, //每页最大数
      },
      oderlist: [],
      total: 0,
    };
  },
  created() {
    //请求数据库拿到所有数据
    this.getorderlist();
  },
  methods: {
    getorderlist() {
      //注意这里传递的是一个pageNum   不是pagestart
      orderpagequery(this.queryInfo.pageNum, this.queryInfo.pageSize).then(
        (res) => {
          this.oderlist = res.data.data; // 将返回数据赋值
          this.total = res.data.numbers; // 总个数
          //对两个时间戳进行修改   对issend进行格式转换
          this.oderlist.forEach(function (x, index, a) {
            x.createTime = formatDatechange(x.createTime);
            x.updateTime = formatDatechange(x.updateTime);
            if (x.issend > 0) x.issend = "已发货";
            else x.issend = "未发货";
          });
        }
      );
    }, //分页查询
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getorderlist(); // 数据格式发生改变重新申请数据（因为显示出来的诗句是从数据库动态的取出来展示的）
    }, // 监听pageSize改变的事件       change事件会把newsize是组件内部封装，会自动取值当前选择的选项
    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getorderlist(); // 数据格式发生改变重新申请数据
    }, // 监听pageNum改变的事件
    send(orderid) {
      //  根据id找到订单发货
      sendbyorderid(orderid).then((res) => {
        res.data == "success"
          ? this.$message.success("~发货成功~")
          : this.$message.error("~发货失败~");
        setadminlog(
          this.$store.state.user.username,
          "对订单编号为：" + orderid + "的货物进行了发货"
        );
        this.getorderlist();
      });
    },
    deleteorder(orderid) {
      deleteorder(orderid).then((res) => {
        res.data == "success"
          ? this.$message.success("~删除成功~")
          : this.$message.error("~删除失败~");
        setadminlog(
          this.$store.state.user.username,
          "对订单编号为：" + orderid + "的货物进行了删除订单"
        );
        this.getorderlist();
      });
    },
    queryorder() {
      queryorder(this.queryInfo.query).then((res) => {
        this.oderlist = res.data;
      });
    },
  },
};
</script>

<style scoped>
</style>