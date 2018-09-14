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
import com.aaa.entity.manger.Capacity;
import com.aaa.entity.manger.Formula;
import com.aaa.entity.manger.Manger;
import com.aaa.service.manger.FormulaService;
/**
 * 
 * 类名称：FormulaController
 * 类描述： 
 * 创建人：suzhi
 * 创建时间：2018-8-2 下午2:52:45
 * @version
 */
@Controller
@RequestMapping("formula")
public class FormulaController {
@Autowired
private FormulaService formulaService;

@RequestMapping("toList")
public String tolist(){
	return "formula/list";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = formulaService.findCountByplan(map);
	List<Formula> rows=formulaService.selectformula(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(rows);
	return dg;

}

/**
 * 删除
 */
@RequestMapping("delete")
@ResponseBody
public int delete(Formula formula){
	int row=formulaService.delete(formula);
	return row;
}

/**
 * 添加
 */
@RequestMapping("toAdd")
public String toAdd(){
	return "formula/add";
}

/**
 * 保存
 */
@RequestMapping("toSave")
@ResponseBody
public int toSave(Formula formula){
	int row = formulaService.addformula(formula);
	return row;
}


/**
 * 更改
 */
@RequestMapping("toEdit")
public String toEdit(Formula formula,Model model){
	List<Manger> editList = formulaService.selectmangers(formula);
	model.addAttribute("editList", editList);
	return "formula/formulaEdit"; 
}

/**
 * 提交更改
 */
@RequestMapping("toUpdate")
@ResponseBody
public int toUpdate(Formula formula){
	int row = formulaService.updatemanger(formula);
	return row;
}
}
