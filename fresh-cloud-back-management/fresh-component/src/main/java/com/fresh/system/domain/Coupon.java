package com.fresh.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 优惠券对象 coupon
 *
 * @author ruoyi
 * @date 2023-12-26
 */
public class Coupon extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 优惠券编号
     */
    private Long id;

    /**
     * 优惠卷标题
     */
    @Excel(name = "优惠卷标题")
    private String title;

    /**
     * 优惠卷的图片信息
     */
    @Excel(name = "优惠卷的图片信息")
    private String img;

    /**
     * 优惠卷的金额
     */
    @Excel(name = "优惠卷的金额")
    private String money;

    /**
     * 优惠卷描述
     */
    @Excel(name = "优惠卷描述")
    private String desc;

    /**
     * 用户能抢到的最大数量
     */
    @Excel(name = "用户能抢到的最大数量")
    private String limitnum;

    /**
     * 使用优惠券的最低金额
     */
    @Excel(name = "使用优惠券的最低金额")
    private String limit;

    /**
     * 优惠卷开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "优惠卷开始时间" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date start;

    /**
     * 优惠卷到期时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "优惠卷到期时间" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date end;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getMoney() {
        return money;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public void setLimitnum(String limitnum) {
        this.limitnum = limitnum;
    }

    public String getLimitnum() {
        return limitnum;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }

    public String getLimit() {
        return limit;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getStart() {
        return start;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Date getEnd() {
        return end;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id" , getId())
                .append("title" , getTitle())
                .append("img" , getImg())
                .append("money" , getMoney())
                .append("desc" , getDesc())
                .append("limitnum" , getLimitnum())
                .append("limit" , getLimit())
                .append("start" , getStart())
                .append("end" , getEnd())
                .toString();
    }
}
