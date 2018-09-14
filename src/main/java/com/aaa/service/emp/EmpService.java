package com.aaa.service.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;
import com.aaa.entity.emp.Emp;

public interface EmpService {

	List<Emp> selectEmp(Emp emp);

	int addEmp(Emp emp);

	int updateEmp(Emp emp);

	int deleteEmp(Emp emp);

	List<Map<String, Object>> selectEmpDept(PageVo vo,Map<String, Object> map);

	int findCountByMap(Map<String, Object> map);

	List<Map> selectEmpno(Integer empno);

	List<Map> selectDeptno(Dept dept);

	List<Map> SelectPosition(String deptno);

	List<Map> getPositionList(Integer id);

}
