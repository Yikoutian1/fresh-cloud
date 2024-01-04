package com.fresh.system.domain.vo;



public class CouponMiddle {
    private Long cid;
    private Integer countnum;

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public Integer getCountnum() {
        return countnum;
    }

    public void setCountnum(Integer countnum) {
        this.countnum = countnum;
    }

    @Override
    public String toString() {
        return "CouponMiddle{" +
                "cid=" + cid +
                ", countnum=" + countnum +
                '}';
    }
}
