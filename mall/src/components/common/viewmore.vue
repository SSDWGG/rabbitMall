<template>
  <div class="viewmore" style="cursor: pointer">
    <p>{{ $t("common.viewmore") }}</p>
  </div>
</template>

<script>
export default {
  name: "viewmore",
};
</script>

<style scoped>
.viewmore {
  width: 27vw;
  height: 7vw;
  border-radius: 7vw;
  border: 0.5px solid rgba(12, 12, 12, 0.1);
  /*border: .1px solid #8c8c8c;*/
  box-shadow: 7px 0px 2px rgba(12, 12, 12, 0.1);
  display: flex;
  align-self: center;
  justify-content: center;
  margin: 0 auto;
}
p {
  line-height: 7vw;
  font-size: 3.6vw;
  font-weight: 500;
  font-family: monospace;
}
.viewmore:hover {
  border: 0.1px solid #8c8c8c;
}
</style>