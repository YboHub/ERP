package com.aaa.controller.warehouse;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.service.warehouseservice.ProBackInFoodService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;
/**
 * 类名称：ProBackInFoodController
 * 类描述： 
 * 创建人：wangyatao
 * 创建时间：2018-8-14 下午4:44:06
 * @version
 */
@Controller
@RequestMapping("proBackInFood")
public class ProBackInFoodController {
	@Autowired
	private ProBackInFoodService proBackInFoodService;
	@RequestMapping("proBack")
	public String proBack(){
		return "food/proBackInFood/proBackList";
	}
	
	/**
	 * 成品退回入库页面
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object selProBack(PageVo pageVo,String name,String value){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count=proBackInFoodService.findCountByMap(map);
		List<Map<String,Object>> selProBackList=proBackInFoodService.selProBack(pageVo,map);
		DataGrid dg= new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(selProBackList);
		return dg;
	}
	/**
	 * 退回商品入库
	 */
	@RequestMapping("inFood")
	public String inFood(Model model,Integer id){
		model.addAttribute("id",id);
		return "food/proBackInFood/inFood";
	}
	/**
	 * 退回商品详情页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("datagridTwo")
	@ResponseBody
	public Object selAllGross(Model model,Integer id){
		List warehouseAll = proBackInFoodService.selWareAll(id);
		model.addAttribute("warehouseAll",warehouseAll);
		DataGrid dg= new DataGrid();
		dg.setRows(warehouseAll);
		return dg;
	}
	/**
	 * 退回成品入库
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping("proBackInWarehouse")
	public String proIncoming(HttpSession session ,Integer id){
		Map<String,Object> map=proBackInFoodService.selectMarketById(id);
		String rname = (String) session.getAttribute("ename");
		String rtime=NowTimeUtil.newTime();
		String prefix="T";
		String sno=proBackInFoodService.selectRKDH();
		String rkdh=GenerateNumber.generaterNextNumber(sno, prefix);
		map.put("rname", rname);
		map.put("rtime", rtime);
		map.put("rkdh", rkdh);
		proBackInFoodService.insertStock(map);
		proBackInFoodService.updateMarket(id);
		Double oldUnit = proBackInFoodService.selectGross(map);
		map.put("oldUnit", oldUnit);
		proBackInFoodService.addGross(map);
		return "food/proBackInFood/proBackList";
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
			Map<String,Object> map=proBackInFoodService.selectMarketById(id);
			String rname = (String) session.getAttribute("ename");
			String rtime=NowTimeUtil.newTime();
			String prefix="T";
			String sno=proBackInFoodService.selectRKDH();
			String rkdh=GenerateNumber.generaterNextNumber(sno, prefix);
			map.put("rname", rname);
			map.put("rtime", rtime);
			map.put("rkdh", rkdh);
			proBackInFoodService.insertStock(map);
			proBackInFoodService.updateMarket(id);
			Double oldUnit = proBackInFoodService.selectGross(map);
			map.put("oldUnit", oldUnit);
			row = proBackInFoodService.addGross(map);
		}
		return row;
	}

	
}
