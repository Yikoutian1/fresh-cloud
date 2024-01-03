package com.fresh.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;

/**
 * 订单信息对象 orderinfo
 * 
 * @author calyee
 * @date 2024-01-03
 */
public class Orderinfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单编号 */
    private String ono;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date odate;

    /** 收货地址编号 */
    @Excel(name = "收货地址编号")
    private String ano;

    /** 发货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date sdate;

    /** 收货日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "收货日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date rdate;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private Long status;

    /** 订单总额 */
    @Excel(name = "订单总额")
    private BigDecimal price;

    /** 是否已开发票 */
    @Excel(name = "是否已开发票")
    private Integer invoice;

    /** 是否使用优惠卷 */
    @Excel(name = "是否使用优惠卷")
    private Integer iscoupon;

    /** 优惠卷价格 */
    @Excel(name = "优惠卷价格")
    private BigDecimal couponprice;

    /** 使用优惠卷后的价格 */
    @Excel(name = "使用优惠卷后的价格")
    private BigDecimal realprice;

    public void setOno(String ono) 
    {
        this.ono = ono;
    }

    public String getOno() 
    {
        return ono;
    }
    public void setOdate(Date odate) 
    {
        this.odate = odate;
    }

    public Date getOdate() 
    {
        return odate;
    }
    public void setAno(String ano) 
    {
        this.ano = ano;
    }

    public String getAno() 
    {
        return ano;
    }
    public void setSdate(Date sdate) 
    {
        this.sdate = sdate;
    }

    public Date getSdate() 
    {
        return sdate;
    }
    public void setRdate(Date rdate) 
    {
        this.rdate = rdate;
    }

    public Date getRdate() 
    {
        return rdate;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setInvoice(Integer invoice) 
    {
        this.invoice = invoice;
    }

    public Integer getInvoice() 
    {
        return invoice;
    }
    public void setIscoupon(Integer iscoupon) 
    {
        this.iscoupon = iscoupon;
    }

    public Integer getIscoupon() 
    {
        return iscoupon;
    }
    public void setCouponprice(BigDecimal couponprice) 
    {
        this.couponprice = couponprice;
    }

    public BigDecimal getCouponprice() 
    {
        return couponprice;
    }
    public void setRealprice(BigDecimal realprice) 
    {
        this.realprice = realprice;
    }

    public BigDecimal getRealprice() 
    {
        return realprice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ono", getOno())
            .append("odate", getOdate())
            .append("ano", getAno())
            .append("sdate", getSdate())
            .append("rdate", getRdate())
            .append("status", getStatus())
            .append("price", getPrice())
            .append("invoice", getInvoice())
            .append("iscoupon", getIscoupon())
            .append("couponprice", getCouponprice())
            .append("realprice", getRealprice())
            .toString();
    }
}
