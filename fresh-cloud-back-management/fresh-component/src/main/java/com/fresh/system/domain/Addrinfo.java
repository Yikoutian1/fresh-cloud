package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 地址信息对象 addrinfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Addrinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    private String ano;

    /**
     * 会员编号
     */
    @Excel(name = "会员编号")
    private Long mno;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String name;

    /**
     * 电话号码
     */
    @Excel(name = "电话号码")
    private String tel;

    /**
     * 省
     */
    @Excel(name = "省")
    private String province;

    /**
     * 城市
     */
    @Excel(name = "城市")
    private String city;

    /**
     * 地区
     */
    @Excel(name = "地区")
    private String area;

    /**
     * 地址
     */
    @Excel(name = "地址")
    private String addr;

    /**
     * 标志位
     */
    @Excel(name = "标志位")
    private Long flag;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Long status;

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getAno() {
        return ano;
    }

    public void setMno(Long mno) {
        this.mno = mno;
    }

    public Long getMno() {
        return mno;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTel() {
        return tel;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getAddr() {
        return addr;
    }

    public void setFlag(Long flag) {
        this.flag = flag;
    }

    public Long getFlag() {
        return flag;
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
                .append("ano" , getAno())
                .append("mno" , getMno())
                .append("name" , getName())
                .append("tel" , getTel())
                .append("province" , getProvince())
                .append("city" , getCity())
                .append("area" , getArea())
                .append("addr" , getAddr())
                .append("flag" , getFlag())
                .append("status" , getStatus())
                .toString();
    }
}
