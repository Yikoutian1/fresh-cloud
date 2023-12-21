package com.fresh.common.entity;

import java.io.Serializable;

/**
 * 订单详细
 * 源辰信息
 * @author navy
 * @2019年9月30日
 */
public class OrderItemInfo implements Serializable{
	private static final long serialVersionUID = -7492892118200540190L;
	private Integer ino;
	private String ono; // 订单编号
	private Integer gno; // 商品编号
	private Integer nums; // 购买数量
	private double price; // 购买单价
	private Integer status;
	
	@Override
	public String toString() {
		return "OrderItemInfo [ino=" + ino + ", ono=" + ono + ", gno=" + gno + ", nums=" + nums + ", price=" + price
				+ ", status=" + status + "]";
	}

	public Integer getIno() {
		return ino;
	}

	public void setIno(Integer ino) {
		this.ino = ino;
	}

	public String getOno() {
		return ono;
	}

	public void setOno(String ono) {
		this.ono = ono;
	}

	public Integer getGno() {
		return gno;
	}

	public void setGno(Integer gno) {
		this.gno = gno;
	}

	public Integer getNums() {
		return nums;
	}

	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public OrderItemInfo(Integer ino, String ono, Integer gno, Integer nums, double price, Integer status) {
		super();
		this.ino = ino;
		this.ono = ono;
		this.gno = gno;
		this.nums = nums;
		this.price = price;
		this.status = status;
	}

	public OrderItemInfo() {
		super();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + gno;
		result = prime * result + ino;
		result = prime * result + nums;
		result = prime * result + ((ono == null) ? 0 : ono.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + status;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItemInfo other = (OrderItemInfo) obj;
		if (gno != other.gno)
			return false;
		if (ino != other.ino)
			return false;
		if (nums != other.nums)
			return false;
		if (ono == null) {
			if (other.ono != null)
				return false;
		} else if (!ono.equals(other.ono))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (status != other.status)
			return false;
		return true;
	}
}
