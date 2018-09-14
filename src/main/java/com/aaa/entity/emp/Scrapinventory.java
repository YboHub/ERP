package com.aaa.entity.emp;

public class Scrapinventory {
	private Integer id;
	private Integer zid;
	private Integer warehousenum;//仓库编号
	private String rkdh;//入库单号
	private String goodsnum;//货物编号
	private String goodstype;//货物类型
	private String goodsname;//货物名称
	private Integer inventoryunit;//入库数量
	private String audittime;//入库时间
	private Integer zhongliang;//出库重量
	private Integer zong;//库存数量
	private Double weight;//原料库废铁库存
	private String sname;//负者人
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getWarehousenum() {
		return warehousenum;
	}
	public void setWarehousenum(Integer warehousenum) {
		this.warehousenum = warehousenum;
	}
	public String getRkdh() {
		return rkdh;
	}
	public void setRkdh(String rkdh) {
		this.rkdh = rkdh;
	}
	public String getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(String goodsnum) {
		this.goodsnum = goodsnum;
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
	public Integer getInventoryunit() {
		return inventoryunit;
	}
	public void setInventoryunit(Integer inventoryunit) {
		this.inventoryunit = inventoryunit;
	}
	public String getAudittime() {
		return audittime;
	}
	public void setAudittime(String audittime) {
		this.audittime = audittime;
	}
	public Integer getZhongliang() {
		return zhongliang;
	}
	public void setZhongliang(Integer zhongliang) {
		this.zhongliang = zhongliang;
	}
	public Integer getZong() {
		return zong;
	}
	public void setZong(Integer zong) {
		this.zong = zong;
	}
	public Integer getZid() {
		return zid;
	}
	public void setZid(Integer zid) {
		this.zid = zid;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
}
