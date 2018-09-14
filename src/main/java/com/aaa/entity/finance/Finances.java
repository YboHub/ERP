package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Finances 
 * @类描述:  财务记录实体类
 * @author  公子哥
 * @time    2018-7-27上午8:38:51
 * @version 1.0
 */
public class Finances {
	/***
	 * 全局变量
	 */
	private Integer fid;      //财务id 
    private String  fnum;     //财务编号
    private String  onum;     //订单编号
    private String  ftype;    //财务类型(财务拨款/财务收款)
    private Integer fholder;  //拨款人
    private Date    ftime;    //记录时间
    private Integer fpayee;   //收款人
    private double  fmoney;   //金额
    private String  fremark;  //备注
    private String  beginTime;//查询开始时间
    private String  endTime;  //查询结束时间
    
    /***
     * set get方法
     */
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public String getFnum() {
		return fnum;
	}
	public void setFnum(String fnum) {
		this.fnum = fnum;
	}
	public String getOnum() {
		return onum;
	}
	public void setOnum(String onum) {
		this.onum = onum;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public Integer getFholder() {
		return fholder;
	}
	public void setFholder(Integer fholder) {
		this.fholder = fholder;
	}
	public Date getFtime() {
		return ftime;
	}
	public void setFtime(Date ftime) {
		this.ftime = ftime;
	}
	public Integer getFpayee() {
		return fpayee;
	}
	public void setFpayee(Integer fpayee) {
		this.fpayee = fpayee;
	}
	public double getFmoney() {
		return fmoney;
	}
	public void setFmoney(double fmoney) {
		this.fmoney = fmoney;
	}
	public String getFremark() {
		return fremark;
	}
	public void setFremark(String fremark) {
		this.fremark = fremark;
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
	
}
