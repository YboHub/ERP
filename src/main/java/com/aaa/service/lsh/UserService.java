package com.aaa.service.lsh;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Emp;
import com.aaa.entity.lsh.User;

public interface UserService {
	/**
	 * 获取登陆账号信息
	 * @param user
	 * @return
	 */
	List<Map<String, Object>> getLoginUser(User user);
	/**
	 * 获取登陆账号权限菜单
	 * @param object
	 * @return
	 */
	Map<String, List> findMenuList(Object object);
	/**
	 * 获取用户列表总行数
	 * @param map
	 * @return
	 */
	int getAllCountOfUserList(Map<String, Object> map);
	/**
	 * 获取用户列表集合
	 * @param pageVo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getUserList(PageVo pageVo, Map<String, Object> map);
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
	 * 修改用户信息
	 * @param emp
	 * @param user
	 * @return
	 */
	boolean updateUserInfo(Emp emp, User user);
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
	boolean saveAcc(User user);

}
