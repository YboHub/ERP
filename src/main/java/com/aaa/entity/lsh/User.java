package com.aaa.entity.lsh;
/**
 * 类名称：User
 * 类描述： 登陆账号信息
 * 创建人：lishenghua
 * 创建时间：2018-8-17 下午8:39:36
 * @version
 */
public class User {
	/**
	 * 账号id
	 */
	private int id;
	/**
	 * 账号
	 */
	private String account;
	/**
	 * 密码
	 */
	private String password;
	/**
	 * 员工编号
	 */
	private String empno;
	
	
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
