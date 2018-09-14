package com.aaa.entity.apauditor;

import java.util.Date;

public class Market {
	private Integer id;
	private String rorderno;//订单编号
	private Integer rpno;//货物编号
	private String rpname;//货物名称
	private Integer rpnum;//退回货物数量
	private Float rprice;//退回货物单价
	private Float rsubtotal;//退回货物总价
	private Integer rtype;//退货类型
	private Date rordertime;//退货时间
	private String returnreason;//客户退货原因
	private Integer rstate;//状态
	private String reason;//审批理由
	private String auditor;//审批人
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRorderno() {
		return rorderno;
	}
	public void setRorderno(String rorderno) {
		this.rorderno = rorderno;
	}
	public Integer getRpno() {
		return rpno;
	}
	public void setRpno(Integer rpno) {
		this.rpno = rpno;
	}
	public String getRpname() {
		return rpname;
	}
	public void setRpname(String rpname) {
		this.rpname = rpname;
	}
	public Integer getRpnum() {
		return rpnum;
	}
	public void setRpnum(Integer rpnum) {
		this.rpnum = rpnum;
	}
	public Float getRprice() {
		return rprice;
	}
	public void setRprice(Float rprice) {
		this.rprice = rprice;
	}
	public Float getRsubtotal() {
		return rsubtotal;
	}
	public void setRsubtotal(Float rsubtotal) {
		this.rsubtotal = rsubtotal;
	}
	public Integer getRtype() {
		return rtype;
	}
	public void setRtype(Integer rtype) {
		this.rtype = rtype;
	}
	public Date getRordertime() {
		return rordertime;
	}
	public void setRordertime(Date rordertime) {
		this.rordertime = rordertime;
	}
	public String getReturnreason() {
		return returnreason;
	}
	public void setReturnreason(String returnreason) {
		this.returnreason = returnreason;
	}
	public Integer getRstate() {
		return rstate;
	}
	public void setRstate(Integer rstate) {
		this.rstate = rstate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	
}
