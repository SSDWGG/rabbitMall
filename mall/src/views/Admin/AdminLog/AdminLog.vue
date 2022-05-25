<template>
  <div>
    <el-row :gutter="25">
      <el-col :span="10">
        <el-input placeholder="管理员姓名" v-model="adminname">
          <el-button
            slot="append"
            icon="el-icon-search"
            @click="loglistbyname(adminname)"
          >查询or刷新</el-button>
        </el-input>
      </el-col>
    </el-row>

    <el-row :gutter="25">
      <el-col>
        <div class="block">
          <el-date-picker
            v-model="value"
            type="datetimerange"
            align="right"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            :default-time="['12:00:00', '08:00:00']"
            @change="onSubmit"
          >
          </el-date-picker>
        </div>
      </el-col>
    </el-row>

    <el-table :data="loglist" border stripe>
      <el-table-column type="index"></el-table-column>
      <el-table-column label="admin name" prop="adminname"></el-table-column>
      <el-table-column label="操作" prop="adminactive"></el-table-column>
      <el-table-column label="time" prop="createTime"></el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getadminloglist } from "@/network/admin2";
import {
  deepCopyAdvanced,
  formatDatechange,
  mohuquerylistobj,
  sortarrayobj,
} from "@/common/utils";

export default {
  name: "AdminLog",
  created() {
    this.getadminloglist();
  },
  data() {
    return {
      adminname: "",
      value: "",
      loglist: [],
      loglistall: [], //暂存全部信息
    };
  },
  methods: {
    standardizationlist(list) {
      //排序
      sortarrayobj(list, "createTime", 1);
      //时间格式转化
      list.forEach(function (x, index, a) {
        x.createTime = formatDatechange(x.createTime);
        x.updateTime = formatDatechange(x.updateTime);
      });
      return list;
    },
    getadminloglist() {
      //获取全部的adminlog信息
      getadminloglist().then((res) => {
        this.loglistall = deepCopyAdvanced(res.data); //如果要对拿到的数据进行处理的，最好可以做一个数据备份
        this.loglist = res.data;
        this.standardizationlist(this.loglist);
      });
    },
    loglistbyname(name) {
      let list = deepCopyAdvanced(this.loglistall);
      this.loglist = mohuquerylistobj(list, name, "adminname");
      //查询出来的结果进行（根据时间戳排序，转换时间戳）
      this.standardizationlist(this.loglist);
    }, //  通过管理员姓名模糊筛选
    onSubmit(time) {
      //提交搜索
      if (!!time) {
        let list = deepCopyAdvanced(this.loglistall);
        //时间格式转换成时间戳格式进行比较

        this.loglist = list.filter(function (x, index) {
          return (
            x.createTime > Number(time[0]) && x.createTime < Number(time[1])
          );
        });
        this.standardizationlist(this.loglist);
      } else {
        //清空按钮
        let list = deepCopyAdvanced(this.loglistall);
        this.loglist = this.standardizationlist(list);
      }
    },
  },
};
</script>

<style scoped>
</style>