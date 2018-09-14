package com.aaa.entity.lsh;
/**
 * 类名称：ProRecord
 * 类描述： 生产记录
 * 创建人：lishenghua
 * 创建时间：2018-7-30 下午7:23:46
 * @version
 */
public class ProRecord {
	/**
	 * 生产记录ID
	 */
	private Integer id;
	/**
	 * 生产编号
	 */
	private String prono;
	/**
	 * 产品类型
	 */
	private String type;
	/**
	 * 本批产品重量
	 */
	private Float weight;
	/**
	 * 本批产品数量
	 */
	private Integer num;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProno() {
		return prono;
	}
	public void setProno(String prono) {
		this.prono = prono;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Float getWeight() {
		return weight;
	}
	public void setWeight(Float weight) {
		this.weight = weight;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
}
