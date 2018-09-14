package com.aaa.controller.manger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialService;
import com.aaa.service.manger.MaterialssService;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("material")
public class MaterialssController {
@Autowired
private MaterialssService materialssService;

/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "materialss/materialssList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = materialssService.findCountBymaterial(map);
	//数据库分页
	List<Map<String,Object>> empList = materialssService.selectmaterial(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 
 */
@RequestMapping("toAdd")
public String toAdd(Integer mid,Model model){
	List<Material> list=materialssService.select(mid);
	model.addAttribute("list",list);
	return "materialss/add";
}

/**
 * 审核同意
 */
@RequestMapping("toUpdate")
@ResponseBody
public int toUpdate(Material material,HttpSession session){
	String name=(String) session.getAttribute("ename");
	material.setMperson(name);
	String time=NowTimeUtil.newTime();
	material.setMshi(time);
	int row=materialssService.toUpdate(material);
	return row;
}

/**
 * 审核不同意
 */
@RequestMapping("tooUpdate")
@ResponseBody
public int tooUpdate(Material material,HttpSession session){
	String name=(String) session.getAttribute("ename");
	material.setMperson(name);
	String time=NowTimeUtil.newTime();
	material.setMshi(time);
	int row=materialssService.tooUpdate(material);
	return row;
}
}
