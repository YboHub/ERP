package com.aaa.service.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;

public interface DeptService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectDept(PageVo pagevo, Map<String, Object> map);

	List<Map> selectDeptno(Integer deptno);//查询数据部门编号是否存在

	void saveDept(Dept dept);//添加部门

	List<Map> toUpdate(Integer id);//修改部门返回修改信息的值

	int updatePer(Dept dept);//修改部门

	List<Map> selectEmp(String deptno);//查询部门里是否存在员工

	void delDept(Integer id);//删除部门

	List<Map> selectDeptnoo(Dept dept);//查询所有部门

	void savePosition(Dept dept);//添加职位

}
