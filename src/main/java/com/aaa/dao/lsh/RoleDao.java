package com.aaa.dao.lsh;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.aaa.entity.lsh.Positions;

public interface RoleDao {

	List<Map> findRoleFunByRoleId(Integer roleid);

	List<Map> findAllRole();

	List<Map> findAllFunction();
	/**
	 * 删除原来的授权信息
	 * @param roleid
	 */
	void deleteRoleFun(Integer roleid);
	/**
	 * 保存新增的授权信息
	 * @param roleid
	 * @param funid
	 * @return 
	 */
	int insertRoleFun(Integer roleid, Integer funid);
	/**
	 * 获取职位列表总行数
	 * @param map
	 * @return
	 */
	int getAllRoleList(Map<String, Object> map);
	/**
	 * 获取职位列表集合
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getRoleList(Map<String, Object> map);
	/**
	 * 通过id获取职位信息
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> getPostById(Integer id);
	/**
	 * 提交修改职位信息
	 * @param positions
	 * @return
	 */
	int toUpdateRole(Positions positions);
	/**
	 * 获取所有部门信息
	 * @return
	 */
	List<Map<String, Object>> getDeptList();
	/**
	 * 提交新增职位信息
	 * @param positions
	 * @return
	 */
	int toInsertRole(Positions positions);
	/**
	 * 通过id删除指定职位
	 * @param id
	 * @return
	 */
	int delRole(Integer id);


}
