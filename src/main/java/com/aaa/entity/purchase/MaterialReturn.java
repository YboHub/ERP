/**
 * 
 */
package com.aaa.entity.purchase;

/**
 * @类名称: MaterialReturn
 * @描述类: 退货实体类
 * @author: LiuJinYu
 * @time: 2018-8-15上午8:59:48
 * 
 */
public class MaterialReturn {
	private Integer id;
	private String orderid;
	private String goodsname;
	private String types;
	private String company;
	private Double price;
	private Double weights;
	private Double money;
	private String reason;//退货原因
	private String returnname;//退货人
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Double getWeights() {
		return weights;
	}
	public void setWeights(Double weights) {
		this.weights = weights;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReturnname() {
		return returnname;
	}
	public void setReturnname(String returnname) {
		this.returnname = returnname;
	}
	
}
