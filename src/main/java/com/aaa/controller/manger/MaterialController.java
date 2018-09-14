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
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialService;

@Controller
@RequestMapping("materialss")
public class MaterialController {
@Autowired
private MaterialService materialService;

/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "material/materialList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = materialService.findCountBymaterial(map);
	//数据库分页
	List<Map<String,Object>> empList = materialService.selectmaterial(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}
/**
 * 删除
 */
@RequestMapping("delete")
@ResponseBody
public int toDelete(Material material){
	int row = materialService.deletematerial(material);
	return row;
}

/**
 * 详情
 */
@RequestMapping("toEdit")
public String toEdit(String mid,Model model){
	model.addAttribute("mid",mid);
	return "material/materialAdd";
}
@RequestMapping("dataOne")
@ResponseBody
public Object dataOne(Material material,Model model){
	List<Map<String,Object>> rows = materialService.selectmaterialss(material);
	return rows;
}

}
