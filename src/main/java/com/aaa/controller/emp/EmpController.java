package com.aaa.controller.emp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;
import com.aaa.entity.emp.Emp;
import com.aaa.service.emp.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpController {
	@Autowired
	private EmpService empService;
	
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(Emp emp, Model model){
		return "emp/empList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = empService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> empList = empService.selectEmpDept(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(empList);
		return dg;
	}
	/**
	 * 添加
	 */
	@RequestMapping("toAdd")
	public String toAdd(Dept dept,Model model){
		//查询部门
		List<Map> list = empService.selectDeptno(dept);
		model.addAttribute("list", list);
		return "emp/empAdd";
	}
	/**
	 * 保存
	 */
	@RequestMapping("save")
	@ResponseBody
	public int toSave(Emp emp){
		int row = empService.addEmp(emp);
		return row;
	}
	/**
	 * 更改跳转页面
	 */
	@RequestMapping("toEdit")
	public String toEdit(Emp emp,Model model,Dept dept,Integer id){
		//选择该用户
		List<Emp> editList = empService.selectEmp(emp);
		//查询部门
		List<Map> list = empService.selectDeptno(dept);
		//获取职位列表
    	List<Map> positionList=empService.getPositionList(id);
		model.addAttribute("editList", editList);
		model.addAttribute("list", list);
		model.addAttribute("positionList", positionList);
		return "emp/empEdit"; 
	}
	/**
	 * 提交更改
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(Emp emp){
		int row = empService.updateEmp(emp);
		return row;
	}
	
	/**
	 * 查看员工编号是否存在
	 */
	@RequestMapping("chakan")
	@ResponseBody
	public Object chakan(Integer empno){
		List<Map> list=empService.selectEmpno(empno);
		String msg="";
		if(list!=null&&list.size()>0){
			msg = "员工编号已存在！请重新输入";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", msg);
		return map;
	}
	
	/**
	 *根据部门编号查询部门职位 
	 */
	@RequestMapping("onDeptno")
	@ResponseBody
	public Object onDeptno(String deptno){
		List<Map> list = empService.SelectPosition(deptno);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("list", list);
		return map;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("delete")
	@ResponseBody
	public int toDelete(Emp emp){
		int row = empService.deleteEmp(emp);
		return row;
	}
	
}
