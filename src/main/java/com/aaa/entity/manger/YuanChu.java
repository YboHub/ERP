package com.aaa.entity.manger;

import java.util.Date;

/**
 * 
 * 类名称：YuanChu
 * 类描述： 
 * 创建人：suzhi
 * 创建时间：2018-8-10 下午2:45:56
 * @version
 */
public class YuanChu {
	/*
	 * 主键
	 */
private  Integer mid;
/*
 * 编号
 */
private String mnumber;
/*
 * 型号
 */
private String pnumber;
/*
 * 数量
 */
private String pnum;
/*
 * 出库人
 */
private String mperson;
/*
 * 出库时间
 */
private Date addtime;
/*
 * 状态
 */
private String zhuang;

private String name;

private String zong;




public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getZong() {
	return zong;
}

public void setZong(String zong) {
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

public String getPnum() {
	return pnum;
}

public void setPnum(String pnum) {
	this.pnum = pnum;
}

public String getMperson() {
	return mperson;
}

public void setMperson(String mperson) {
	this.mperson = mperson;
}

public Date getAddtime() {
	return addtime;
}

public void setAddtime(Date addtime) {
	this.addtime = addtime;
}

public String getZhuang() {
	return zhuang;
}

public void setZhuang(String zhuang) {
	this.zhuang = zhuang;
}


}
