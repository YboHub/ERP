package com.aaa.entity.warehouseentity;

public class StockManager {
	private Integer id;//主键
	private String rkdh;//入库单号
	private String productionnum;//生产编号
	private String deliveryman;//送货人
	private String  audittime;//审核时间
	private String remark;//备注
	private Integer auditstatus;//审核状态
	private Integer warehousenum;//仓库编号
	private String goodsname;//货物名称
	private String goodsnum;//货物编号
	private Double inventoryunit;//入库数量
	private String verifyman;//审核人
	private String addtime;//入库时间
	private String goodstype;//货物类型
	private Double onerebarunit;
	private Integer typeno;
	private Double oldweight;
	private String pname;
	private String psize;
	private Integer cid;
	private String protime;
	private String propeople;
	private Double zong;
	private String dnumber;
	
	
	public String getDnumber() {
		return dnumber;
	}
	public void setDnumber(String dnumber) {
		this.dnumber = dnumber;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRkdh() {
		return rkdh;
	}
	public void setRkdh(String rkdh) {
		this.rkdh = rkdh;
	}
	public String getProductionnum() {
		return productionnum;
	}
	public void setProductionnum(String productionnum) {
		this.productionnum = productionnum;
	}
	public String getDeliveryman() {
		return deliveryman;
	}
	public void setDeliveryman(String deliveryman) {
		this.deliveryman = deliveryman;
	}
	public String getAudittime() {
		return audittime;
	}
	public void setAudittime(String audittime) {
		this.audittime = audittime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getAuditstatus() {
		return auditstatus;
	}
	public void setAuditstatus(Integer auditstatus) {
		this.auditstatus = auditstatus;
	}
	public Integer getWarehousenum() {
		return warehousenum;
	}
	public void setWarehousenum(Integer warehousenum) {
		this.warehousenum = warehousenum;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(String goodsnum) {
		this.goodsnum = goodsnum;
	}
	public String getVerifyman() {
		return verifyman;
	}
	public void setVerifyman(String verifyman) {
		this.verifyman = verifyman;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getGoodstype() {
		return goodstype;
	}
	public void setGoodstype(String goodstype) {
		this.goodstype = goodstype;
	}
	public Double getInventoryunit() {
		return inventoryunit;
	}
	public void setInventoryunit(Double inventoryunit) {
		this.inventoryunit = inventoryunit;
	}
	public Double getOnerebarunit() {
		return onerebarunit;
	}
	public void setOnerebarunit(Double onerebarunit) {
		this.onerebarunit = onerebarunit;
	}
	public Integer getTypeno() {
		return typeno;
	}
	public void setTypeno(Integer typeno) {
		this.typeno = typeno;
	}
	public Double getOldweight() {
		return oldweight;
	}
	public void setOldweight(Double oldweight) {
		this.oldweight = oldweight;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getProtime() {
		return protime;
	}
	public void setProtime(String protime) {
		this.protime = protime;
	}
	public String getPropeople() {
		return propeople;
	}
	public void setPropeople(String propeople) {
		this.propeople = propeople;
	}
	public Double getZong() {
		return zong;
	}
	public void setZong(Double zong) {
		this.zong = zong;
	}
}
