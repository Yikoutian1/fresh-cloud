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
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
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
    public void addMemberQiangCoupon(Map<String,Object> msg) {
        String uid=String.valueOf(msg.get("uid"));
        String cid=String.valueOf(msg.get("cid"));
        MemberQiangCoupon memberQiangCoupon=new MemberQiangCoupon(Integer.parseInt(uid),Integer.parseInt(cid),1,null);
        this.memberQiangCouponMapper.insert(memberQiangCoupon);
    }
}
