package com.aaa.entity.finance;

import java.util.Date;

/** 
 * @类名称:  Fun 
 * @类描述:	 财务拨款记录实体类
 * @author  公子哥
 * @time    2018-7-31下午4:48:51
 * @version 1.0
 */
public class Fun {
	/***
	 * 全局变量
	 */
	private Integer funid;
	private String  funnum;     //采购申请单号
	private String  funpeo;     //领款人
	private String  funpeop;    //财务申请人 
	private Date    fundate;    //拨款时间 
	private String  ordmethod;  //定金拨款方式 
	private String  finalmethod;//尾款拨款方式 
	private	String  ordpeo;     //定金拨款人 
	private String  finpeo;     //结算拨款人
	private String  funstate;   //审核状态 
	private String  beginTime;  //开始时间
	private String  endTime;    //结束时间
	
	/***
	 * set get方法
	 * @return
	 */
	public Integer getFunid() {
		return funid;
	}
	public void setFunid(Integer funid) {
		this.funid = funid;
	}
	public String getFunnum() {
		return funnum;
	}
	public void setFunnum(String funnum) {
		this.funnum = funnum;
	}
	public String getFunpeo() {
		return funpeo;
	}
	public void setFunpeo(String funpeo) {
		this.funpeo = funpeo;
	}
	public String getFunpeop() {
		return funpeop;
	}
	public void setFunpeop(String funpeop) {
		this.funpeop = funpeop;
	}
	public Date getFundate() {
		return fundate;
	}
	public void setFundate(Date fundate) {
		this.fundate = fundate;
	}
	public String getOrdmethod() {
		return ordmethod;
	}
	public void setOrdmethod(String ordmethod) {
		this.ordmethod = ordmethod;
	}
	public String getFinalmethod() {
		return finalmethod;
	}
	public void setFinalmethod(String finalmethod) {
		this.finalmethod = finalmethod;
	}
	public String getOrdpeo() {
		return ordpeo;
	}
	public void setOrdpeo(String ordpeo) {
		this.ordpeo = ordpeo;
	}
	public String getFinpeo() {
		return finpeo;
	}
	public void setFinpeo(String finpeo) {
		this.finpeo = finpeo;
	}
	public String getFunstate() {
		return funstate;
	}
	public void setFunstate(String funstate) {
		this.funstate = funstate;
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
