package com.fresh.coupon.service.impl;

import com.fresh.common.entity.MemberQiangCoupon;
import com.fresh.coupon.mapper.couponMapper;
import com.fresh.coupon.service.CouponService;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @program: fresh-cloud
 * @description:
 * @author: ChestnutDuck
 * @create: 2023-12-27 20:55
 **/
@Service
public class CouponServiceImpl implements CouponService {

}
