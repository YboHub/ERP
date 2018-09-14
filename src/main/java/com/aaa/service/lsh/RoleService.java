package com.aaa.service.lsh;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.aaa.entity.PageVo;
import com.aaa.entity.lsh.Positions;

public interface RoleService {

	Set<String> findRoleFunByRoleId(Integer roleid);

	List<Map> findAllRole();

	List<Map> findAllFunction();
	/**
	 * 保存授权信息
	 * @return 
	 */
	int saveRoleFunc(Integer roleid, String ids);
	/**
	 * 获取职位列表总行数
	 * @param map
	 * @return
	 */
	int getAllRoleList(Map<String, Object> map);
	/**
	 * 获取职位列表集合
	 * @param pageVo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getRoleList(PageVo pageVo, Map<String, Object> map);
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
	boolean toUpdateRole(Positions positions);
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
	boolean toInsertRole(Positions positions);
	/**
	 * 通过id删除指定职位
	 * @param id
	 * @return
	 */
	int delRole(Integer id);

}
