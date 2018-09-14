package com.aaa.entity.carRecord;
/**
 * 类名称：CarRecord
 * 类描述： 实体类
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 
 * @version
 */
public class CarRecord {
	private Integer cid;//主键id
	private String cdate;//日期
	private String ctransportPeople;//用车人
	private String cphone;//电话
	private String coutOfTime;//出车时间
	private String ccause;//事由
	private String csite;//地点
	private String crunningTime;//收车时间
	private String cbuildingUser;//使用单位
	private String csignature;//确认签字
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCtransportPeople() {
		return ctransportPeople;
	}
	public void setCtransportPeople(String ctransportPeople) {
		this.ctransportPeople = ctransportPeople;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCoutOfTime() {
		return coutOfTime;
	}
	public void setCoutOfTime(String coutOfTime) {
		this.coutOfTime = coutOfTime;
	}
	public String getCcause() {
		return ccause;
	}
	public void setCcause(String ccause) {
		this.ccause = ccause;
	}
	public String getCsite() {
		return csite;
	}
	public void setCsite(String csite) {
		this.csite = csite;
	}
	public String getCrunningTime() {
		return crunningTime;
	}
	public void setCrunningTime(String crunningTime) {
		this.crunningTime = crunningTime;
	}
	public String getCbuildingUser() {
		return cbuildingUser;
	}
	public void setCbuildingUser(String cbuildingUser) {
		this.cbuildingUser = cbuildingUser;
	}
	public String getCsignature() {
		return csignature;
	}
	public void setCsignature(String csignature) {
		this.csignature = csignature;
	}
	
}
