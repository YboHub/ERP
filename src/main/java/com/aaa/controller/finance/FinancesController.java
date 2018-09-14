package com.aaa.controller.finance;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.finance.Finances;
import com.aaa.service.finance.FinancesService;


/** 
 * @类名称:  FinancesController 
 * @类描述:	 财务记录控制层
 * @author  公子哥
 * @time    2018-7-27上午8:37:45
 * @version 1.0
 */
@Controller
@RequestMapping("/finances")
public class FinancesController {
	@Autowired
	private FinancesService financesService;
	/***
	 * 跳转到财务记录列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(Model model){
		return "finances/financeList";
	}
	/***
	 * 财务记录分页和获得总行数
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("/datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String beginTime,String endTime,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = financesService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> financesList= financesService.selectFinancesMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);      //获取总行数
		dg.setRows(financesList);//获取每一行信息
		return dg;
	}
	/***
	 * 跳转到新增页面
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "finances/financeAdd";
	}
}
