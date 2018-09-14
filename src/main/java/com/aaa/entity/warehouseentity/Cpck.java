package com.aaa.entity.warehouseentity;

import java.util.Date;

public class Cpck {
	/**
	 * id
	 */
	private String id;
	/**
	 * 小计
	 */
	private String msubtotal;
	/**
	 * 产品编号
	 */
	private Integer pno;
	/**
	 * 产品名称
	 */
	private String pname;
	/**
	 * 产品数量
	 */
	private Integer pnum;
	/**
	 * 产品型号
	 */
	private String psize;
	/**
	 * 产品单价
	 */
	private String pprice;
	/**
	 * 产品单位
	 */
	private String punit;
	/**
	 * 计划状态
	 */
	private String zhuang;
	
	/**
	 * 客户编号
	 */
	private Integer cno;
	/**
	 * 客户名称
	 */
	private String cname;
	/**
	 * 订单编号
	 */
	private String orderno;
	/**
	 * 下单时间
	 */
	private Date ordertime;
	/**
	 * 仓库
	 */
	private String warehouse;
	/**
	 * 销售员
	 */
	private String ename;
	/**
	 * 销售员编号
	 */
	private Integer empno;
	/**
	 * 总计
	 */
	private String mtotal;
	/**
	 * 状态
	 */
	private String state;
	/**
	 * 备注信息
	 */
	private String remark;
	
	/**
	 * 出库审核时间
	 */
	private String proaudittime;
	/**
	 * 出库审核人
	 */
	private String auditman;
	/**
	 *出库审核备注 
	 */
	private String auditremark;
	/**
	 * 库存总量
	 */
	private Double oldUnit;
	private Double kz;
	private Double zl;
	private Double sy;
	/**
	 * session操作人
	 * @return
	 */
	private String ckname;
	/**
	 * 出库时间
	 * @return
	 */
	private String ctime;
	/**
	 * 出库单号
	 * @return
	 */
	private String ckdh;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMsubtotal() {
		return msubtotal;
	}
	public void setMsubtotal(String msubtotal) {
		this.msubtotal = msubtotal;
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
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	public String getZhuang() {
		return zhuang;
	}
	public void setZhuang(String zhuang) {
		this.zhuang = zhuang;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public String getMtotal() {
		return mtotal;
	}
	public void setMtotal(String mtotal) {
		this.mtotal = mtotal;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getProaudittime() {
		return proaudittime;
	}
	public void setProaudittime(String proaudittime) {
		this.proaudittime = proaudittime;
	}
	public String getAuditman() {
		return auditman;
	}
	public void setAuditman(String auditman) {
		this.auditman = auditman;
	}
	public String getAuditremark() {
		return auditremark;
	}
	public void setAuditremark(String auditremark) {
		this.auditremark = auditremark;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
	}
	public Integer getPnum() {
		return pnum;
	}
	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}
	public Double getOldUnit() {
		return oldUnit;
	}
	public void setOldUnit(Double oldUnit) {
		this.oldUnit = oldUnit;
	}
	public String getCkname() {
		return ckname;
	}
	public void setCkname(String ckname) {
		this.ckname = ckname;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getCkdh() {
		return ckdh;
	}
	public void setCkdh(String ckdh) {
		this.ckdh = ckdh;
	}
	public Double getKz() {
		return kz;
	}
	public void setKz(Double kz) {
		this.kz = kz;
	}
	public Double getZl() {
		return zl;
	}
	public void setZl(Double zl) {
		this.zl = zl;
	}
	public Double getSy() {
		return sy;
	}
	public void setSy(Double sy) {
		this.sy = sy;
	}
	
	
}
