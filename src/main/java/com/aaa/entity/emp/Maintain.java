package com.aaa.entity.emp;

public class Maintain {
	private Integer mid;
	private String equipmentnumber;//故障编号
	private String mrepairman;//维修人员
	private String maintenancetime;//维修时间
	private String completiontime;//完成时间
	private Integer sum;//维修总费用
	private Integer materialcost;//材料费用
	private Integer staffcosts;//人工费用
	private Integer othercosts;//其他费用
	private String breakdownnumber;//维修订单号
	private String failurestate;//维修状态
	private String remark;//备注
	private String DisDate;//拨款时间
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getEquipmentnumber() {
		return equipmentnumber;
	}
	public void setEquipmentnumber(String equipmentnumber) {
		this.equipmentnumber = equipmentnumber;
	}
	public String getMrepairman() {
		return mrepairman;
	}
	public void setMrepairman(String mrepairman) {
		this.mrepairman = mrepairman;
	}
	public String getMaintenancetime() {
		return maintenancetime;
	}
	public void setMaintenancetime(String maintenancetime) {
		this.maintenancetime = maintenancetime;
	}
	public String getCompletiontime() {
		return completiontime;
	}
	public void setCompletiontime(String completiontime) {
		this.completiontime = completiontime;
	}
	public String getBreakdownnumber() {
		return breakdownnumber;
	}
	public void setBreakdownnumber(String breakdownnumber) {
		this.breakdownnumber = breakdownnumber;
	}
	public String getFailurestate() {
		return failurestate;
	}
	public void setFailurestate(String failurestate) {
		this.failurestate = failurestate;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public Integer getMaterialcost() {
		return materialcost;
	}
	public void setMaterialcost(Integer materialcost) {
		this.materialcost = materialcost;
	}
	public Integer getStaffcosts() {
		return staffcosts;
	}
	public void setStaffcosts(Integer staffcosts) {
		this.staffcosts = staffcosts;
	}
	public Integer getOthercosts() {
		return othercosts;
	}
	public void setOthercosts(Integer othercosts) {
		this.othercosts = othercosts;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDisDate() {
		return DisDate;
	}
	public void setDisDate(String disDate) {
		DisDate = disDate;
	}
	
	
}
