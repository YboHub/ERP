package com.aaa.entity;

/**
 * 类名称：PageVo
 * 类描述： 分页辅助类
 * 创建人：sunshaoshan
 * 创建时间：2018-4-19 下午7:44:38
 * @version
 */
public class PageVo {
	
	private Integer rows;//每页显示数据条数
	private Integer page;//当前页数
	private String sort;
	private String order;
	
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
	@Override
	public String toString() {
		return "PageVo [rows=" + rows + ", page=" + page + ", sort=" + sort
				+ ", order=" + order + "]";
	}
	
	

}
