package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Funds 
 * @类描述:	 采购拨款实体类
 * @author  公子哥
 * @time    2018-7-31下午1:33:25
 * @version 1.0
 */
public class Funds {
	/***
	 * 全局变量
	 */
	private Integer fundsid;     //ID
	private String  fundsnum;    //采购申请单号
	private String  fundsperson; //审批人
	private String  fundperson;  //申请人
	private Date    fundsdate;   //时间
	private String  fundsmethod; //付款方式
	private String  fundsstate;  //审核状态
	private String  beginTime;   //开始时间
	private String  endTime;     //结束时间
	
	/***
	 * set get方法
	 * @return
	 */
	public Integer getFundsid() {
		return fundsid;
	}
	public void setFundsid(Integer fundsid) {
		this.fundsid = fundsid;
	}
	public String getFundsnum() {
		return fundsnum;
	}
	public void setFundsnum(String fundsnum) {
		this.fundsnum = fundsnum;
	}
	public String getFundsperson() {
		return fundsperson;
	}
	public void setFundsperson(String fundsperson) {
		this.fundsperson = fundsperson;
	}
	public String getFundperson() {
		return fundperson;
	}
	public void setFundperson(String fundperson) {
		this.fundperson = fundperson;
	}
	public Date getFundsdate() {
		return fundsdate;
	}
	public void setFundsdate(Date fundsdate) {
		this.fundsdate = fundsdate;
	}
	public String getFundsmethod() {
		return fundsmethod;
	}
	public void setFundsmethod(String fundsmethod) {
		this.fundsmethod = fundsmethod;
	}
	public String getFundsstate() {
		return fundsstate;
	}
	public void setFundsstate(String fundsstate) {
		this.fundsstate = fundsstate;
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
