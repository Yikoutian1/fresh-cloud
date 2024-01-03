<template>
  <div :class="className" :style="{ height: height, width: width }" />
</template>

<script>
import * as echarts from "echarts";
require("echarts/theme/macarons"); // echarts theme
import resize from "./mixins/resize";

export default {
  mixins: [resize],
  props: {
    className: {
      type: String,
      default: "chart",
    },
    width: {
      type: String,
      default: "100%",
    },
    height: {
      type: String,
      default: "350px",
    },
  },
  data() {
    return {
      chart: null,
    };
  },
  watch: {
    chartData: {
      deep: true,
      handler(val) {
        this.setOptions(val);
      },
    },
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart();
    });
  },
  beforeDestroy() {
    if (!this.chart) {
      return;
    }
    this.chart.dispose();
    this.chart = null;
  },
  methods: {
    initChart() {
      this.chart = echarts.init(this.$el, "macarons");
      this.setOptions(this.chartData);
    },
    setOptions() {
      labelTop = {
        normal: {
          label: {
            show: true,
            position: "center",
            formatter: "{b}",
            textStyle: {
              baseline: "bottom",
            },
          },
          labelLine: {
            show: false,
          },
        },
      };
      var labelFromatter = {
        normal: {
          label: {
            formatter: function (params) {
              return 100 - params.value + "%";
            },
            textStyle: {
              baseline: "top",
            },
          },
        },
      };
      var labelBottom = {
        normal: {
          color: "#ccc",
          label: {
            show: true,
            position: "center",
          },
          labelLine: {
            show: false,
          },
        },
        emphasis: {
          color: "rgba(0,0,0,0)",
        },
      };
      var radius = [40, 55];
      this.chart.setOption({
        legend: {
          x: "center",
          y: "center",
          data: [
            "剧情",
            "奇幻",
            "爱情",
            "惊悚",
            "冒险",
            "动作",
            "喜剧",
            "科幻",
            "悬疑",
            "犯罪",
          ],
        },
        title: {
          text: "各类型电影中“好片”所占比重",
          subtext: "原始数据来自豆瓣",
          x: "center",
        },
        toolbox: {
          show: true,
          feature: {
            dataView: { show: true, readOnly: false },
            magicType: {
              show: true,
              type: ["pie", "funnel"],
              option: {
                funnel: {
                  width: "20%",
                  height: "30%",
                  itemStyle: {
                    normal: {
                      label: {
                        formatter: function (params) {
                          return "other\n" + params.value + "%\n";
                        },
                        textStyle: {
                          baseline: "middle",
                        },
                      },
                    },
                  },
                },
              },
            },
            restore: { show: true },
            saveAsImage: { show: true },
          },
        },
        series: [
          {
            type: "pie",
            center: ["10%", "30%"],
            radius: radius,
            x: "0%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 75, itemStyle: labelBottom },
              { name: "剧情", value: 25, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["30%", "30%"],
            radius: radius,
            x: "20%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 76, itemStyle: labelBottom },
              { name: "奇幻", value: 24, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["50%", "30%"],
            radius: radius,
            x: "40%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 86, itemStyle: labelBottom },
              { name: "爱情", value: 14, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["70%", "30%"],
            radius: radius,
            x: "60%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 89, itemStyle: labelBottom },
              { name: "惊悚", value: 11, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["90%", "30%"],
            radius: radius,
            x: "80%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 73, itemStyle: labelBottom },
              { name: "冒险", value: 27, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["10%", "70%"],
            radius: radius,
            y: "55%", // for funnel
            x: "0%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 85, itemStyle: labelBottom },
              { name: "动作", value: 15, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["30%", "70%"],
            radius: radius,
            y: "55%", // for funnel
            x: "20%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 46, itemStyle: labelBottom },
              { name: "喜剧", value: 54, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["50%", "70%"],
            radius: radius,
            y: "55%", // for funnel
            x: "40%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 74, itemStyle: labelBottom },
              { name: "科幻", value: 26, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["70%", "70%"],
            radius: radius,
            y: "55%", // for funnel
            x: "60%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 75, itemStyle: labelBottom },
              { name: "悬疑", value: 25, itemStyle: labelTop },
            ],
          },
          {
            type: "pie",
            center: ["90%", "70%"],
            radius: radius,
            y: "55%", // for funnel
            x: "80%", // for funnel
            itemStyle: labelFromatter,
            data: [
              { name: "other", value: 72, itemStyle: labelBottom },
              { name: "犯罪", value: 28, itemStyle: labelTop },
            ],
          },
        ],
      });
    },
  },
};
</script>
