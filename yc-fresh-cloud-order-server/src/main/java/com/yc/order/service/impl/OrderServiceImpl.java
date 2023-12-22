package com.yc.order.service.impl;

import com.codingapi.txlcn.tc.annotation.LcnTransaction;
import com.yc.common.entity.OrderInfo;
import com.yc.common.util.StringUtil;
import com.yc.index.controller.cart.ICartInfoControllerApi;
import com.yc.index.controller.goods.IGoodsInfoControllerApi;
import com.yc.order.mapper.IOrderInfoMapper;
import com.yc.order.mapper.IOrderItemInfoMapper;
import com.yc.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @program: yc-fresh-cloud
 * @description: 订单管理
 */
@Primary
@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private IOrderInfoMapper orderMapper;

    @Autowired
    private IOrderItemInfoMapper itemMapper;

    @Autowired
    private ICartInfoControllerApi iCartInfoControllerApi;

    @Autowired
    private IGoodsInfoControllerApi iGoodsInfoControllerApi;

    /*
     * service层需要进行的操作
     * 创建一个订单
     * 将选中的商品插入到订单详细表中
     * 修改对应商品的库存量
     * 将选中的商品从购物车中删除
     * 这四个操作要求同时成功同时失败，即必须加上事务
     */
    @Override
    @LcnTransaction
    public int add(OrderInfo of) {
        if (StringUtil.checkNull(of.getOno(), of.getAno())) {
            return -2;
        }
        String cnos = of.getOno();
        String ono = System.currentTimeMillis() + "" + new Random().nextInt(9999); // 生成订单编号
        of.setOno(ono);

        Integer result = -1;
        result = orderMapper.add(of);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("ono", ono);
        map.put("cnos", cnos.split(","));
        result = itemMapper.add(map);

        result = iGoodsInfoControllerApi.compileStore(cnos);

        result = iCartInfoControllerApi.decrease(cnos.split(","));
        return result;
    }

}
