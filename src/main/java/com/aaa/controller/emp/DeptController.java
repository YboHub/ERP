package com.aaa.controller.emp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Dept;
import com.aaa.service.emp.DeptService;

@Controller
@RequestMapping("dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(Dept dept, Model model){
		return "dept/deptList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = deptService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> deptList = deptService.selectDept(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(deptList);
		return dg;
	}
	
	
	/**
	 * 跳转添加部门页面
	 */
	@RequestMapping("toAdd")
	public String toAddRole(){
		return "dept/deptAdd";
	}
	
	
	/**
	 * 查看部门编号是否存在
	 */
	@RequestMapping("chakan")
	@ResponseBody
	public Object chakan(Integer deptno){
		List<Map> list=deptService.selectDeptno(deptno);
		String msg="";
		if(list!=null&&list.size()>0){
			msg = "部门编号已存在！请重新输入";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("msg", msg);
		return map;
	}
	/**
	 * 添加部门
	 */
	@RequestMapping("save")
	@ResponseBody
	public Object saveperson(Dept dept){
		deptService.saveDept(dept);
		return 1;
	}
	
	/**
	 * 修改部门返回修改信息的值
	 */
	@RequestMapping("toUpdate")
	public String toUpdate(Integer id,Model model){
		List<Map> list = deptService.toUpdate(id);
		model.addAttribute("list", list);
		return "/dept/deptEdit";
	}
	
	/**
	 * 修改部门
	 */
	@RequestMapping("updates")
	@ResponseBody
	public Object updatePerson(Dept dept){
		int row = deptService.updatePer(dept);
		return row;
	}
	/**
	 * 删除部门
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Object delDept(String deptno,Integer id){
		List<Map> list = deptService.selectEmp(deptno);
		if(list!=null&&list.size()>0){
			return true;
		}else{
			deptService.delDept(id);
			return false;
		}
	}
	
	/**
	 * 跳转添加职位页面
	 */
	@RequestMapping("toAddposition")
	public String toAddposition(Dept dept,Model model){
		List<Map> list = deptService.selectDeptnoo(dept);
		model.addAttribute("list", list);
		return "dept/positionAdd";
	}
	
	/**
	 *添加职位 
	 */
	@RequestMapping("savePosition")
	@ResponseBody
	public Object savePosition(Dept dept){
		deptService.savePosition(dept);
		return 1;
	}
}
