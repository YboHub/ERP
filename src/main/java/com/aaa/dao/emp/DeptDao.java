package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Dept;

public interface DeptDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectDept(Map<String, Object> map);

	List<Map> selectDeptno(Integer deptno);

	void saveDept(Dept dept);

	List<Map> toUpdate(Integer id);

	int updatePer(Dept dept);

	List<Map> selectEmp(String deptno);

	void delDept(Integer id);

	List<Map> selectDeptnoo(Dept dept);

	void savePosition(Dept dept);

}
