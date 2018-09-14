package com.aaa.entity.manger;

import java.util.Date;

/**
 * 
 * 类名称：Plan
 * 类描述： 
 * 创建人：suzhi
 * 创建时间：2018-7-30 下午2:45:02
 * @version
 */
public class Plan {
	private Integer pid;//主键
	private String pnumber;//计划编号
	private String dnumber;//订单号
	private String person;//计划人
	private Date ptime;//提交时间
	private String pchang;//预计生产时间长
	private String pbegin;//预计开始时间
	private String pend;//预计结束时间
	private String pzh;//审核状态
	private String pyi;//审核意见
	private String pzhi;//执行状态
	private Double pnum;//生产时长
	private String psize;//生产类型
	private String begintime;//实际开始时间
	private String endtime;//实际结束时间
	private String zong;
	private Double oldzong;
	
	
	public Double getOldzong() {
		return oldzong;
	}
	public void setOldzong(Double oldzong) {
		this.oldzong = oldzong;
	}
	public String getZong() {
		return zong;
	}
	public void setZong(String zong) {
		this.zong = zong;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getDnumber() {
		return dnumber;
	}
	public void setDnumber(String dnumber) {
		this.dnumber = dnumber;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public String getPchang() {
		return pchang;
	}                  
	public void setPchang(String pchang) {
		this.pchang = pchang;
	}
	public String getPbegin() {
		return pbegin;
	}
	public void setPbegin(String pbegin) {
		this.pbegin = pbegin;
	}
	public String getPend() {
		return pend;
	}
	public void setPend(String pend) {
		this.pend = pend;
	}
	public String getPzh() {
		return pzh;
	}
	public void setPzh(String pzh) {
		this.pzh = pzh;
	}
	public String getPyi() {
		return pyi;
	}
	public void setPyi(String pyi) {
		this.pyi = pyi;
	}
	public String getPzhi() {
		return pzhi;
	}
	public void setPzhi(String pzhi) {
		this.pzhi = pzhi;
	}
	public Double getPnum() {
		return pnum;
	}
	public void setPnum(Double pnum) {
		this.pnum = pnum;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	
	
}
