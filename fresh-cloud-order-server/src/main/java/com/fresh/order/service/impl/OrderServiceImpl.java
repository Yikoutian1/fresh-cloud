package com.fresh.order.service.impl;


import com.fresh.client.CartInfoClient;
import com.fresh.client.GoodsClient;
import com.fresh.common.entity.CartInfo;
import com.fresh.common.entity.OrderInfo;
import com.fresh.common.entity.OrderItemInfo;
import com.fresh.common.util.StringUtil;
import com.fresh.goods.mapper.IGoodsInfoMapper;
import com.fresh.order.mapper.IOrderInfoMapper;
import com.fresh.order.mapper.IOrderItemInfoMapper;
import com.fresh.order.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @program: fresh-cloud
 * @description: 订单管理
 */
@Primary
@Service
public class  OrderServiceImpl implements IOrderService {

    @Autowired
    private IOrderInfoMapper orderMapper;

    @Autowired
    private IOrderItemInfoMapper itemMapper;

    @Autowired
    private CartInfoClient iCartInfoControllerApi;
    @Autowired
    private IGoodsInfoMapper iGoodsInfoMapper;

//    @Autowired
//    private GoodsClient iGoodsInfoControllerApi;

    /*
     * service层需要进行的操作
     * 创建一个订单
     * 将选中的商品插入到订单详细表中
     * 修改对应商品的库存量
     * 将选中的商品从购物车中删除
     * 这四个操作要求同时成功同时失败，即必须加上事务
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED,
            rollbackFor= RuntimeException.class,
            readOnly = false,
            timeout = 2000)
    // @LcnTransaction
    public int add(OrderInfo of ,HttpSession session) {
        if (StringUtil.checkNull( of.getAno())) {
            return -2;
        }
        String ono = System.currentTimeMillis() + "" + new Random().nextInt(9999); // 生成订单编号
        of.setOno(ono);
        of.setInvoice(0);
        int add = orderMapper.add(of);
        List<CartInfo> cartInfos = (List<CartInfo>) session.getAttribute("cartInfos");
        cartInfos.forEach(result->{
            Integer gno = result.getGno();
            Integer num = result.getNum();
            double price = result.getPrice();
            OrderItemInfo orderItemInfo=new OrderItemInfo();
            orderItemInfo.setGno(gno);
            orderItemInfo.setOno(ono);
            orderItemInfo.setNums(num);
            orderItemInfo.setPrice(price);
            itemMapper.add(orderItemInfo);
            iCartInfoControllerApi.deleteCartGoodsByCno(result.getCno());
            iGoodsInfoMapper.updateGoodsNum(gno,num);
        });
        session.removeAttribute("cartInfos");
        return 1;
    }
}
