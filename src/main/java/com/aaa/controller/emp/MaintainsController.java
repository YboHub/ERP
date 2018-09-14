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
import com.aaa.entity.emp.Maintain;
import com.aaa.service.emp.MaintainsService;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("/maintains")
public class MaintainsController {
	
	@Autowired
	private MaintainsService maintainsService;
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(){
		return "maintains/maintainsList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = maintainsService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> maintainsList = maintainsService.selectMaintains(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(maintainsList);
		return dg;
	}
	/**
	 * 添加
	 */
	@RequestMapping("toAdd")
	public String toAdd(Maintain maintain,Model model){
		List<Map> list = maintainsService.selecteMaintains(maintain);
		model.addAttribute("list", list);
		return "maintains/maintainsAdd";
	}
	/**
	 * 保存
	 */
	@RequestMapping("save")
	@ResponseBody
	public int toSave(Maintain maintain){
		String DisDate=NowTimeUtil.newDateTime();
		maintain.setDisDate(DisDate);
		int row = maintainsService.addMaintains(maintain);
		int rowo =  maintainsService.updateMaintains(maintain);
		maintainsService.addAppropriation(maintain);
		return row;
	}
	/**
	 * 详情信息查看
	 */
	@RequestMapping("toselect")
	public String sel(Integer mid,Model model){
		System.out.println(mid);
		model.addAttribute("mid", mid);
		return "maintains/maintainsSel";
	}
	@RequestMapping("detailsid")
	@ResponseBody
	public Object detailmid(Integer mid){
		List<Map<String,Object>> list= maintainsService.selectmaintainsMap(mid);
		return list;
	}

}
