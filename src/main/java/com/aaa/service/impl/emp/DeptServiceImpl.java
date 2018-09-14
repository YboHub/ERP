package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.DeptDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;
import com.aaa.service.emp.DeptService;

@Service
public class DeptServiceImpl implements DeptService {
	@Autowired
	private DeptDao deptDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return deptDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectDept(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return deptDao.selectDept(map);
	}
	/**
	 *查询数据库是否存在部门编号
	 */
	@Override
	public List<Map> selectDeptno(Integer deptno) {
		return deptDao.selectDeptno(deptno);
	}

	/**
	 * 添加部门信息
	 */
	@Override
	public void saveDept(Dept dept) {
		deptDao.saveDept(dept);
	}

	/**
	 * 修改部门返回修改信息的值
	 */
	@Override
	public List<Map> toUpdate(Integer id) {
		return deptDao.toUpdate(id);
	}

	/**
	 * 修改部门
	 */
	@Override
	public int updatePer(Dept dept) {
		return deptDao.updatePer(dept);
	}

	/**
	 * 查询部门里是否存在员工
	 */
	@Override
	public List<Map> selectEmp(String deptno) {
		return deptDao.selectEmp(deptno);
	}
	
	/**
	 *删除部门
	 */
	
	@Override
	public void delDept(Integer id) {
		deptDao.delDept(id);
	}

	/**
	 * 查询所有部门
	 */
	@Override
	public List<Map> selectDeptnoo(Dept dept) {
		return deptDao.selectDeptnoo(dept);
	}

	/**
	 *添加职位
	 */
	@Override
	public void savePosition(Dept dept) {
		deptDao.savePosition(dept);
	}

}