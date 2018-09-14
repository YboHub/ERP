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
import com.aaa.entity.emp.Appropriation;
import com.aaa.service.emp.AppropriationService;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("appropriation")
public class AppropriationController {
	@Autowired
	private AppropriationService appropriationService;
	
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(){
		return "appropriation/appropriationList";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = appropriationService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> appropriationList = appropriationService.selectAppropriation(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(appropriationList);
		return dg;
	}
	
	@RequestMapping("toEdit")
	public String toEdit(Appropriation appropriation,Model model){
		List<Map> list=appropriationService.selAppropriation(appropriation);
		model.addAttribute("list",list);
		return "appropriation/appropriationEdit"; 
	}
	/**
	 * 拨款添加到拨款记录
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public Object toUpdate(Appropriation appropriation,Integer id){
		String time=NowTimeUtil.newDateTime();
		appropriation.setTime(time);
		int row=appropriationService.saveFundsrecord(appropriation);
		appropriationService.deleteAppropriation(id);
		appropriationService.addAppropriation(appropriation);
		return row;
	}
	
}
