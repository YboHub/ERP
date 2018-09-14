package com.aaa.entity.apauditor;

import java.util.Date;

public class PurchaseRecord {
	private  Integer sid;//id
	private  Integer id;//采购单id
	private  String reason;//理由
	private  Integer states;//状态
	private  String orderid;//采购单号
	private  String buyer;//审批人
	private  Date time;//审批时间
	private String caozuoname;//采购申请人
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getCaozuoname() {
		return caozuoname;
	}
	public void setCaozuoname(String caozuoname) {
		this.caozuoname = caozuoname;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
}
