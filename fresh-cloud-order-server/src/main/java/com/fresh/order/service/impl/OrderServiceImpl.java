package com.fresh.order.service.impl;


import com.fresh.client.CartInfoClient;
import com.fresh.common.entity.*;
import com.fresh.common.model.GoodModel;
import com.fresh.common.util.StringUtil;
import com.fresh.coupon.mapper.MemberQiangCouponMapper;
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
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

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
    private IOrderItemInfoMapper iOrderItemInfoMapper;

    @Autowired
    private IOrderItemInfoMapper itemMapper;
    @Autowired
    private MemberQiangCouponMapper memberQiangCouponMapper;
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
    public Map<String,Object> add(OrderInfo of ,HttpSession session) {
        Map<String,Object> map=new HashMap<>();
        if (StringUtil.checkNull( of.getAno())) {
            map.put("msg","暂未选择收获地址");
            map.put("code",-2);
            return map;
        }
        MemberInfo member = (MemberInfo) session.getAttribute("loginMember");
        Integer uid=member.getMno();
        String ono = System.currentTimeMillis() + "" + new Random().nextInt(9999); // 生成订单编号
        of.setOno(ono);
        of.setInvoice(0);

        if (of.getIscoupon()==0){
            of.setRealprice(of.getPrice());
            int add = orderMapper.addOrder(of);
        }else {
            of.setRealprice(of.getPrice()-of.getCouponprice());
            int add = orderMapper.add(of);
        }
        if (session.getAttribute("cartInfos")!=null){
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
                session.removeAttribute("cartInfos");
            });
        }if (session.getAttribute("orderInfos")!=null){
            List<GoodModel> orderInfos = (List<GoodModel>) session.getAttribute("orderInfos");
            orderInfos.forEach(result->{
                Integer gno = result.getGno();
                Integer num = result.getNum();
                double price = result.getPrice();
                OrderItemInfo orderItemInfo=new OrderItemInfo();
                orderItemInfo.setGno(gno);
                orderItemInfo.setOno(ono);
                orderItemInfo.setNums(num);
                orderItemInfo.setPrice(price);
                itemMapper.add(orderItemInfo);
                iGoodsInfoMapper.updateGoodsNum(gno,num);
                session.removeAttribute("orderInfos");
            });
        }
        if (of.getIscoupon()!=0){
            memberQiangCouponMapper.updateCouponStatus(uid,of.getIscoupon(),1);
        }

        map.put("code",1);
        map.put("msg","下单成功");
        return map;
    }
    @Override
    public Map<String, Object> queryEcharts(String date) {
        Map<String,Object> map=new HashMap<>();
        List<String> Times = orderMapper.queryTime(date);
        List<String> DateTimes = orderMapper.queryDateTime();
        List<Integer> nums=new ArrayList<>();
        List<Long> prices=new ArrayList<>();
        List<Map<String,Object>> option=new ArrayList<>();
        for (String dateTime : DateTimes) {
            Map<String,Object> op=new HashMap<>();
            op.put("value",dateTime);
            op.put("label",dateTime+"月");
            option.add(op);
        }
        for (String Time : Times) {
            List<String> list = orderMapper.queryOno(Time);
            Integer numTotal=0;
            Long price=orderMapper.queryPrice(Time);
            for (int i = 0; i < list.size(); i++) {

                Integer num = iOrderItemInfoMapper.queryNum(list.get(i));
                numTotal+=num;
            }
            nums.add(numTotal);
            prices.add(price);
        }
        map.put("Times",Times);
        map.put("nums",nums);
        map.put("prices",prices);
        map.put("options",option);
        return  map;
    }

    @Override
    public Map<String, Object> queryGoodsNum(String date) {
        Map<String,Object> map=new HashMap<>();
        List<String> Times = orderMapper.queryTime(date);  //查询每日
        List<String> DateTimes = orderMapper.queryDateTime(); //查询每月
        List<Integer> gnoNow=new ArrayList<>();
        Map<String,Integer> gnoAndNummap=new HashMap<>();
        List<Map<String,Object>> option=new ArrayList<>();
        for (String dateTime : DateTimes) {
            Map<String,Object> op=new HashMap<>();
            op.put("value",dateTime); //传给前端的选项
            op.put("label",dateTime+"月");
            option.add(op);
        }
        for (String Time : Times) {
            List<String> list = orderMapper.queryOno(Time); //当前时间的订单号
             //存查到的gno 为了后面遍历map
            for (int i = 0; i < list.size(); i++) {
                List<Integer> gnos = iOrderItemInfoMapper.queryGno(list.get(i)); //查询该订单购买的商品
                for (Integer gno : gnos) {
                    Integer numsByGnoAndOno = iOrderItemInfoMapper.queryNumsByGnoAndOno(list.get(i), gno);//根据订单和商品编号查数量
                    if (gnoAndNummap.get(gno+"") != null) { //判断map里是否查过这个gno
                        gnoAndNummap.put(gno+"", numsByGnoAndOno + gnoAndNummap.get(gno+""));
                    } else {
                        gnoAndNummap.put(gno+"", numsByGnoAndOno);
                        gnoNow.add(gno);
                    }
                }
            }
        }
        List<String > GoodsName=new ArrayList<>(); //存放热销商品名称
        List<Integer > GoodsNum=new ArrayList<>(); //存放热销商品数量
        for (Integer s : gnoNow) {
            GoodsInfo byGno = iGoodsInfoMapper.findByGno(s);
            String gname = byGno.getGname();
            Integer num = gnoAndNummap.get(s+"");
            GoodsName.add(gname);
            GoodsNum.add(num);
        }
        map.put("num",GoodsNum);
        map.put("gname",GoodsName);
        map.put("options",option);
        return map;
    }
}
