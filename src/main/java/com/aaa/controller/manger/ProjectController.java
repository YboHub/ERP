package com.aaa.controller.manger;

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
import com.aaa.entity.manger.Plan;
import com.aaa.service.manger.ProjectService;

@Controller
@RequestMapping("/manger")
public class ProjectController {
	@Autowired
	private ProjectService projectService;
	
	/**
	 * 查询
	 */
	@RequestMapping("tooList")
	public String toList(Plan plan, Model model){
		return "manger/projectList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = projectService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> projectList = projectService.selectproject(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(projectList);
		return dg;
	}
	/**
	 *审核表 
	 */
	@RequestMapping("toEdit")
	public String toEdit(Plan plan,Model model){
		List<Plan> list = projectService.selectPlan(plan);
		model.addAttribute("list", list);
		return "manger/projectEdit"; 
	}
	
	/**
	 *同意审核 
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(Plan plan){
		int row = projectService.updatePlan(plan);
		List<Plan> list=projectService.select(plan);
		projectService.insert(list.get(0));
		return row;
	}
	
	/**
	 *不同意审核 
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public int tooUpdate(Plan plan){
		int row = projectService.noupdatePlan(plan);
		return row;
	}
}
