package com.aaa.entity.mechanicalHelp;
/**
 * 类名称：MechanicalHelp
 * 类描述： 实体类
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 
 * @version
 */
public class MechanicalHelp {
	private Integer mid;//主键id
	private String mlicensenumber;//车牌号
	private String mtype;//类型
	private String mbeginTime;//开始时间
	private String mendTime;//送修司机
	private String mmotorman;//
	private String maccendant;//维修人员
	private String mcause;//故障原因
	private String msum;//金额
	private String midentifier;//检验人员
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMlicensenumber() {
		return mlicensenumber;
	}
	public void setMlicensenumber(String mlicensenumber) {
		this.mlicensenumber = mlicensenumber;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getMbeginTime() {
		return mbeginTime;
	}
	public void setMbeginTime(String mbeginTime) {
		this.mbeginTime = mbeginTime;
	}
	public String getMendTime() {
		return mendTime;
	}
	public void setMendTime(String mendTime) {
		this.mendTime = mendTime;
	}
	public String getMmotorman() {
		return mmotorman;
	}
	public void setMmotorman(String mmotorman) {
		this.mmotorman = mmotorman;
	}
	public String getMaccendant() {
		return maccendant;
	}
	public void setMaccendant(String maccendant) {
		this.maccendant = maccendant;
	}
	public String getMcause() {
		return mcause;
	}
	public void setMcause(String mcause) {
		this.mcause = mcause;
	}
	
	public String getMsum() {
		return msum;
	}
	public void setMsum(String msum) {
		this.msum = msum;
	}
	public String getMidentifier() {
		return midentifier;
	}
	public void setMidentifier(String midentifier) {
		this.midentifier = midentifier;
	}
	
}
