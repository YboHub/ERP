package com.aaa.controller.finance;

import java.util.ArrayList;
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
import com.aaa.entity.finance.Disburse;
import com.aaa.entity.finance.Income;
import com.aaa.entity.finance.Profit;
import com.aaa.service.finance.FinancesService;
import com.aaa.service.finance.HistogramService;
import com.aaa.utils.StringUtils;

/** 
 * @类名称:  HistogramController 
 * @类描述:	 利润查看控制层
 * @author  公子哥
 * @time    2018-7-30下午3:32:10
 * @version 1.0
 */
@Controller
@RequestMapping("/histogram")
public class HistogramController {
	@Autowired
	private HistogramService histogramService;
	/***
	 * 跳转到列表页面
	 * Echarts图
	 * @param model
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(String startTime,String finalTime,Model model){
	    //添加泛型，限制添加元素的数据类型
			List<String>  monthList    = new ArrayList<String>();  // 月份
			List<Integer> inList       = new ArrayList<Integer>(); // 收入
			List<Integer> disburseList = new ArrayList<Integer>(); // 支出
			List<Integer> profitList   = new ArrayList<Integer>(); // 利润
			Income income=new Income();
			income.setStartTime(startTime);
			income.setFinalTime(finalTime);
		
		//查询的收入情况
			List<Income> listIncome = histogramService.selectIncome(income);
				for (Income finance : listIncome) {
					monthList.add("'"+finance.getAllMonth()+"月"+"'");
					inList.add(finance.getTotal());
				}
				model.addAttribute("inList", inList);
				model.addAttribute("monthList", monthList);
			
		//查询支出情况
			List<Disburse> listDisburse = histogramService.selectDisburse(income);
			for (Disburse disburse : listDisburse) {
				disburseList.add(disburse.getDisburseMoney());
			}
			model.addAttribute("disburseList", disburseList);
		
		//查询利润情况
			List<Income> listProfit = histogramService.selectProfit(income);
			for (Income profit : listProfit) {
				profitList.add(profit.getPromoney());
			}
			model.addAttribute("profitList", profitList);
		
		return "histogram/histogramList";
	}
	/***
	 * 分页查询并查询列表信息
	 * 查询月份利润信息
	 */
	@RequestMapping("/datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String beginTime,String endTime,String name,String value,String ldate){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Integer> profitList   = new ArrayList<Integer>(); // 利润
		Income income=new Income();
		income.setStartTime(beginTime);
		income.setFinalTime(endTime);
		/*map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		map.put("name", name);
		map.put("value", value);
		map.put("ldate", ldate);*/
		//获取总行数
		int count = histogramService.findCountByMap(map);
		
		//数据库分页
		//List<Map<String,Object>> histogramList= histogramService.selectHistogramMap(pageVo,map);
		List<Income> listProfit = histogramService.selectProfit(income);
		for (Income profit : listProfit) {
			profitList.add(profit.getPromoney());
		}
		DataGrid dg = new DataGrid();
		dg.setTotal(count);    //获取总行数
		dg.setRows(listProfit);//获取每一行信息
		return dg;
	}
	/***
	 * 跳转到新增页面
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "histogram/histogramAdd";
	}
	/***
	 * 跳转到年利润列表页面
	 */
	@RequestMapping("/datagridO")
	@ResponseBody
	public Object datagrid1(String beginTime,String endTime){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		//获取总行数
		int count = histogramService.findCount1ByMap(map);
		//数据库分页
		List<Map<String, Object>> histogram1List=histogramService.selectHistogram1Map( map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);        //获取总行数
		dg.setRows(histogram1List);//获取每一行信息
		return dg;
	}
}
