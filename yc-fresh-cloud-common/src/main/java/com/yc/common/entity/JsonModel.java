package com.yc.common.entity;

import java.io.Serializable;

public class JsonModel  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2704544039885268567L;
	private int code;
	private String msg;
	private Object obj;
	
	public JsonModel() {
		super();
	}

	public JsonModel(int code, String msg, Object obj) {
		super();
		this.code = code;
		this.msg = msg;
		this.obj = obj;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object ob) {
		this.obj = ob;
	}

	@Override
	public String toString() {
		return "JsonModel [code=" + code + ", msg=" + msg + ", obj=" + obj + "]";
	}
	
}
