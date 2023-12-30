package com.fresh.enums;

/**
 * @ClassName StaticEnums
 * @Description 一些枚举类
 * @Author Calyee
 * @DATE 2023/12/29 029 17:16
 * @Version 1.0
 */

public class StaticEnums {
    /**
     * 最外层标识 优惠券唯一
     */
    public final static String c_cid = "COUPON_CID_";
    /**
     * 用户列表
     */
    public final static String c_uid = "COUPON_GRAB_UID_";
    /**
     * 优惠券数量
     */
    public final static String c_num = "COUPON_CID_NUM_";
    /**
     * 优惠券开始时间
     */
    public final static String start_time = "time";

    /**
     * 优惠券结束时间
     */
    public final static String end_time = "END_TIME";

    /**
     * 分钟标识
     */
    public final static String minute = "5";


    /**
     * cron表达式
     */
    public final static String cron_string = "0 */" + minute + " * * * ?";

    /**
     * cron表达式  测试 5秒一次
     */
    public final static String cron_test = "0/20 * * * * ? ";
    /**
     * 数量为 0
     */
    public final static Integer zero = 0;
}
