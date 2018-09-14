package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Dept;
import com.aaa.entity.emp.Emp;

public interface EmpDao {

	List<Emp> selectEmp(Emp emp);

	int addEmp(Emp emp);

	int updateEmp(Emp emp);

	int deleteEmp(Emp emp);

	List<Map<String, Object>> selectEmpDept(Map<String, Object> map);

	int findCountByMap(Map<String, Object> map);

	List<Map> selectEmpno(Integer empno);//查看员工编号是否存在

	List<Map> selectDeptno(Dept dept);//查询下拉框部门值

	List<Map> SelectPosition(String deptno);//根据部门编号查询部门职位 

	List<Map> getPositionList(Integer id);//查询部门职业

}
