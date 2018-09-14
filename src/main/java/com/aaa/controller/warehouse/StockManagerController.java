package com.aaa.controller.warehouse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.warehouseservice.StockManagerService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;

@SuppressWarnings("all")
@Controller
@RequestMapping("stock")
public class StockManagerController {
	@Autowired
	private StockManagerService stockManagerService;
	/**
	 * 跳转入库页面
	 * @return
	 */
	@RequestMapping("stockList")
	public String stockList(){
		return "food/stockList";
	}
	/**
	 * 入库页面
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selectAllStock(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count=stockManagerService.findCountByMap(map);
		List<Map<String,Object>> foodList=stockManagerService.selectAllStock(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 跳转查看详情页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("selDetails")
	public String toList(Model model,Integer id){
			model.addAttribute("id", id);
			return "food/selDetails";
	}
	/**
	 * 查看详情页面
	 * @param pageVo
	 * @param name
	 * @param value
	 * @param id
	 * @return
	 */
	@RequestMapping("datagrid1")
	@ResponseBody
	public Object selectAllDetails(PageVo pageVo,String name,String value,Integer id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		map.put("id", id);
		//获取总行数
		int count=stockManagerService.findCountByMap1(map);
		List<Map<String,Object>> foodList=stockManagerService.selectAllDetails(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(foodList);
		return dg;
	}
	/**
	 * 成品入库
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("proIncoming")
	public String proIncoming(HttpSession session ,Integer id){
		Map<String,Object> map=stockManagerService.selectStockById(id);
		String rname = (String) session.getAttribute("ename");
		String rtime=NowTimeUtil.newTime();
		String prefix="R";
		String sno=stockManagerService.selectRKDH();
		String rkdh=GenerateNumber.generaterNextNumber(sno, prefix);
		map.put("rname", rname);
		map.put("rtime", rtime);
		map.put("rkdh", rkdh);
		stockManagerService.insertStock(map);
		stockManagerService.updateStock(id);
		Double oldUnit = stockManagerService.selectGross(map);
		map.put("oldUnit", oldUnit);
		stockManagerService.addGross(map);
		return "food/stockList";
	}
	/**
	 * 通过复选框的materials
	 * 一键入库
	 * @param idStr capacity数组
	 * @return
	 */
	@RequestMapping("/passapprovalAll")
	public @ResponseBody int delcapacity(@RequestParam(value = "idStr[]") int[] idStr,HttpSession session) {
		int row = 0;
		for (int id : idStr) {
			Map<String,Object> map=stockManagerService.selectStockById(id);
			String rname = (String) session.getAttribute("ename");
			String rtime=NowTimeUtil.newTime();
			String prefix="R";
			String sno=stockManagerService.selectRKDH();
			String rkdh=GenerateNumber.generaterNextNumber(sno, prefix);
			map.put("rname", rname);
			map.put("rtime", rtime);
			map.put("rkdh", rkdh);
			stockManagerService.insertStock(map);
			stockManagerService.updateStock(id);
			Double oldUnit = stockManagerService.selectGross(map);
			map.put("oldUnit", oldUnit);
			row = stockManagerService.addGross(map);
		}
		return row;
		
	}
}