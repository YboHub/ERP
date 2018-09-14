package com.aaa.controller.manger;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;

import com.aaa.entity.manger.Capacity;
import com.aaa.entity.manger.Manger;
import com.aaa.service.manger.CapacityService;

@Controller
@RequestMapping("/capacity")
public class CapacityController {
@Autowired
	private CapacityService capacityService;

/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "capacity/capacityList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = capacityService.findCountByCapacity(map);
	//数据库分页
	List<Map<String,Object>> empList = capacityService.selectCapacity(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 添加
 */
@RequestMapping("toAdd")
public String toAdd(){
	return "capacity/capacityAdd";
}
/**
 * 保存
 */
@RequestMapping("toSave")
@ResponseBody
public int toSave(Capacity capacity){
	int row = capacityService.addmanger(capacity);
	return row;
}

/**
 * 删除
 * @param 
 * @return
 */
@RequestMapping("delete")
@ResponseBody
public int toDelete(Capacity capacity){
	int row = capacityService.deletemanger(capacity);
	return row;
}

/**
 * 更改
 */
@RequestMapping("toEdit")
public String toEdit(Capacity capacity,Model model){
	List<Manger> editList = capacityService.selectmangers(capacity);
	model.addAttribute("editList", editList);
	return "capacity/capacityEdit"; 
}

/**
 * 提交更改
 */
@RequestMapping("toUpdate")
@ResponseBody
public int toUpdate(Capacity capacity){
	int row = capacityService.updatemanger(capacity);
	return row;
}

}
