package com.aaa.entity.vehicle;
/**
 * 类名称：Vehicle
 * 类描述： 实体类
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 
 * @version
 */
public class Vehicle {
	private Integer vid;//主键id
	private String vtype;//类型
	private String vlicensenumber;//车牌号码
	private String vmotorman;//司机
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getVtype() {
		return vtype;
	}
	public void setVtype(String vtype) {
		this.vtype = vtype;
	}
	public String getVlicensenumber() {
		return vlicensenumber;
	}
	public void setVlicensenumber(String vlicensenumber) {
		this.vlicensenumber = vlicensenumber;
	}
	public String getVmotorman() {
		return vmotorman;
	}
	public void setVmotorman(String vmotorman) {
		this.vmotorman = vmotorman;
	}
	
}
