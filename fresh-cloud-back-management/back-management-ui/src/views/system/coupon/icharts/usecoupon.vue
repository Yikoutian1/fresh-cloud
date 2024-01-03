<template>
  <div :class="className" :style="{ height: height, width: width }" />
</template>

<script>
import * as echarts from "echarts";
require("echarts/theme/macarons"); // echarts theme
import resize from "./mixins/resize";

const colorList = ["#9E87FF", "#73DDFF", "#fe9a8b", "#F56948", "#9E87FF"];

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
      couponType: ["北京", "上海", "广州", "深圳", "香港", "澳门", "台湾"],
      titleText: "全国6月销售统计",
      coupon: {
        expired: [250, 220, 270, 240, 500, 260, 210],
        used: [150, 120, 170, 140, 500, 160, 110],
        nouse: [5, 12, 11, 14, 25, 16, 10],
        total: [10, 10, 30, 12, 15, 3, 7],
      },
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
      this.chart.setOption({
        backgroundColor: "#fff",
        title: {
          // 标题
          text: this.titleText,
          textStyle: {
            fontSize: 12,
            fontWeight: 400,
          },
          left: "center",
          top: "5%",
        },
        legend: {
          icon: "circle",
          bottom: "0%",
          right: "center",
          itemWidth: 6,
          itemGap: 20,
          textStyle: {
            color: "#556677",
          },
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            label: {
              show: true,
              backgroundColor: "#fff",
              color: "#556677",
              borderColor: "rgba(0,0,0,0)",
              shadowColor: "rgba(0,0,0,0)",
              shadowOffsetY: 0,
            },
            lineStyle: {
              width: 0,
            },
          },
          backgroundColor: "#fff",
          textStyle: {
            color: "#5c6c7c",
          },
          padding: [10, 10],
          extraCssText: "box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)",
        },
        grid: {
          top: "15%",
        },
        xAxis: [
          {
            type: "category",
            // 优惠券类型
            data: this.couponType,

            axisLine: {
              show: true,
              lineStyle: {
                color: "#f4f4f4",
              },
            },
            splitLine: {
              show: true,
              color: "#f0f0f0",
            },
            axisTick: {
              show: true,
              alignWithLabel: true,
            },
            axisLabel: {
              interval: 0,
              textStyle: {
                color: "#556677",
              },
              // 默认x轴字体大小
              fontSize: 12,
              // margin:文字到x轴的距离
              margin: 15,
              align: "center",
            },
            axisPointer: {
              label: {
                // padding: [11, 5, 7],
                padding: [0, 0, 10, 0],
                /*
                    除了padding[0]建议必须是0之外，其他三项可随意设置
                    和CSSpadding相同，[上，右，下，左]
                    如果需要下边线超出文字，设左右padding即可，注：左右padding最好相同
                    padding[2]的10:
                    10 = 文字距下边线的距离 + 下边线的宽度     
                    如：UI图中文字距下边线距离为7 下边线宽度为2
                    则padding: [0, 0, 9, 0]
                */
                // 这里的margin和axisLabel的margin要一致!
                margin: 15,
                // 移入时的字体大小
                fontSize: 12,
                backgroundColor: {
                  type: "linear",
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [
                    {
                      offset: 0,
                      color: "#fff", // 0% 处的颜色
                    },
                    {
                      // offset: 0.9,
                      offset: 0.86,
                      /*
0.86 = （文字 + 文字距下边线的距离）/（文字 + 文字距下边线的距离 + 下边线的宽度）
                        
                        */
                      color: "#fff", // 0% 处的颜色
                    },
                    {
                      offset: 0.86,
                      color: "#33c0cd", // 0% 处的颜色
                    },
                    {
                      offset: 1,
                      color: "#33c0cd", // 100% 处的颜色
                    },
                  ],
                  global: false, // 缺省为 false
                },
              },
            },

            boundaryGap: false,
          },
        ],

        yAxis: [
          {
            type: "value",
            axisTick: {
              show: false,
            },
            axisLine: {
              show: true,
              lineStyle: {
                color: "#DCE2E8",
              },
            },
            axisLabel: {
              textStyle: {
                color: "#556677",
              },
            },
            // 分割线
            splitLine: {
              lineStyle: {
                type: "dashed",
                color: "#E9E9E9",
              },
            },
          },
          {
            type: "value",
            // position: 'right',
            axisTick: {
              show: false,
            },
            axisLabel: {
              textStyle: {
                color: "#556677",
              },
              formatter: "{value}",
            },
            axisLine: {
              show: false,
              lineStyle: {
                color: "#DCE2E8",
              },
            },
            splitLine: {
              show: false,
            },
          },
        ],
        series: [
          {
            name: "优惠券总数",
            type: "line",
            data: this.coupon.total,
            symbolSize: 1,
            symbol: "circle",
            smooth: true,
            yAxisIndex: 0,
            showSymbol: false,
            lineStyle: {
              width: 2,
              color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                {
                  offset: 0,
                  color: "#9effff",
                },
                {
                  offset: 1,
                  color: "#9E87FF",
                },
              ]),
            },
            itemStyle: {
              normal: {
                color: colorList[0],
                borderColor: colorList[0],
              },
            },
          },
          {
            name: "未使用数量",
            type: "line",
            data: this.coupon.nouse,
            symbolSize: 1,
            symbol: "circle",
            smooth: true,
            yAxisIndex: 0,
            showSymbol: false,
            lineStyle: {
              width: 2,
              color: new echarts.graphic.LinearGradient(1, 1, 0, 0, [
                {
                  offset: 0,
                  color: "#73DD39",
                },
                {
                  offset: 1,
                  color: "#73DDFF",
                },
              ]),
            },
            itemStyle: {
              normal: {
                color: colorList[1],
                borderColor: colorList[1],
              },
            },
          },
          {
            name: "已使用数量",
            type: "line",
            data: this.coupon.used,
            symbolSize: 1,
            yAxisIndex: 1,
            symbol: "circle",
            smooth: true,
            showSymbol: false,
            lineStyle: {
              width: 2,
              color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                {
                  offset: 0,
                  color: "#fe9a",
                },
                {
                  offset: 1,
                  color: "#fe9a8b",
                },
              ]),
            },
            itemStyle: {
              normal: {
                color: colorList[2],
                borderColor: colorList[2],
              },
            },
          },
          {
            name: "过期数量",
            type: "line",
            data: this.coupon.expired,
            symbolSize: 1,
            yAxisIndex: 1,
            symbol: "circle",
            smooth: true,
            showSymbol: false,
            lineStyle: {
              width: 2,
              color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                {
                  offset: 0,
                  color: "#fe9a",
                },
                {
                  offset: 1,
                  color: "#fe9a8b",
                },
              ]),
            },
            itemStyle: {
              normal: {
                color: colorList[2],
                borderColor: colorList[2],
              },
            },
          },
        ],
      });
    },
  },
};
</script>
