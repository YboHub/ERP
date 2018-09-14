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
import com.aaa.service.emp.EquipmentService;
import com.aaa.utils.GenerateNumber;

@Controller
@RequestMapping("/equipment")
public class EquipmentCountroller {
	@Autowired
	private EquipmentService equipmentService;
	
	/**
	 * 查询
	 */
	@RequestMapping("toList")
	public String toList(Equipment equipment, Model model){
		return "equipment/equipmentList";
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
		int lineNum = equipmentService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> empList = equipmentService.selectequipment(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(empList);
		return dg;
	}
	/**
	 *点击停止运行 
	 */
	@RequestMapping("update")
	@ResponseBody
	public int update(Integer id){
		int row = equipmentService.updatequipment(id);
		return row;
	}
	/**
	 * 点击运行
	 */
	@RequestMapping("updatee")
	@ResponseBody
	public int updatee(Integer id){
		int row = equipmentService.updatequipments(id);
		return row;
	}
	/**
	 * 跳转添加页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model)  {
		String equipmentList=equipmentService.equipment();
		String sno=equipmentList;
		String prefix="J";
		String danhao=GenerateNumber.generaterNextNumber(sno, prefix);
		model.addAttribute("danhao", danhao);
		return "equipment/equipmentAdd";
	}
    /**
	  *新增设备 
	  */
	@RequestMapping("save")
	@ResponseBody
	public int toSave(Equipment equipment){
		int row = equipmentService.addEquipment(equipment);
		return row;
	}
	
	
}
