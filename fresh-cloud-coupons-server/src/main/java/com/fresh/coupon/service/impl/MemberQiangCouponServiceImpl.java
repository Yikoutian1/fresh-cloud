package com.fresh.coupon.service.impl;

import com.fresh.common.entity.MemberQiangCoupon;
import com.fresh.coupon.mapper.MemberQiangCouponMapper;
import com.fresh.coupon.mapper.couponMapper;
import com.fresh.coupon.service.MemberQiangCouponService;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-28 15:03
 **/
@Service
public class MemberQiangCouponServiceImpl implements MemberQiangCouponService {
    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    public MemberQiangCouponMapper memberQiangCouponMapper;

    @Override
    @RabbitListener(bindings = @QueueBinding(
            value = @Queue(name="fresh.queue",durable = "true"),//是否可持续化
            exchange = @Exchange(name = "fresh.direct",type= ExchangeTypes.DIRECT),
            key = {"addMAndC"}
    ))
    public void addMemberQiangCoupon(Map<String,Object> data) {
        String uid = data.get("uid")+"";
        String cid = data.get("cid") + "";
        System.err.println("收到的参数为"+data);
        MemberQiangCoupon memberQiangCoupon=new MemberQiangCoupon(Integer.parseInt(uid),Integer.parseInt(cid),1);
        this.memberQiangCouponMapper.insert(memberQiangCoupon);
        String exchange="fresh.direct";
        String msg="一张优惠卷以入库";
        this.rabbitTemplate.convertAndSend(exchange,"userMsg",msg); //会根据你提供的不同的RoutingKey 去决定发
    }
}
