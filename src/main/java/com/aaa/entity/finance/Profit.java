package com.aaa.entity.finance;

/** 
 * @类名称:  Profit 
 * @类描述:
 * @author  公子哥
 * @time    2018-8-6上午9:01:29
 * @version 1.0
 */
public class Profit {
	/***
	 * 全局变量
	 */
	private Integer proid;   //利润id
	private String  promoney;//利润的钱
	
	/***
	 * set get 方法
	 * @return
	 */
	public Integer getProid() {
		return proid;
	}
	public void setProid(Integer proid) {
		this.proid = proid;
	}
	public String getPromoney() {
		return promoney;
	}
	public void setPromoney(String promoney) {
		this.promoney = promoney;
	}
	
}
