package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 购物车信息对象 cartinfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Cartinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 购物车编号
     */
    private String cno;

    /**
     * 会员编号
     */
    @Excel(name = "会员编号")
    private Long mno;

    /**
     * 商品编号
     */
    @Excel(name = "商品编号")
    private Long gno;

    /**
     * 数量
     */
    @Excel(name = "数量")
    private Long num;

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCno() {
        return cno;
    }

    public void setMno(Long mno) {
        this.mno = mno;
    }

    public Long getMno() {
        return mno;
    }

    public void setGno(Long gno) {
        this.gno = gno;
    }

    public Long getGno() {
        return gno;
    }

    public void setNum(Long num) {
        this.num = num;
    }

    public Long getNum() {
        return num;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("cno" , getCno())
                .append("mno" , getMno())
                .append("gno" , getGno())
                .append("num" , getNum())
                .toString();
    }
}
