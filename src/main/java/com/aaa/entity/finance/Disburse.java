package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Disburse 
 * @类描述:  收入支出统计图的实体类
 * @author  公子哥
 * @time    2018-8-2上午9:54:02
 * @version 1.0
 */
public class Disburse {
	/***
	 * 全局变量
	 */
	private Integer DisId;        //支出id
	private String  DisNum;		  //支出的订单号
	private Integer DisMoney;	  //支出的钱
	private Date    DisDate;	  //日期
	private String  disburseMonth;//支出月份
	private Integer disburseMoney;//当月总支出
	
	/***
	 * set get 方法
	 * @return
	 */
	public Integer getDisId() {
		return DisId;
	}
	public void setDisId(Integer disId) {
		DisId = disId;
	}
	public String getDisNum() {
		return DisNum;
	}
	public void setDisNum(String disNum) {
		DisNum = disNum;
	}
	public Integer getDisMoney() {
		return DisMoney;
	}
	public void setDisMoney(Integer disMoney) {
		DisMoney = disMoney;
	}
	public String getDisburseMonth() {
		return disburseMonth;
	}
	public void setDisburseMonth(String disburseMonth) {
		this.disburseMonth = disburseMonth;
	}
	public Integer getDisburseMoney() {
		return disburseMoney;
	}
	public void setDisburseMoney(Integer disburseMoney) {
		this.disburseMoney = disburseMoney;
	}
	public Date getDisDate() {
		return DisDate;
	}
	public void setDisDate(Date disDate) {
		DisDate = disDate;
	}
	
	
}
