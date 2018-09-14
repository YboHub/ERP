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
import com.aaa.entity.emp.Scrapinventory;
import com.aaa.service.emp.ScrapinventoryService;

@Controller
@RequestMapping("scrapinventory")
public class ScrapinventoryController {
	@Autowired
	private ScrapinventoryService scrapinventoryService;
	
	@RequestMapping("toList")
	public String toList(){
		return "scrapinventory/scrapinventoryList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = scrapinventoryService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> deptList = scrapinventoryService.selectScrapinventory(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(deptList);
		return dg;
	}
	
	
	/**
	 *查询废品库剩余 
	 */
	@RequestMapping("toJian")
	public String toJian(Model model,Scrapinventory scrapinventory){
		List<Map> list = scrapinventoryService.listScrapinventoryzong(scrapinventory);
		List<Map> listYuanLiao = scrapinventoryService.selectYuanLiao(scrapinventory);
		model.addAttribute("list", list);
		model.addAttribute("listYuanLiao", listYuanLiao);
		return "scrapinventory/scrapinventoryEdit";
	}
	
	/**
	 *调出废品库
	 */
	@RequestMapping("toAdd")
	@ResponseBody
	public int toAdd(Scrapinventory scrapinventory){
		int row = scrapinventoryService.updateScrapinventoryzong(scrapinventory);
		scrapinventoryService.addScrapinventory(scrapinventory);
		scrapinventoryService.editYuanLiao(scrapinventory);
		return row;
	}
	
	@RequestMapping("toLists")
	public String toLists(){
		return "scrapinventory/scrapinventorySel";
	}
	@RequestMapping("datagrids")
	@ResponseBody
	public Object datagrids(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = scrapinventoryService.findCountByMaps(map);
		//数据库分页
		List<Map<String,Object>> deptList = scrapinventoryService.selectScrapinventorys(pagevo,map);
		DataGrid gg = new DataGrid();
		gg.setTotal(lineNum);
		gg.setRows(deptList);
		return gg;
	}
	
}
