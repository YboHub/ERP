package com.aaa.entity;

import java.util.List;

/**
 * 类名称：DataGrid
 * 类描述： 分页辅助类
 * 创建人：
 * 创建时间：2018-4-19 下午7:44:50
 * @version
 */
public class DataGrid {
	
	private Integer total;		//总的行数
	private List rows;			//所有行的数据
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	

}
