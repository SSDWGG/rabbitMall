<template>
  <div class="sizetable">
    <div class="head">
      <p style="color: rgba(0, 0, 0, 0.9)">
        {{ $t("common.size") }}/{{ $t("common.rest") }}
      </p>
      <div class="table">
        <button
          class="tableitem"
          v-for="(item, index) in sizecountlist"
          :key="index"
          :style="
            index === currentindex
              ? { border: '1px solid rgba(0,0,0,0.6)', color: 'red' }
              : { border: '1px solid #ccc' }
          "
          @click="clickitem(index)"
          :disabled="item.restcount == 0"
        >
          <p>{{ $t("common.size") }}:{{ item.size }}</p>
          <!-- <p>/{{ $t("common.rest") }}:{{ item.restcount }}</p> -->
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "sizetable",
  data() {
    return {
      currentindex: 999999,
    };
  },
  props: {
    sizecountlist: {
      type: Array,
      default() {
        return [];
      },
    },
  },
  methods: {
    clickitem(index) {
      if (index == this.currentindex) {
        this.currentindex = 9999999;
        this.$emit("size", 9999999);
      } else {
        this.currentindex = index;
        this.$emit("size", this.sizecountlist.slice(index, ++index)[0].size);
      }
    },
  },
};
</script>

<style lang="less"scoped>
.sizetable {
  width: 100%;
  padding: 0 5%;
  margin: 20px 0;
  p {
    display: inline-block;
    font-weight: 300;
  }
}
.table {
  width: 100%;
  display: flex;
  justify-content: left;
  flex-wrap: wrap;
  .tableitem {
    margin: 8px;
    background-color: rgba(247, 247, 247, 0);
    border-radius: 4%;
    width: 10rem;
    height: 4rem;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 2px 0px 2px rgba(12, 12, 12, 0.1);
    font-family: monospace;
  }
}

button:active {
  color: #000;
}
</style>