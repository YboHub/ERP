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
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.service.manger.PurOrderRuService;

@Controller
@RequestMapping("purOrderRu")
public class PurOrderRuController {
@Autowired
private PurOrderRuService purOrderRuService;

/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "purOrderRu/purOrderRuList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = purOrderRuService.findCountByPurOrderRu(map);
	//数据库分页
	List<Map<String,Object>> empList = purOrderRuService.selectPurOrderRu(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 入库
 */
@RequestMapping("update")
@ResponseBody
public int update(QualityRecord qualityRecord,HttpSession session){
	int row=purOrderRuService.update(qualityRecord);
	String sname = (String) session.getAttribute("ename");
	List<QualityRecord> list=purOrderRuService.select(qualityRecord);
	list.get(0).setName(sname);
	purOrderRuService.insert(list.get(0));
	purOrderRuService.up(list.get(0));
	return row;
}


/**
* 查询
*/
@RequestMapping("tooList")
public String tooList( Model model){
	return "purOrderRu/jilu";
}


@RequestMapping("data")
@ResponseBody
public Object data(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = purOrderRuService.findCountByInventory(map);
	//数据库分页
	List<Map<String,Object>> empList = purOrderRuService.selectInventory(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}
}
