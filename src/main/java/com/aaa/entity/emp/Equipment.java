package com.aaa.entity.emp;

public class Equipment {
	private Integer id;//id
	private String dproduct;//类型
	private String dcategory;//类型机器
	private String dprice;//价钱
	private String dbrand;//品牌
	private String equipment;//机械名称
	private String equipmentnumber;//机械名称编号
	private String operation;//运行状态
	private String dname;//机器管理负责人
	private Integer audit;//审核状态
	private String principal;//审核负责人
	private String remark;//备注
	private String stime;//购买机器时间
	private String DisDate;//拨款日期
	private String DisMoney;//拨款金额
	private String DisNum;//拨款单号
	 
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDproduct() {
		return dproduct;
	}
	public void setDproduct(String dproduct) {
		this.dproduct = dproduct;
	}
	public String getDcategory() {
		return dcategory;
	}
	public void setDcategory(String dcategory) {
		this.dcategory = dcategory;
	}
	public String getDprice() {
		return dprice;
	}
	public void setDprice(String dprice) {
		this.dprice = dprice;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getEquipmentnumber() {
		return equipmentnumber;
	}
	public void setEquipmentnumber(String equipmentnumber) {
		this.equipmentnumber = equipmentnumber;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDbrand() {
		return dbrand;
	}
	public void setDbrand(String dbrand) {
		this.dbrand = dbrand;
	}
	public Integer getAudit() {
		return audit;
	}
	public void setAudit(Integer audit) {
		this.audit = audit;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getDisDate() {
		return DisDate;
	}
	public void setDisDate(String disDate) {
		DisDate = disDate;
	}
	public String getDisMoney() {
		return DisMoney;
	}
	public void setDisMoney(String disMoney) {
		DisMoney = disMoney;
	}
	public String getDisNum() {
		return DisNum;
	}
	public void setDisNum(String disNum) {
		DisNum = disNum;
	}
	
}
