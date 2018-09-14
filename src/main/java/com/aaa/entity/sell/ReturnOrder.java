package com.aaa.entity.sell;

import java.util.Date;

/**
 * 
 * 类名称：ReturnOrder
 * 类描述：订单货物退回
 * @author Aer
 * @date 2018-8-7 上午10:39:34
 * @version
 */
public class ReturnOrder {
	/**
	 * 产品信息在订单详情表中的id
	 */
	private Integer opid;
	/**
	 * 订单编号
	 */
	private String rorderno;
	/**
	 * 货物编号
	 */
	private Integer rpno;
	/**
	 * 货物名称
	 */
	private String rpname;
	/**
	 * 退回货物数量
	 */
	private Integer rpnum;
	/**
	 * 退回货物单价
	 */
	private Float rprice;
	/**
	 * 退回货物总价
	 */
	private Float rsubtotal;
	/**
	 * 退货类型
	 */
	private Integer rtype;
	/**
	 * 客户退货原因
	 */
	private String returnreason;
	/**
	 * 退回订单状态
	 */
	private Integer rstate;
	private String reason;//审批理由
	private Integer id;
	private Integer state;
	private Date rordertime;
	
	public Date getRordertime() {
		return rordertime;
	}
	public void setRordertime(Date rordertime) {
		this.rordertime = rordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
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
	public Integer getRstate() {
		return rstate;
	}
	public void setRstate(Integer rstate) {
		this.rstate = rstate;
	}
	public String getReturnreason() {
		return returnreason;
	}
	public void setReturnreason(String returnreason) {
		this.returnreason = returnreason;
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
	public Integer getOpid() {
		return opid;
	}
	public void setOpid(Integer opid) {
		this.opid = opid;
	}
	public Integer getRtype() {
		return rtype;
	}
	public void setRtype(Integer rtype) {
		this.rtype = rtype;
	}
}
