/**
 * 
 */
package com.aaa.entity.purchase;

/**
 * @类名称: PurOrder
 * @描述类: 订单详情表实体类
 * @author: LiuJinYu
 * @time: 2018-7-28上午11:21:13
 * 
 */
public class PurOrder {
	private Integer id;//主键id
	private String orderid;//订单号
	private String goodsname;//货物名称
	private String types;//货物型号
	private String company;//供应商
	private String price;//单价
	private String weights;//购买重量
	private String money;//总额
	private String reason;//质检理由
	private String qualityname;//质检人
	private Integer states;//质检状态
	private String name;//入库人
	private Double allmoney;
	private String time;
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Double getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(Double allmoney) {
		this.allmoney = allmoney;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getWeights() {
		return weights;
	}
	public void setWeights(String weights) {
		this.weights = weights;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getQualityname() {
		return qualityname;
	}
	public void setQualityname(String qualityname) {
		this.qualityname = qualityname;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
