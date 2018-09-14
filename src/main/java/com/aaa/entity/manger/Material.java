package com.aaa.entity.manger;
/**
 * 
 * 类名称：Material
 * 类描述： 
 * 创建人：suzhi
 * 创建时间：2018-8-3 下午4:04:23
 * @version
 */
public class Material {
private Integer mid;//主键id
private String mnumber;//材料编号
private String pnumber;//生产编号
private String mzhuang;//状态
private String mperson;//处理人
private String mshi;//申请时间
private String 	myi;//审核意见
private String pnum; //数量
private String mname;//名称
private Double zong;//总量
private Double oldzong;//原库存

public Double getOldzong() {
	return oldzong;
}
public void setOldzong(Double oldzong) {
	this.oldzong = oldzong;
}
public String getMname() {
	return mname;
}
public void setMname(String mname) {
	this.mname = mname;
}
public Double getZong() {
	return zong;
}
public void setZong(Double zong) {
	this.zong = zong;
}
public Integer getMid() {
	return mid;
}
public void setMid(Integer mid) {
	this.mid = mid;
}
public String getMnumber() {
	return mnumber;
}
public void setMnumber(String mnumber) {
	this.mnumber = mnumber;
}
public String getPnumber() {
	return pnumber;
}
public void setPnumber(String pnumber) {
	this.pnumber = pnumber;
}
public String getMzhuang() {
	return mzhuang;
}
public void setMzhuang(String mzhuang) {
	this.mzhuang = mzhuang;
}
public String getMperson() {
	return mperson;
}
public void setMperson(String mperson) {
	this.mperson = mperson;
}
public String getMshi() {
	return mshi;
}
public void setMshi(String mshi) {
	this.mshi = mshi;
}
public String getMyi() {
	return myi;
}
public void setMyi(String myi) {
	this.myi = myi;
}
public String getPnum() {
	return pnum;
}
public void setPnum(String pnum) {
	this.pnum = pnum;
}

}
