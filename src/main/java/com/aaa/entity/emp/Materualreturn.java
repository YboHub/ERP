package com.aaa.entity.emp;

public class Materualreturn {
private Integer id;//原料退货表
private String orderid;//采购单号
private String goodsname;//材料名
private String types;//材料类型
private String company;//供货商
private Double price;//单价
private Double weights;//重量
private Double money;//总额
private String reason;//退货原因
private String returnname;//退货人
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
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
public Double getWeights() {
	return weights;
}
public void setWeights(Double weights) {
	this.weights = weights;
}

public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public Double getMoney() {
	return money;
}
public void setMoney(Double money) {
	this.money = money;
}
public String getReturnname() {
	return returnname;
}
public void setReturnname(String returnname) {
	this.returnname = returnname;
}


}
