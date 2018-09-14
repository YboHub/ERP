package com.aaa.dao.lsh;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Emp;
import com.aaa.entity.lsh.User;

public interface UserDao {
	/**
	 * 获取登陆账号信息
	 * @param user
	 * @return
	 */
	List<Map<String, Object>> getLoginUser(User user);
	/**
	 * 获取登陆账号权限菜单
	 * @param userid
	 * @return
	 */
	List<Map> findMenuList(Object userid);
	/**
	 * 获取用户列表总行数
	 * @param map
	 * @return
	 */
	int getAllCountOfUserList(Map<String, Object> map);
	/**
	 * 获取用户列表集合
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getUserList(Map<String, Object> map);
	/**
	 * 获取指定用户信息
	 * @param empno
	 * @return
	 */
	List<Map<String, Object>> toEditUser(Integer empno);
	/**
	 * 获取部门列表
	 * @return
	 */
	List<Map<String, Object>> getDeptList();
	/**
	 * 获取职位列表
	 * @param empno 
	 * @return
	 */
	List<Map<String, Object>> getPositionList(Integer empno);
	/**
	 * 根据deptno查找该部门的所有职位
	 * @param deptno
	 * @return
	 */
	List<Map<String, Object>> getPostByDeptno(String deptno);
	/**
	 * 修改员工表里的员工信息
	 * @param emp
	 * @return
	 */
	int updateEmp(Emp emp);
	/**
	 * 修改登陆表里的账号信息
	 * @param user
	 * @return
	 */
	int updateAccount(User user);
	/**
	 * 删除用户信息
	 * @param empno
	 * @return
	 */
	int deleteUserInfo(String empno);
	/**
	 * 通过员工编号获取员工信息
	 * @param empno
	 * @return
	 */
	List<Map<String, Object>> getEmpInfoByEmpno(String empno);
	/**
	 * 搜索新增的账号在数据库中是否已经存在
	 * @param account
	 * @return
	 */
	List<Map<String, Object>> searchAccFormAdmin(String account);
	/**
	 * 向数据中添加新增账号密码
	 * @param user
	 * @return
	 */
	int saveAcc(User user);
	/**
	 * 向用户角色表中添加数据
	 * @param roleid 
	 * @param userid 
	 * @param roleid
	 * @param object 
	 * @return
	 */
	int saveUserRoleId(int userid, int roleid);
	/**
	 * 在用户角色表中删除数据
	 * @param roleid
	 */
	void deleteUserRoleInfo(int roleid);
	/**
	 * 获取新插入数据id
	 * @param user
	 * @return
	 */
	int getUserId(User user);

}
