package com.aaa.controller.emp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.service.emp.MaterualreturnService;

@Controller
@RequestMapping("/materualreturn")
public class MaterualreturnController {
	@Autowired
	private MaterualreturnService materualreturnService;
	
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(){
		return "materualreturn/materualreturnList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = materualreturnService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> materualreturnList = materualreturnService.selectMaterualreturn(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(materualreturnList);
		return dg;
	}
}
