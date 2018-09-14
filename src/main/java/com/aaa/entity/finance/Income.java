package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Income 
 * @类描述:	 收入支出统计图的实体类
 * @author  公子哥
 * @time    2018-8-1下午7:03:22
 * @version 1.0
 */
public class Income {
	/***
	 * 全局变量
	 */
	private Integer IncomeId;    //主键ID
	private String  IncomeNum;   //订单号
	private Integer IncomeMoney; //金额
	private Date    IncomeDate;  //日期
	private String  type;        //收入或支出状态
	
	private String  beginTime;   //开始时间
	private String  endTime;     //结束时间
	private String  startTime;   //查询柱状图开始时间
	private String  finalTime;   //查询柱状图结束时间
	private String  AllMonth;    //所有的月份
	private Integer total;       //每月总收入
	private Integer promoney;    //每月利润
	
	/***
	 * set get 方法
	 */
	public Integer getIncomeId() {
		return IncomeId;
	}
	public void setIncomeId(Integer incomeId) {
		IncomeId = incomeId;
	}
	public String getIncomeNum() {
		return IncomeNum;
	}
	public void setIncomeNum(String incomeNum) {
		IncomeNum = incomeNum;
	}
	public Integer getIncomeMoney() {
		return IncomeMoney;
	}
	public void setIncomeMoney(Integer incomeMoney) {
		IncomeMoney = incomeMoney;
	}
	public Date getIncomeDate() {
		return IncomeDate;
	}
	public void setIncomeDate(Date incomeDate) {
		IncomeDate = incomeDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getFinalTime() {
		return finalTime;
	}
	public void setFinalTime(String finalTime) {
		this.finalTime = finalTime;
	}
	public String getAllMonth() {
		return AllMonth;
	}
	public void setAllMonth(String allMonth) {
		AllMonth = allMonth;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getPromoney() {
		return promoney;
	}
	public void setPromoney(Integer promoney) {
		this.promoney = promoney;
	}
	
	
			
}
