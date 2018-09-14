package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  SaleRecord 
 * @类描述:	销售记录统计管理表
 * @author  公子哥
 * @time    2018-7-31下午7:24:18
 * @version 1.0
 */
public class SaleRecord {
	/***
	 * 全局变量
	 */
	private Integer salid;      //主键ID
	private String  salordernum;//订单编号
	private String  salname;    //客户姓名
	private String  salmoney;   //金额
	private String  salempname; //员工姓名
	private String  salstate;   //状态
	private Date    saldate;    //记录时间
	private String  beginTime;  //开始时间
	private String  endTime;    //结束时间
	
	private String  orderno;    //订单编号
	private String  cname;      //客户姓名
	private String  IncomeMoney;//金额
	private String  ename;	    //员工姓名
	private String  states;     //收款状态
	private Date    ordertime;  //订单创建时间
	
	/***
	 * set get 方法
	 */
	public Integer getSalid() {
		return salid;
	}
	public void setSalid(Integer salid) {
		this.salid = salid;
	}
	public String getSalordernum() {
		return salordernum;
	}
	public void setSalordernum(String salordernum) {
		this.salordernum = salordernum;
	}
	public String getSalname() {
		return salname;
	}
	public void setSalname(String salname) {
		this.salname = salname;
	}
	public String getSalmoney() {
		return salmoney;
	}
	public void setSalmoney(String salmoney) {
		this.salmoney = salmoney;
	}
	public String getSalempname() {
		return salempname;
	}
	public void setSalempname(String salempname) {
		this.salempname = salempname;
	}
	public String getSalstate() {
		return salstate;
	}
	public void setSalstate(String salstate) {
		this.salstate = salstate;
	}
	public Date getSaldate() {
		return saldate;
	}
	public void setSaldate(Date saldate) {
		this.saldate = saldate;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getIncomeMoney() {
		return IncomeMoney;
	}
	public void setIncomeMoney(String incomeMoney) {
		IncomeMoney = incomeMoney;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getStates() {
		return states;
	}
	public void setStates(String states) {
		this.states = states;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	
}
