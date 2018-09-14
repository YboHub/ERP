package com.aaa.entity.sell;


/**
 * 
 * 类名称：OrderData
 * 类描述：订单数据统计
 * @author Aer
 * @date 2018-8-15 下午6:55:23
 * @version
 */
public class OrderData {
	/**
	 * 订单总数
	 */
	private Integer orderTotal;
	/**
	 * 产品型号
	 */
	private Integer pno;
	/**
	 * x轴年
	 */
	private String orderYear;
	/**
	 * x轴月
	 */
	private String orderMonth;
	/**
	 * x轴天
	 */
	private String orderDay;
	/**
	 * 起始时间
	 */
	private String startTime;
	/**
	 * 结束时间
	 */
	private String endTime;
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(Integer orderTotal) {
		this.orderTotal = orderTotal;
	}
	public String getOrderYear() {
		return orderYear;
	}
	public void setOrderYear(String orderYear) {
		this.orderYear = orderYear;
	}
	public String getOrderMonth() {
		return orderMonth;
	}
	public void setOrderMonth(String orderMonth) {
		this.orderMonth = orderMonth;
	}
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	
}
