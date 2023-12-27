package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 订单对象信息对象 orderiteminfo
 * 
 * @author calyee
 * @date 2023-12-26
 */
public class Orderiteminfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long ino;

    /** 订单编号 */
    @Excel(name = "订单编号")
    private String ono;

    /** 商品编号 */
    @Excel(name = "商品编号")
    private Long gno;

    /** 数量 */
    @Excel(name = "数量")
    private Long nums;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 状态 */
    @Excel(name = "状态")
    private Long status;

    public void setIno(Long ino) 
    {
        this.ino = ino;
    }

    public Long getIno() 
    {
        return ino;
    }
    public void setOno(String ono) 
    {
        this.ono = ono;
    }

    public String getOno() 
    {
        return ono;
    }
    public void setGno(Long gno) 
    {
        this.gno = gno;
    }

    public Long getGno() 
    {
        return gno;
    }
    public void setNums(Long nums) 
    {
        this.nums = nums;
    }

    public Long getNums() 
    {
        return nums;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("ino", getIno())
            .append("ono", getOno())
            .append("gno", getGno())
            .append("nums", getNums())
            .append("price", getPrice())
            .append("status", getStatus())
            .toString();
    }
}
