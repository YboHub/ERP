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
import com.aaa.entity.manger.YuanChu;
import com.aaa.service.manger.YuanChuService;

@Controller
@RequestMapping("yuanchu")
public class YuanChuController {
@Autowired
private YuanChuService yuanChuService;

/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "materialjilu/list";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = yuanChuService.findCountyuanchu(map);
	//数据库分页
	List<Map<String,Object>> empList = yuanChuService.selectyuanchu(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 详情
 */
@RequestMapping("toEdit")
public String toEdit(Integer mid,Model model){
	model.addAttribute("mid",mid);
	return "materialjilu/add";
}
/**
 * 
 */
@RequestMapping("dataOne")
@ResponseBody
public Object dataOne(YuanChu yuanchu){
	List<YuanChu> rows = yuanChuService.selectmaterialss(yuanchu);
	return rows;
}
}
