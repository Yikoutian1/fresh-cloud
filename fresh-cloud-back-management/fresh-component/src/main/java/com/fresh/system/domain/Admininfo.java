package com.fresh.system.domain;

import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 管理员对象 admininfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Admininfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    private Long aid;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String aname;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String pwd;

    /**
     * 电话号码
     */
    @Excel(name = "电话号码")
    private String tel;

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public Long getAid() {
        return aid;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAname() {
        return aname;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPwd() {
        return pwd;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTel() {
        return tel;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("aid" , getAid())
                .append("aname" , getAname())
                .append("pwd" , getPwd())
                .append("tel" , getTel())
                .toString();
    }
}
