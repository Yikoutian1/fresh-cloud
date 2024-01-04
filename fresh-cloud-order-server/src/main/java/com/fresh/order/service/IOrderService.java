package com.fresh.order.service;

import com.fresh.common.entity.OrderInfo;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @program: yc-fresh-cloud
 * @description: 订单管理
 */
public interface IOrderService {
    /**
     * 下单的方法
     * @param of
     * @return
     */
    public Map<String,Object> add(OrderInfo of, HttpSession session);
    /**
     * 查询年销售额
     */
    public Map<String,Object>  queryEcharts(String date);

    /**
     * 查询热销商品
     * @param date
     * @return
     */
    public Map<String,Object>  queryGoodsNum(String date);


}
