<template>
  <div class="dashboard-editor-container">
    <usecoupon></usecoupon>
  </div>
</template>

<script>
import {
  listCoupon,

} from "@/api/system/coupon";
import usecoupon from "./icharts/usecoupon.vue";

export default {
  name: "Coupon",
  components: {
    usecoupon
  },
  data() {
    return {

    };
  },
  created() {

  },
  methods: {

  },
};
</script>
<style lang="scss" scoped>
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
}

@media (max-width:1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}

