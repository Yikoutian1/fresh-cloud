package com.fresh.system.domain;


import java.io.Serializable;

/**
 * @program: fresh-cloud
 * @description: 卡包
 **/

public class CouponCard implements Serializable {
    public Integer sum;
    public Integer uid;


    public Long cid;

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public Integer num;
    /**
     * 0 未使用 1已使用 2已过期
     */
    public Integer status;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }


    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "CouponCard{" +
                "sum=" + sum +
                ", uid=" + uid +
                ", cid=" + cid +
                ", num=" + num +
                ", status=" + status +
                '}';
    }
}
