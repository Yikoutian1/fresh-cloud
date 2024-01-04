<template>
  <div class="dashboard-editor-container">
    <usecoupon></usecoupon>
    <iframe
      style="height: 1000px; width: 100%; color: #fff;"
      src="http://localhost:20001/test"
    ></iframe>
  </div>
</template>

<script>
import * as echarts from "echarts";
import axios from "axios";
require("echarts/theme/macarons"); // echarts theme
import usecoupon from "./icharts/usecoupon.vue";

export default {
  name: "Coupon",
  components: {
    usecoupon,
  },
  data() {
    return {
      option2: {
        title: {
          text: "收益详情",
          subtext: "",
        },
        color: ["#61a0a8"],
        xAxis: {
          type: "category",
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            name: "详情",
            type: "bar",
            smooth: true,
            data: [120, 200, 150, 80, 70, 110, 130],
            barWidth: "40%",
            label: {
              show: true,
            },
          },
        ],
      },
      options2: [
        {
          value: "选项1",
          label: "黄金糕",
        },
        {
          value: "选项2",
          label: "双皮奶",
        },
        {
          value: "选项3",
          label: "蚵仔煎",
        },
        {
          value: "选项4",
          label: "龙须面",
        },
        {
          value: "选项5",
          label: "北京烤鸭",
        },
      ],
      options: [
        {
          value: "选项1",
          label: "黄金糕",
        },
        {
          value: "选项2",
          label: "双皮奶",
        },
        {
          value: "选项3",
          label: "蚵仔煎",
        },
        {
          value: "选项4",
          label: "龙须面",
        },
        {
          value: "选项5",
          label: "北京烤鸭",
        },
      ],
      value: "",
      value2: "",
      option: {
        title: {
          text: "收益详情",
          subtext: "",
        },
        tooltip: {
          trigger: "axis",
        },
        legend: {
          data: ["下单数", "收益"],
        },
        // toolbox: {
        //     show: true,
        //     feature: {
        //         magicType: { show: true, type: ['stack', 'tiled'] },
        //         saveAsImage: { show: true }
        //     }
        // },
        xAxis: {
          type: "category",
          boundaryGap: false,
          data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            name: "收益",
            type: "line",
            smooth: true,
            data: [10, 12, 21, 54, 260, 830, 710],
          },
          {
            name: "下单数",
            type: "line",
            smooth: true,
            data: [30, 182, 434, 791, 390, 30, 10],
          },
        ],
      },
    };
  },
  watch: {
    value(newValue) {
      this.initEcharts();
    },
    value2(newValue) {
      this.initEcharts2();
    },
  },
  mounted() {
    this.getDate();
  },
  beforeDestroy() {
    if (!this.chart) {
      return;
    }
    this.chart.dispose();
    this.chart = null;
  },
  methods: {
    initEcharts() {
      var myChart = echarts.init(document.getElementById("main"));
      var param = new URLSearchParams();
      param.append("date", this.value);
      axios.post("/order/queryEcharts", param).then((res) => {
        this.option.xAxis.data = res.data.Times;
        this.option.series[0].data = res.data.prices;
        this.option.series[1].data = res.data.nums;
        this.option.title.text = this.value + "月收益情况";
        this.options = res.data.options;
        myChart.setOption(this.option);
      });
    },
    initEcharts2() {
      var myChart2 = echarts.init(document.getElementById("main2"));
      var param = new URLSearchParams();
      param.append("date", this.value2);
      axios.post("/order/queryGoodsNumAndName", param).then((res) => {
        this.option2.xAxis.data = res.data.gname;
        this.option2.series[0].data = res.data.num;
        this.option2.title.text = this.value2 + "月商品出售情况";
        this.options2 = res.data.options;
        myChart2.setOption(this.option2);
      });
    },
    getDate() {
      var date = new Date();
      let fullYear = date.getFullYear();
      let month = date.getMonth() + 1;
      if (month < 10) {
        month = "0" + month;
      }
      this.value = fullYear + "-" + month;
      this.value2 = fullYear + "-" + month;
      // this.initEcharts()
    },
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

@media (max-width: 1024px) {
  .chart-wrapper {
    padding: 8px;
  }
}
</style>
