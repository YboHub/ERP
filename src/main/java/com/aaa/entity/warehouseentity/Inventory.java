package com.aaa.entity.warehouseentity;

import java.util.Date;

public class Inventory {
	private Integer id;//主键
	private Integer warehousenum;//仓库编号
	private String rkdh;//入库单号
	private String materialnum;//原料编号
	private String materialtype;//原料类型
	private String materialname;//原料名称
	private Double inventoryunit;//入库数量
	private Date addtime;//入库时间
	private String goodsnum;//货物编号
	private String goodstype;//货物类型
	private String goodsname;//货物名称
	private String name;//入库人
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
	public String getMaterialnum() {
		return materialnum;
	}
	public void setMaterialnum(String materialnum) {
		this.materialnum = materialnum;
	}
	public String getMaterialtype() {
		return materialtype;
	}
	public void setMaterialtype(String materialtype) {
		this.materialtype = materialtype;
	}
	public String getMaterialname() {
		return materialname;
	}
	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}
	
	public Double getInventoryunit() {
		return inventoryunit;
	}
	public void setInventoryunit(Double inventoryunit) {
		this.inventoryunit = inventoryunit;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
