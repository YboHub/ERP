package com.aaa.entity.apauditor;

import java.util.Date;

public class Procurement {
	private Integer id;
	private String orderid;//订单编号
	private String materials;//材料
	private String types;//材料类型
	private Double weight;//重量(吨)
	private Double price;//单价
	private Integer states;//状态
	private String buyer;//审核人
	private String supplier;//供应商
	private Date apptime;//时间
	private Integer ordernum;//订单数量
	private String cangku;//仓库
	private String caozuoname;//操作人
	private Integer dgzt;//订单状态
	private Double money;//金额
	private String reason;//理由
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMaterials() {
		return materials;
	}
	public void setMaterials(String materials) {
		this.materials = materials;
	}
	
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public Date getApptime() {
		return apptime;
	}
	public void setApptime(Date apptime) {
		this.apptime = apptime;
	}
	public Integer getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}
	public String getCangku() {
		return cangku;
	}
	public void setCangku(String cangku) {
		this.cangku = cangku;
	}
	public String getCaozuoname() {
		return caozuoname;
	}
	public void setCaozuoname(String caozuoname) {
		this.caozuoname = caozuoname;
	}

	public Integer getDgzt() {
		return dgzt;
	}
	public void setDgzt(Integer dgzt) {
		this.dgzt = dgzt;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}

	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
}
