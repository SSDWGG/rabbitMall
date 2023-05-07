<template>
  <div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/HelloAdmin' }"
        ><span>管理员首页</span></el-breadcrumb-item
      >
      <el-breadcrumb-item
        ><span style="color: #e87bf8">商品管理</span></el-breadcrumb-item
      >
    </el-breadcrumb>
    <!-- 卡片视图区 -->
    <el-card>
      <el-row :gutter="25">
        <el-col :span="10">
          <!-- 搜索模块   clearable输入框内容是否可以清空  @clear清空输入框输入值触发重新获取所有用户数据（回到初始状态） -->
          <el-input
            placeholder="请输入商品名称"
            v-model="queryInfo.query"
            clearable
            @clear="getgoodslist"
          >
            <!--     点击属性  ：刷新数据页面       -->
            <el-button slot="append" icon="el-icon-search" @click="querygoods"
              >查询or刷新</el-button
            >
          </el-input>
        </el-col>

        <el-col :span="4">
          <el-button type="primary" @click="addgoodsshow = true"
            >商品上新</el-button
          >
        </el-col>
        <el-col :span="4">
          <el-button type="primary" @click="manageoutgoods"
            >下架商品管理</el-button
          >
        </el-col>
      </el-row>

      <el-table :data="goodslist" border stripe>
        <el-table-column label="序号" type="index"></el-table-column>
        <!--   序号列     -->
        <el-table-column label="商品编号" prop="goodsid"></el-table-column>
        <!--  取出userlist中的username的数据   下同 -->
        <el-table-column
          label="商品名称"
          prop="goodsname"
          fixed
        ></el-table-column>
        <el-table-column label="商品分类" prop="category"></el-table-column>
        <el-table-column label="折前价格" prop="price"></el-table-column>
        <el-table-column label="现价" prop="nowprice"></el-table-column>
        <el-table-column label="商品尺码表" width="300">
          <template slot-scope="scope">
            <el-table
              :data="scope.row.sizecountlist"
              style="width: 100%"
              max-height="300"
            >
              <el-table-column type="index" label="序号"> </el-table-column>
              <el-table-column prop="size" label="size"> </el-table-column>
              <el-table-column prop="restcount" label="restcount">
                <template slot-scope="scope11">
                  <el-input
                    :placeholder="scope11.row.restcount"
                    v-model="scope11.row.restcount"
                    @blur="
                      editrestcount(
                        scope.row.goodsid,
                        scope11.row.size,
                        scope11.row.restcount
                      )
                    "
                  ></el-input>
                </template>
              </el-table-column>
            </el-table>
          </template>
        </el-table-column>
        <el-table-column label="销售数量" prop="sellcount"></el-table-column>
        <el-table-column
          label="商品标题"
          prop="goodstitle"
          width="150px"
        ></el-table-column>
        <el-table-column
          label="描述"
          prop="goodsdescribe"
          width="200px"
        ></el-table-column>
        <el-table-column
          label="初次上架时间"
          prop="createTime"
        ></el-table-column>
        <el-table-column label="是否上架" prop="goodsdeleted">
          <template slot-scope="scope">
            <el-switch
              v-model="scope.row.deleted"
              :active-value="0"
              :inactive-value="1"
              active-color="#13ce66"
              inactive-color="#ff4949"
              @change="
                issell(scope.row.goodsid, 'goodsdeleted', scope.row.deleted)
              "
            >
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="操作" fixed="right" width="130px">
          <template slot-scope="scope">
            <!-- 修改 -->
            <el-tooltip effect="dark" content="修改商品信息" :enterable="false">
              <el-button
                type="primary"
                icon="el-icon-edit"
                size="mini"
                @click="editgoodsinfo(scope.row)"
                style="margin: 5px 0"
                >Edit</el-button
              >
            </el-tooltip>
            <!-- 上传尺码表 -->
            <el-tooltip
              effect="dark"
              content="修改商品尺码表"
              :enterable="false"
            >
              <el-button
                type="primary"
                icon="el-icon-edit"
                size="mini"
                @click="addsizecountDialogShow(scope.row.goodsid)"
                style="margin: 5px 0"
                >Up sizecountform</el-button
              >
            </el-tooltip>
            <!-- 上传商品图片 -->
            <!-- <el-tooltip
              effect="dark"
              content="上传商品图片"
              :enterable="false"
              style="margin: 5px 0"
            >
              <el-upload
                class="upload-demo"
                action="http://119.3.145.125:9000/uploadgoodsimg"
                :on-preview="handlePreview"
                :on-remove="handleRemove"
                :before-remove="beforeRemove"
                :before-upload="beforeupload"
                :on-success="imgSuccess"
                :multiple="false"
                :limit="1"
                :data="getgoodsname(scope.row.goodsid)"
                :on-exceed="handleExceed"
                :file-list="fileList"
                :show-file-list="false"
              >
                <el-button type="primary" icon="el-icon-edit" size="mini"
                  >Up Img</el-button
                >
              </el-upload>
            </el-tooltip> -->
          </template>
        </el-table-column>
      </el-table>

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
    <!-- 商品上新弹窗 -->
    <el-dialog
      title="商品上新"
      :visible.sync="addgoodsshow"
      width="70%"
      @close="addgoodsDialogClosed"
    >
      <!-- 内容主体区域 -->
      <el-form :model="addForm" ref="addFormRef" label-width="75px">
        <!-- goodstitle-->
        <el-form-item label="商品名称" prop="goodsname">
          <el-input
            v-model="addForm.goodsname"
            placeholder="请输入50字以内的商品名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品分类" prop="category">
          <el-input
            v-model="addForm.category"
            placeholder="请选择‘spring’‘summer’‘autumn’‘winter’输入"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品价格" prop="price">
          <el-input
            v-model="addForm.price"
            placeholder="请输入商品的核准价格"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品标题" prop="goodstitle">
          <el-input
            v-model="addForm.goodstitle"
            placeholder="请输入50字以内的商品标题"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品描述" prop="goodsdescribe">
          <el-input
            v-model="addForm.goodsdescribe"
            placeholder="请输入50字以内的商品描述"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品图片">
          <el-input
            disabled
            placeholder="请在上新之后在商品栏右侧的操作中上传该商品图片，无图商品无法上架~"
          ></el-input>
        </el-form-item>
        <el-form-item label="尺码表">
          <el-input
            disabled
            placeholder="请在上新之后在商品栏右侧的操作中上传该商品尺码件数表，无尺码商品无法被购买~"
          ></el-input>
        </el-form-item>
      </el-form>
      <!-- 内容底部区域 -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="addgoodsshow = false">取 消</el-button>
        <el-button type="primary" @click="addgoods">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 修改商品的弹窗 -->
    <el-dialog
      title="修改商品"
      :visible.sync="editDialogVisible"
      width="70%"
      @close="editgoodsDialogClosed"
    >
      <!-- 内容主体区域 -->
      <el-form :model="editForm" ref="editFormRef" label-width="75px">
        <el-form-item label="商品名称" prop="goodsname">
          <el-input
            v-model="editForm.goodsname"
            placeholder="请输入50字以内的商品名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品分类" prop="category">
          <el-input
            v-model="editForm.category"
            placeholder="请选择‘spring’‘summer’‘autumn’‘winter’输入"
          ></el-input>
        </el-form-item>
        <el-form-item label="最新价格" prop="nowprice">
          <el-input
            v-model="editForm.nowprice"
            placeholder="请输入商品的新核准价格"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品标题" prop="goodstitle">
          <el-input
            v-model="editForm.goodstitle"
            placeholder="请输入50字以内的商品标题"
          ></el-input>
        </el-form-item>
        <el-form-item label="商品描述" prop="goodsdescribe">
          <el-input
            v-model="editForm.goodsdescribe"
            placeholder="请输入50字以内的商品描述"
          ></el-input>
        </el-form-item>
      </el-form>
      <!-- 内容底部区域 -->
      <span slot="footer" class="dialog-footer">
        <el-button @click="editDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="editgoods">确 定</el-button>
      </span>
    </el-dialog>
    <!-- 尺码表dialog -->
    <el-dialog width="70%" :visible.sync="innerVisible">
      <!-- 内容主体区域 -->
      <el-form
        :model="addForm"
        ref="sizecountFormRef"
        label-width="75px"
        :inline="true"
      >
        <!-- 如果这里实现手动输入尺码和数量的话，会有很多意外情况（尺码重复（前端判断），尺码数量为空（正则）） -->
        <el-form-item label="尺寸">
          <el-input
            v-model="addsize"
            placeholder="输入不带特殊符号的尺寸    尺寸例如：xl  "
          ></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input
            v-model="addcount"
            placeholder="输入非零的正整数  数量例如：99  "
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addsizecount">确认增加</el-button>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="innerVisible = false">取 消</el-button>
        <el-button type="primary" @click="editsizecount">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { attributechange, goodspagequery } from "@/network/admin";
import { formatDatechange } from "@/common/utils";
import { querygoods, setadminlog, addgoods, editgoods } from "@/network/admin2";
import { getoutgoods, addsizecount, editsizecount } from "@/network/goods";

export default {
  computed: {
    getgoodsname() {
      //el-upload携带的参数接收格式为一个对象
      return function (goodsid) {
        let name = {
          goodsid: goodsid,
        };
        return name;
      };
    },
  },
  data() {
    return {
      // 分页查询信息实体
      queryInfo: {
        query: "", //查询信息
        pageNum: 1, //当前页
        pageSize: 5, //当前每页最大数
      },
      goodslist: [],
      total: 0,
      addgoodsshow: false,
      editDialogVisible: false,
      innerVisible: false,
      addForm: {
        goodsname: "",
        category: "",
        price: "",
        goodsdescribe: "",
        goodstitle: "",
      },
      editForm: {
        goodsid: "",
        goodsname: "",
        category: "",
        nowprice: "",
        goodsdescribe: "",
        goodstitle: "",
      },
      fileList: [],
      addsize: "",
      addcount: "",
      choosegoodsid: "",
    };
  },
  created() {
    //请求数据库拿到所有数据
    this.getgoodslist();
    // testupgithup
  },
  methods: {
    getgoodslist() {
      //注意这里传递的是一个pageNum   不是pagestart
      goodspagequery(this.queryInfo.pageNum, this.queryInfo.pageSize).then(
        (res) => {
          // console.log(res);
          this.goodslist = res.data.data; // 将返回数据赋值
          this.total = res.data.numbers; // 总个数
          this.goodslist.forEach(function (x, index, a) {
            x.createTime = formatDatechange(x.createTime);
            x.updateTime = formatDatechange(x.updateTime);
          });
        }
      );
    }, //分页查询
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getgoodslist(); // 数据格式发生改变重新申请数据（因为显示出来的诗句是从数据库动态的取出来展示的）
    }, // 监听pageSize改变的事件       change事件会把newsize是组件内部封装，会自动取值当前选择的选项
    handleCurrentChange(newPage) {
      this.queryInfo.pageNum = newPage;
      this.getgoodslist(); // 数据格式发生改变重新申请数据
    }, // 监听pageNum改变的事件
    issell(id, name, targe) {
      attributechange(id, name, targe).then((res) => {
        res.data === "success"
          ? this.$message.success("商品状态切换成功~")
          : this.$message.error("商品状态切换失败");
        setadminlog(
          this.$store.state.user.username,
          "对货物编号为：" + id + "的货物进行了上下架切换，切换状态为" + targe
        );
      });
    }, //商品上下架管理（）
    querygoods() {
      if (this.queryInfo.query) {
        querygoods(this.queryInfo.query).then((res) => {
          this.goodslist = res.data;
        });
      } else {
        //未输入任何字符，进行刷新
        this.getgoodslist();
      }
    },
    manageoutgoods() {
      getoutgoods().then((res) => {
        this.goodslist = res.data;
      });
    },
    addgoods() {
      addgoods(
        this.addForm.goodsname,
        this.addForm.category,
        this.addForm.price,
        this.addForm.goodsdescribe,
        this.addForm.goodstitle
      ).then((res) => {
        // console.log(res.data);
        if (res.data == "success") this.$message.success("~addgoods Success~");
        else this.$message.warning("error！");
      });
      this.addgoodsshow = false;
    },
    editgoodsDialogClosed() {
      this.$refs.editFormRef.resetFields();
    }, // 修改商品的对话框关闭  ,窗口设置关闭自动刷新清空内容功能
    addgoodsDialogClosed() {
      this.$refs.addFormRef.resetFields();
    }, // 添加商品的对话框关闭  ,窗口设置关闭自动刷新清空内容功能
    editgoodsinfo(rowinfo) {
      // console.log(rowinfo);
      this.editForm = {
        goodsid: rowinfo.goodsid,
        goodsname: rowinfo.goodsname,
        category: rowinfo.category,
        nowprice: rowinfo.nowprice,
        goodsdescribe: rowinfo.goodsdescribe,
        goodstitle: rowinfo.goodstitle,
      };
      this.editDialogVisible = true;
    }, // 展示修改框（输入框内展示已经有的信息）
    editgoods() {
      editgoods(
        this.editForm.goodsid,
        this.editForm.goodsname,
        this.editForm.category,
        this.editForm.nowprice,
        this.editForm.goodsdescribe,
        this.editForm.goodstitle
      ).then((res) => {
        // console.log(res.data);
        if (res.data == "success") this.$message.success("~editgoods Success~");
        else this.$message.warning("error！");
        this.getgoodslist();
      });
      this.editDialogVisible = false;
    },
    addsizecountDialogClosed() {
      this.$refs.sizecountFormRef.resetFields();
      this.choosegoodsid = "";
    }, // 添加商品的对话框关闭  ,窗口设置关闭自动刷新清空内容功能
    addsizecountDialogShow(goodsid) {
      this.innerVisible = true;
      this.choosegoodsid = goodsid;
    }, // 添加商品的对话框打开
    addsizecount() {
      if (
        /^[\u4E00-\u9FA5A-Za-z0-9_]+$/.test(this.addsize) &&
        /^\+?[1-9][0-9]*$/.test(this.addcount)
      ) {
        // console.log(this.choosegoodsid);
        addsizecount(this.choosegoodsid, this.addsize, this.addcount).then(
          (res) => {
            if (res.data == "success") {
              this.$message.success("添加成功");
              this.getgoodslist(); //刷新数据
            } else this.$message.warning("添加失败，请检查尺码是否重复");
          }
        );
      } else {
        this.$message.warning("请按照格式输入对应的尺码和数量");
      }
    },
    editsizecount() {
      this.innerVisible = false;
    },
    editrestcount(goodsid, size, newrestcount) {
      // console.log(goodsid + "=====" + size + "=====" + newrestcount);
      // 空字符不执行请求，有输入就正则检查正整数并发送请求，并且清空输入，刷新数据
      if (newrestcount) {
        if (/^[0-9]*[1-9][0-9]*$/.test(newrestcount)) {
          editsizecount(goodsid, size, newrestcount).then((res) => {
            if (res.data == "success") {
              this.$message.success("修改成功");
              this.getgoodslist(); //刷新数据
            } else {
              this.$message.warning("修改失败");
              this.getgoodslist(); //刷新数据
            }
          });
        } else {
          this.$message.warning("输入正整数");
          this.getgoodslist(); //刷新数据
        }
      }
    },
    // 上传文件相关
    beforeupload(file) {},
    handleRemove(file, fileList) {},
    handlePreview(file) {},
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${
          files.length + fileList.length
        } 个文件`
      );
    },
    beforeRemove(file, fileList) {
      return this.$confirm(`确定移除 ${file.name}？`);
    },
    // 上传图片成功
    imgSuccess(res, file, fileList) {
      if (res == "success") {
        this.$message.success("~upload Success~");
        // let that = this;
        // setTimeout(function () {
        //   that.$router.go(0);
        // }, 500);
      } else {
        this.$message.warning("error！");
      }
    },
  },
};
</script>

<style scoped>
</style>