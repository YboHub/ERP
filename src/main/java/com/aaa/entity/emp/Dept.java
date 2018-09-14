package com.aaa.entity.emp;

import java.util.List;


/**
 * 
 * 类名称：Dept
 * 类描述： 部门
 * 创建人：aer
 * 创建时间：2018-7-16 上午10:04:16
 * @version
 */
public class Dept {
	private Integer id;//主键
	private String deptno;//部门编号
	private String deptname;//部门名称
	private String tel;//部门电话
	private String site;//部门地址
	private String remark;//备注
	private String post;//部门职业
	private Integer empno;//员工编号
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	
}
