package com.aaa.entity.sell;
/**
 * 
 * 类名称：Client
 * 类描述：客户
 * @author Aer
 * @date 2018-7-26 下午8:13:04
 * @version
 */
public class Client {
	/**
	 * 客户ID
	 */
	private Integer id;
	/**
	 * 客户编号
	 */
	private Integer cno;
	/**
	 * 客户电话 
	 */
	private String cphone;
	/**
	 * 客户名称
	 */
	private String cname;
	/**
	 * 客户类型
	 */
	private String csort;
	/**
	 * 省
	 */
	private String province;
	/**
	 * 市
	 */
	private String city;
	/**
	 * 县,区域
	 */
	private String area;
	/**
	 * 详细地址
	 */
	private String address;
	/**
	 * 客户区域
	 */
	private String carea;
	/**
	 * 客户从事行业
	 */
	private String business;
	/**
	 * 业务编号
	 */
	private String empno;
	/**
	 * 业务员
	 */
	private String ename;
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCsort() {
		return csort;
	}
	public void setCsort(String csort) {
		this.csort = csort;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCarea() {
		return carea;
	}
	public void setCarea(String carea) {
		this.carea = carea;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	
}
