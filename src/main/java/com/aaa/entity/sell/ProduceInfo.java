package com.aaa.entity.sell;
/**
 * 
 * 类名称：ProduceInfo
 * 类描述：产品
 * @author Aer
 * @date 2018-7-30 下午3:04:40
 * @version
 */
public class ProduceInfo {
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 产品编号
	 */
	private Integer pno;
	/**
	 * 产品名称
	 */
	private String pname;
	/**
	 * 产品型号
	 */
	private String psize;
	/**
	 * 产品单价
	 */
	private Double pprice;
	/**
	 * 产品单位
	 */
	private String punit;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPno() {
		return pno;
	}
	public void setPno(Integer pno) {
		this.pno = pno;
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
	public Double getPprice() {
		return pprice;
	}
	public void setPprice(Double pprice) {
		this.pprice = pprice;
	}
	public String getPunit() {
		return punit;
	}
	public void setPunit(String punit) {
		this.punit = punit;
	}
	
}
