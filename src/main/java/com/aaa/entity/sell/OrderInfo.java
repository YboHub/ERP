package com.aaa.entity.sell;

import java.util.Date;
/**
 * 
 * 类名称：OrderInfo
 * 类描述：订单信息
 * @author Aer
 * @date 2018-8-11 上午8:38:22
 * @version
 */
public class OrderInfo {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 客户编号
	 */
	private Integer cno;
	/**
	 * 客户名称
	 */
	private String cname;
	/**
	 * 订单编号
	 */
	private String orderno;
	/**
	 * 下单时间
	 */
	private Date ordertime;
	/**
	 * 仓库
	 */
	private String warehouse;
	/**
	 * 销售员
	 */
	private String ename;
	/**
	 * 销售员编号
	 */
	private Integer empno;
	/**
	 * 总计
	 */
	private String mtotal;
	/**
	 * 状态
	 */
	private String state;
	/**
	 * 备注信息
	 */
	private String remark;
	/**
	 * 付款方式
	 */
	private Integer paytype;
	/**
	 * 预付金额
	 */
	private Float dpval;
	/**
	 * 订单状态
	 */
	private Integer statess;
	/**
	 * 出库审核时间
	 */
	private String proaudittime;
	/**
	 * 出库审核人
	 */
	private String auditman;
	/**
	 *出库审核备注 
	 */
	private String auditremark;
	public Integer getPaytype() {
		return paytype;
	}
	public void setPaytype(Integer paytype) {
		this.paytype = paytype;
	}
	public Float getDpval() {
		return dpval;
	}
	public void setDpval(Float dpval) {
		this.dpval = dpval;
	}
	public Integer getStatess() {
		return statess;
	}
	public void setStatess(Integer statess) {
		this.statess = statess;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public String getMtotal() {
		return mtotal;
	}
	public void setMtotal(String mtotal) {
		this.mtotal = mtotal;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getProaudittime() {
		return proaudittime;
	}
	public void setProaudittime(String proaudittime) {
		this.proaudittime = proaudittime;
	}
	public String getAuditman() {
		return auditman;
	}
	public void setAuditman(String auditman) {
		this.auditman = auditman;
	}
	public String getAuditremark() {
		return auditremark;
	}
	public void setAuditremark(String auditremark) {
		this.auditremark = auditremark;
	}
}
