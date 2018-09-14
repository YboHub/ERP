package com.aaa.entity.apauditor;

public class QualityRecord {
	private Integer id;
	private String orderid;//采购单号
	private String types;//采购类型
	private String goodsname;//材料
	private Integer states;//状态
	private String reason;//质检原因
	private String qualityname;//质检人
	private String name;//入库人
	private Double weights;//重量
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Double getWeights() {
		return weights;
	}
	public void setWeights(Double weights) {
		this.weights = weights;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
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
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getQualityname() {
		return qualityname;
	}
	public void setQualityname(String qualityname) {
		this.qualityname = qualityname;
	}
	
}
