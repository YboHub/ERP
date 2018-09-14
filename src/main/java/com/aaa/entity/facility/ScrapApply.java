package com.aaa.entity.facility;
/**
 * 类名称：ScrapApply
 * 类描述：实体类 
 * 创建人：wangsongkang
 * 创建时间：2018-8-17 
 * @version
 */
public class ScrapApply {
	private Integer sid;//主键id
	private String equipmentnumber;//设备单号
	private String acceptanceDates;//验收日期
	private String price;//价格
	private String buyingTime;//购入时间
	private String rejectionTime;//报废时间
	private String cause;//报废原因
	private String proposer;//申请人
	private String appraiser;//鉴定人
	private String remark;//备注
	private String auditor;//审核人
	private String audit;//审核
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getEquipmentnumber() {
		return equipmentnumber;
	}
	public void setEquipmentnumber(String equipmentnumber) {
		this.equipmentnumber = equipmentnumber;
	}
	public String getAcceptanceDates() {
		return acceptanceDates;
	}
	public void setAcceptanceDates(String acceptanceDates) {
		this.acceptanceDates = acceptanceDates;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBuyingTime() {
		return buyingTime;
	}
	public void setBuyingTime(String buyingTime) {
		this.buyingTime = buyingTime;
	}
	public String getRejectionTime() {
		return rejectionTime;
	}
	public void setRejectionTime(String rejectionTime) {
		this.rejectionTime = rejectionTime;
	}
	public String getCause() {
		return cause;
	}
	public void setCause(String cause) {
		this.cause = cause;
	}
	public String getProposer() {
		return proposer;
	}
	public void setProposer(String proposer) {
		this.proposer = proposer;
	}
	public String getAppraiser() {
		return appraiser;
	}
	public void setAppraiser(String appraiser) {
		this.appraiser = appraiser;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAuditor() {
		return auditor;
	}
	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}
	public String getAudit() {
		return audit;
	}
	public void setAudit(String audit) {
		this.audit = audit;
	}
	
}
