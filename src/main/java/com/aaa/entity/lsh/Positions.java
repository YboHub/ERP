package com.aaa.entity.lsh;
/**
 * 类名称：Positions
 * 类描述： 职位实体类
 * 创建人：lishenghua
 * 创建时间：2018-8-17 上午11:20:54
 * @version
 */
public class Positions {
	/**
	 * 职位id
	 */
	private Integer id;
	/**
	 * 部门编号
	 */
	private String deptno;
	/**
	 * 职位
	 */
	private String post;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	
	
}
