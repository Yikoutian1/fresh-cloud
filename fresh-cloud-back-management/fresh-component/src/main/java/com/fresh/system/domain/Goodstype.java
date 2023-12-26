package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 商品类型对象 goodstype
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Goodstype extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 类型编号
     */
    private Long tno;

    /**
     * 类型名
     */
    @Excel(name = "类型名")
    private String tname;

    /**
     * 照片
     */
    @Excel(name = "照片")
    private String pic;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Long status;

    public void setTno(Long tno) {
        this.tno = tno;
    }

    public Long getTno() {
        return tno;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTname() {
        return tname;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPic() {
        return pic;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    public Long getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("tno" , getTno())
                .append("tname" , getTname())
                .append("pic" , getPic())
                .append("status" , getStatus())
                .toString();
    }
}
