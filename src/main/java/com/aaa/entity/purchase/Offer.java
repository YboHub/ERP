/**
 * 
 */
package com.aaa.entity.purchase;
/**
 * @类名称: Offer
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-28下午9:10:35
 * 
 */
public class Offer {
	private Integer id;//主键id
	private String goodsname;//商品名
	private String goodstype;//商品类型
	private String company;//供货商
	private Double price;//单价
	private String plantime;//报价时间
	private Integer day;//报价有效期
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getGoodstype() {
		return goodstype;
	}
	public void setGoodstype(String goodstype) {
		this.goodstype = goodstype;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getPlantime() {
		return plantime;
	}
	public void setPlantime(String plantime) {
		this.plantime = plantime;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	
	
}
