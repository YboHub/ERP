package com.aaa.entity.apauditor;

public class FundsRecord {
	private Integer id;
	private String orderid;//采购单号
	private Double allmoney;//拨款钱数
	private String fundsname;//拨款人
	private String paymethod;//拨款方式
	private String payee;//收款人
	private Integer states;//拨款状态
	private String bankcard;//收款人账号
	private String reason;//拨款理由
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Double getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(Double allmoney) {
		this.allmoney = allmoney;
	}
	public String getFundsname() {
		return fundsname;
	}
	public void setFundsname(String fundsname) {
		this.fundsname = fundsname;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public String getPayee() {
		return payee;
	}
	public void setPayee(String payee) {
		this.payee = payee;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public String getBankcard() {
		return bankcard;
	}
	public void setBankcard(String bankcard) {
		this.bankcard = bankcard;
	}
	
}
