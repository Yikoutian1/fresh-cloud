package com.fresh.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 订单信息对象 orderinfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Orderinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    private String ono;

    /**
     * 下单时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date odate;

    /**
     * 地址编号
     */
    @Excel(name = "地址编号")
    private String ano;

    /**
     * 下单日期?
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单日期?" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date sdate;

    /**
     * 预计送达时间?
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计送达时间?" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date rdate;

    /**
     * 订单状态
     */
    @Excel(name = "订单状态")
    private Long status;

    /**
     * 总价
     */
    @Excel(name = "总价")
    private BigDecimal price;

    /**
     * 发票
     */
    @Excel(name = "发票")
    private Long invoice;

    public void setOno(String ono) {
        this.ono = ono;
    }

    public String getOno() {
        return ono;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    public Date getOdate() {
        return odate;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getAno() {
        return ano;
    }

    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

    public Date getSdate() {
        return sdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getStatus() {
        return status;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setInvoice(Long invoice) {
        this.invoice = invoice;
    }

    public Long getInvoice() {
        return invoice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("ono" , getOno())
                .append("odate" , getOdate())
                .append("ano" , getAno())
                .append("sdate" , getSdate())
                .append("rdate" , getRdate())
                .append("status" , getStatus())
                .append("price" , getPrice())
                .append("invoice" , getInvoice())
                .toString();
    }
}
