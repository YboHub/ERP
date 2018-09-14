package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.EmpDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;
import com.aaa.entity.emp.Emp;
import com.aaa.service.emp.EmpService;
@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao empDao;
	@Override
	public List<Emp> selectEmp(Emp emp) {
		return empDao.selectEmp(emp);
	}
	@Override
	public int addEmp(Emp emp) {
		return empDao.addEmp(emp);
	}
	@Override
	public int updateEmp(Emp emp) {
		return empDao.updateEmp(emp);
	}
	@Override
	public int deleteEmp(Emp emp) {
		return empDao.deleteEmp(emp);
	}
	@Override
	public List<Map<String, Object>> selectEmpDept(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = vo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return empDao.selectEmpDept(map);
	}
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return empDao.findCountByMap(map);
	}
	
	/**
	 * 查看员工编号是否存在
	 */
	@Override
	public List<Map> selectEmpno(Integer empno) {
		return empDao.selectEmpno(empno);
	}
	/**
	 * 查询下拉框部门值
	 */
	@Override
	public List<Map> selectDeptno(Dept dept) {
		return empDao.selectDeptno(dept);
	}
	/**
	 *根据部门编号查询部门职位 
	 */
	@Override
	public List<Map> SelectPosition(String deptno) {
		return empDao.SelectPosition(deptno);
	}
	/**
	 * 查询部门职业
	 */
	@Override
	public List<Map> getPositionList(Integer id) {
		return empDao.getPositionList(id);
	}

}
