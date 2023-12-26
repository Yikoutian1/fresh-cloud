package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 商品信息对象 goodsinfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Goodsinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 商品编号
     */
    private Long gno;

    /**
     * 商品名
     */
    @Excel(name = "商品名")
    private String gname;

    /**
     * 商品类型
     */
    @Excel(name = "商品类型")
    private Long tno;

    /**
     * 价格
     */
    @Excel(name = "价格")
    private BigDecimal price;

    /**
     * 介绍
     */
    @Excel(name = "介绍")
    private String intro;

    /**
     * 数量
     */
    @Excel(name = "数量")
    private Long balance;

    /**
     * 照片
     */
    @Excel(name = "照片")
    private String pics;

    /**
     * 单位
     */
    @Excel(name = "单位")
    private String unit;

    /**
     * 保质期
     */
    @Excel(name = "保质期")
    private String qperied;

    /**
     * 重量
     */
    @Excel(name = "重量")
    private String weight;

    /**
     * 描述
     */
    @Excel(name = "描述")
    private String descr;

    public void setGno(Long gno) {
        this.gno = gno;
    }

    public Long getGno() {
        return gno;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGname() {
        return gname;
    }

    public void setTno(Long tno) {
        this.tno = tno;
    }

    public Long getTno() {
        return tno;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getIntro() {
        return intro;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    public Long getBalance() {
        return balance;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public String getPics() {
        return pics;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getUnit() {
        return unit;
    }

    public void setQperied(String qperied) {
        this.qperied = qperied;
    }

    public String getQperied() {
        return qperied;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getWeight() {
        return weight;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getDescr() {
        return descr;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("gno" , getGno())
                .append("gname" , getGname())
                .append("tno" , getTno())
                .append("price" , getPrice())
                .append("intro" , getIntro())
                .append("balance" , getBalance())
                .append("pics" , getPics())
                .append("unit" , getUnit())
                .append("qperied" , getQperied())
                .append("weight" , getWeight())
                .append("descr" , getDescr())
                .toString();
    }
}
