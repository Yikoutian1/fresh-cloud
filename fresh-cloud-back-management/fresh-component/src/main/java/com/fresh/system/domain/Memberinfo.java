package com.fresh.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fresh.common.annotation.Excel;
import com.fresh.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 会员对象 memberinfo
 *
 * @author calyee
 * @date 2023-12-26
 */
public class Memberinfo extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 会员编号
     */
    private Long mno;

    /**
     * 昵称
     */
    @Excel(name = "昵称")
    private String nickName;

    /**
     * 姓名
     */
    @Excel(name = "姓名")
    private String realName;

    /**
     * 密码
     */
    @Excel(name = "密码")
    private String pwd;

    /**
     * 电话
     */
    @Excel(name = "电话")
    private String tel;

    /**
     * 邮箱
     */
    @Excel(name = "邮箱")
    private String email;

    /**
     * 照片
     */
    @Excel(name = "照片")
    private String photo;

    /**
     * 注册日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "注册日期" , width = 30, dateFormat = "yyyy-MM-dd")
    private Date regDate;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private Long status;

    public void setMno(Long mno) {
        this.mno = mno;
    }

    public Long getMno() {
        return mno;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRealName() {
        return realName;
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

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto() {
        return photo;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getRegDate() {
        return regDate;
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
                .append("mno" , getMno())
                .append("nickName" , getNickName())
                .append("realName" , getRealName())
                .append("pwd" , getPwd())
                .append("tel" , getTel())
                .append("email" , getEmail())
                .append("photo" , getPhoto())
                .append("regDate" , getRegDate())
                .append("status" , getStatus())
                .toString();
    }
}
