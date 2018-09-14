package com.aaa.entity.facility;
/**
 * 类名称：BreakDowns
 * 类描述： 实体类
 * 创建人：wangsongkang
 * 创建时间：2018-8-15 
 * @version
 */
public class BreakDowns {
	private Integer bid;//主键id
	private String equipmentnumber;//设备单号
	private String reporttime;//上报时间
	private String failurestate;//故障状态
	private String failurecause;//故障原因
	private String breakdownnumber;//故障单号
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getEquipmentnumber() {
		return equipmentnumber;
	}
	public void setEquipmentnumber(String equipmentnumber) {
		this.equipmentnumber = equipmentnumber;
	}
	public String getReporttime() {
		return reporttime;
	}
	public void setReporttime(String reporttime) {
		this.reporttime = reporttime;
	}
	public String getFailurestate() {
		return failurestate;
	}
	public void setFailurestate(String failurestate) {
		this.failurestate = failurestate;
	}
	public String getFailurecause() {
		return failurecause;
	}
	public void setFailurecause(String failurecause) {
		this.failurecause = failurecause;
	}
	public String getBreakdownnumber() {
		return breakdownnumber;
	}
	public void setBreakdownnumber(String breakdownnumber) {
		this.breakdownnumber = breakdownnumber;
	}
	
}
