package com.aaa.entity.sell;

/**
 * 
 * 类名称：OrderDetail
 * 类描述：订单详情
 * @author Aer
 * @date 2018-7-28 下午4:24:37
 * @version
 */
public class OrderDetail {
	/**
	 * id
	 */
	private String id;
	/**
	 * 订单编号
	 */
	private String orderno;
	/**
	 * 小计
	 */
	private String msubtotal;
	/**
	 * 总计
	 */
	private String mtotal;
	/**
	 * 产品编号
	 */
	private String pno;
	/**
	 * 产品名称
	 */
	private String pname;
	/**
	 * 产品数量
	 */
	private String pnum;
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
	 * 状态
	 */
	private Integer state;
	/**
	 * 计划状态
	 */
	private String zhuang;
	
	private String warehouse;
	private String time;
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}
	public String getMtotal() {
		return mtotal;
	}
	public void setMtotal(String mtotal) {
		this.mtotal = mtotal;
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
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public String getMsubtotal() {
		return msubtotal;
	}
	public void setMsubtotal(String msubtotal) {
		this.msubtotal = msubtotal;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getZhuang() {
		return zhuang;
	}
	public void setZhuang(String zhuang) {
		this.zhuang = zhuang;
	}
	
}
