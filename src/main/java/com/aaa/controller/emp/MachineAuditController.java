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
import com.aaa.entity.emp.Equipment;
import com.aaa.service.emp.MachineAuditService;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("machineAudit")
public class MachineAuditController {
	@Autowired
	private MachineAuditService machineAuditService;
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(){
		return "machineAudit/machineAuditList";
	}
	/**
	 *分页
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = machineAuditService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> machineAuditList = machineAuditService.selectMachineAudit(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(machineAuditList);
		return dg;
	}
	
	/**
	 *审核表 
	 */
	@RequestMapping("toEdit")
	public String toEdit(Equipment equipment,Model model){
		String stime=NowTimeUtil.newTime();
		List<Equipment> list = machineAuditService.selectEquipment(equipment);
		model.addAttribute("list", list);
		model.addAttribute("stime", stime);
		return "machineAudit/machineAuditEdit"; 
	}
	
	/**
	 *同意审核 
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdate(Equipment equipment){
		String DisDate=NowTimeUtil.newDateTime();
		equipment.setStime(DisDate);
		int row = machineAuditService.updateEquipment(equipment);
		machineAuditService.insertsEquipment(equipment);
		return row;
	}
	
	/**
	 *不同意审核 
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public int tooUpdate(Equipment equipment){
		int row = machineAuditService.noupdateEquipment(equipment);
		return row;
	}
	
}
