package com.aaa.entity.emp;

public class Appropriation {
 private Integer id;//主键
 private String maschinennummer;//机器编号
 private String genre;//类型
 private Double sumo;//钱数
 private String auditor;//审核人
 private String fundsname;//拨款人
 private String payee;//收款人
 private String bankcard;//银行卡号
 private String reason;//备注
 private String paymethod;//拨款银行卡
 private String time;//系统时间
 
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getMaschinennummer() {
	return maschinennummer;
}
public void setMaschinennummer(String maschinennummer) {
	this.maschinennummer = maschinennummer;
}
public String getGenre() {
	return genre;
}
public void setGenre(String genre) {
	this.genre = genre;
}
public Double getSumo() {
	return sumo;
}
public void setSumo(Double sumo) {
	this.sumo = sumo;
}
public String getAuditor() {
	return auditor;
}
public void setAuditor(String auditor) {
	this.auditor = auditor;
}
public String getFundsname() {
	return fundsname;
}
public void setFundsname(String fundsname) {
	this.fundsname = fundsname;
}
public String getPayee() {
	return payee;
}
public void setPayee(String payee) {
	this.payee = payee;
}
public String getBankcard() {
	return bankcard;
}
public void setBankcard(String bankcard) {
	this.bankcard = bankcard;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public String getPaymethod() {
	return paymethod;
}
public void setPaymethod(String paymethod) {
	this.paymethod = paymethod;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
 
}
