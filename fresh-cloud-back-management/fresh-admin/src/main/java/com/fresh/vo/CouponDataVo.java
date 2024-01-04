package com.fresh.vo;

import java.util.List;

/**
 * @ClassName CouponDataVo
 * @Description 优惠券情况
 * @Author Calyee
 * @DATE 2024/01/04 004 18:57
 * @Version 1.0
 */

public class CouponDataVo {
    private List<String> couponType;
    private String titleText;

    /**
     * 过期
     */
    private List<Integer> expired;
    /**
     * 使用了的
     */
    private List<Integer> used;
    /**
     * 没有使用
     */
    private List<Integer> nouse;
    /**
     * 总数
     */
    private List<Integer> total;

    @Override
    public String toString() {
        return "CouponDataVo{" +
                "couponType=" + couponType +
                ", titleText='" + titleText + '\'' +
                ", expired=" + expired +
                ", used=" + used +
                ", nouse=" + nouse +
                ", total=" + total +
                '}';
    }

    public List<String> getCouponType() {
        return couponType;
    }

    public void setCouponType(List<String> couponType) {
        this.couponType = couponType;
    }

    public String getTitleText() {
        return titleText;
    }

    public void setTitleText(String titleText) {
        this.titleText = titleText;
    }

    public List<Integer> getExpired() {
        return expired;
    }

    public void setExpired(List<Integer> expired) {
        this.expired = expired;
    }

    public List<Integer> getUsed() {
        return used;
    }

    public void setUsed(List<Integer> used) {
        this.used = used;
    }

    public List<Integer> getNouse() {
        return nouse;
    }

    public void setNouse(List<Integer> nouse) {
        this.nouse = nouse;
    }

    public List<Integer> getTotal() {
        return total;
    }

    public void setTotal(List<Integer> total) {
        this.total = total;
    }
}
