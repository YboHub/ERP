package com.aaa.service.impl.lsh;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lsh.RoleDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.lsh.Positions;
import com.aaa.service.lsh.RoleService;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	/**
	 * 获取已授权的权限信息
	 */
	@Override
	public Set<String> findRoleFunByRoleId(Integer roleid) {
		//存储已授权的菜单id集合
		Set<String> set = new HashSet<String>();
		List<Map> list = roleDao.findRoleFunByRoleId(roleid);
		for (Map map : list) {
			set.add(map.get("fun_id").toString());
		}
		return set;
	}
	/**
	 * 查询所有角色信息
	 */
	@Override
	public List<Map> findAllRole() {
		return roleDao.findAllRole();
	}
	/**
	 * 获取所有的菜单
	 */
	@Override
	public List<Map> findAllFunction() {
		return roleDao.findAllFunction();
	}
	/**
	 * 保存授权信息
	 * @return 
	 */
	@Override
	public int saveRoleFunc(Integer roleid, String ids) {
		//先删除原来的授权信息
		roleDao.deleteRoleFun(roleid);
		//保存新增的授权信息
		int i=0;
		if(ids!=null&&ids.length()>0){
			String[] idArr = ids.split(",");
			int row=0;
			for (String id : idArr) {
				Integer funid = Integer.valueOf(id);
				row=roleDao.insertRoleFun(roleid,funid);
				if (row>0) {
					i++;
				}
			}
		}
		return i;
	}
	/**
	 * 获取职位列表总行数
	 */
	@Override
	public int getAllRoleList(Map<String, Object> map) {
		return roleDao.getAllRoleList(map);
	}
	/**
	 * 获取职位列表集合
	 */
	@Override
	public List<Map<String, Object>> getRoleList(PageVo pageVo,
			Map<String, Object> map) {
		int begin=pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end=pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return roleDao.getRoleList(map);
	}
	/**
	 * 通过id获取职位信息
	 */
	@Override
	public List<Map<String, Object>> getPostById(Integer id) {
		return roleDao.getPostById(id);
	}
	/**
	 * 提交修改职位信息
	 */
	@Override
	public boolean toUpdateRole(Positions positions) {
		int row=roleDao.toUpdateRole(positions);
		boolean flag=false;
		if (row>0) {
			flag=true;
		}
		return flag;
	}
	/**
	 * 获取所有部门信息
	 */
	@Override
	public List<Map<String, Object>> getDeptList() {
		return roleDao.getDeptList();
	}
	/**
	 * 提交新增职位信息
	 */
	@Override
	public boolean toInsertRole(Positions positions) {
		int row=roleDao.toInsertRole(positions);
		boolean flag=false;
		if (row>0) {
			flag=true;
		}
		return flag;
	}
	/**
	 * 通过id删除指定职位
	 */
	@Override
	public int delRole(Integer id) {
		return roleDao.delRole(id);
	}

}
