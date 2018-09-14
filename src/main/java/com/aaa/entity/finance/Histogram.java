package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Histogram 
 * @类描述:
 * @author  公子哥
 * @time    2018-7-30下午3:33:26
 * @version 1.0
 */
public class Histogram {
	/***
	 * 全局变量
	 */
	private Integer lid;      //月份id
	private Date    ldate;    //收入月份
	private String  lmoney;   //月收入金额
	private Integer yid;      //年份id
	private String  ydate;    //收入年份
	private String  ymoney;   //年收入金额
	private String  beginTime;//查询开始时间
	private String  endTime;  //查询结束时间
	
	/***
	 * set get 方法
	 * @return
	 */
	public Integer getLid() {
		return lid;
	}
	public void setLid(Integer lid) {
		this.lid = lid;
	}
	public String getLmoney() {
		return lmoney;
	}
	public void setLmoney(String lmoney) {
		this.lmoney = lmoney;
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
	public Date getLdate() {
		return ldate;
	}
	public void setLdate(Date ldate) {
		this.ldate = ldate;
	}
	public Integer getYid() {
		return yid;
	}
	public void setYid(Integer yid) {
		this.yid = yid;
	}
	public String getYdate() {
		return ydate;
	}
	public void setYdate(String ydate) {
		this.ydate = ydate;
	}
	public String getYmoney() {
		return ymoney;
	}
	public void setYmoney(String ymoney) {
		this.ymoney = ymoney;
	}
	
}
