package com.fresh.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fresh.common.entity.MemberQiangCoupon;
import com.fresh.common.model.CouponModel;
import com.fresh.coupon.mapper.MemberQiangCouponMapper;
import com.fresh.coupon.service.CouponService;
import com.fresh.coupon.service.MemberQiangCouponService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
@Slf4j
public class MemberQiangCouponServiceImpl extends ServiceImpl<MemberQiangCouponMapper,MemberQiangCoupon> implements MemberQiangCouponService {

    @Resource
    private RabbitTemplate rabbitTemplate;

    @Resource
    private MemberQiangCouponMapper memberQiangCouponMapper;
    @Autowired
    private CouponService couponService;
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

    @Override
    public Map<String, Object> getCouponByUid(Integer uid) {
        Map<String, Object> map = new HashMap<>();
        LambdaQueryWrapper<MemberQiangCoupon> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(MemberQiangCoupon::getUid,uid);
        List<MemberQiangCoupon> list = list(queryWrapper);
        List<CouponModel > modelList=new ArrayList<>();
        list.forEach(result->{
            CouponModel couponModel=new CouponModel();
            couponModel.setUid(uid);
            couponModel.setStatus(result.getStatus());

            Integer cid = result.getCid();
            couponModel.setCoupon(couponService.getCouponInfoByCid(cid));
            modelList.add(couponModel);
        });
        map.put("data",modelList);
        return map;
    }

}
