package com.aaa.entity.finance;

/** 
 * @类名称:  PageVo 
 * @类描述:	分页辅助类
 * @author  公子哥
 * @time    2018-7-23下午3:19:28
 * @version 1.0
 */
public class PageVo {
	
	private Integer rows; //每页显示数据条数
	private Integer page; //当前页数
	private String  sort;
	private String  order;
	
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
}
