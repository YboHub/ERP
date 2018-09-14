package com.aaa.entity.emp;

public class Matinventory {
	private Integer id;
	private Integer warehousenum;//仓库编号
	private String rkdh;//入库单号
	private String materialnum;//原料编号
	private String materialtype;//原料类型
	private String materialname;//原料名
	private Integer inventoryunit;//入库数量
	private String addtime;//入库时间
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
	public Integer getInventoryunit() {
		return inventoryunit;
	}
	public void setInventoryunit(Integer inventoryunit) {
		this.inventoryunit = inventoryunit;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	
}
