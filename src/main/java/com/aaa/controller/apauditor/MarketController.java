package com.aaa.controller.apauditor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Market;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.sell.ReturnOrder;
import com.aaa.service.apauditor.MarketService;

@Controller
@RequestMapping("market")
public class MarketController {
	@Autowired
	private MarketService marketService;
	/**
	 * 查询异常单
	 * @param procurement
	 * @param model
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(){
		return "shenhe/market";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= marketService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> list= marketService.selectReturnOrderMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
	/**
	 * 审核同意不同意按钮的  修改 插入  删除
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("tomarket")
	public String tomarket(Integer id,Model model){
		List<ReturnOrder> list=marketService.selectRet(id);
		//System.out.println(list);
		model.addAttribute("list", list);
		return "shenhe/tomarket";
	}
	/**
	 * 同意按钮
	 * @param 
	 * @return
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public Object toUpdate(ReturnOrder returnOrder,Market market,HttpSession session){
		int row=marketService.toUpdate(returnOrder);
		String auditor = (String) session.getAttribute("ename");
		market.setAuditor(auditor);
		marketService.insertMarket(market);
		return row;
	}
	/**
	 * 不同意按钮
	 * @param
	 * @return
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public Object tooUpdate(ReturnOrder returnOrder,Market market,HttpSession session){
		int row=marketService.tooUpdate(returnOrder);
		String auditor = (String) session.getAttribute("ename");
		market.setAuditor(auditor);
		marketService.insertToMarket(market);
		return row;
	}
	/**
	 * 查询审核记录
	 * @param procurement
	 * @param model
	 * @return
	 */
	@RequestMapping("toMarket")
	public String tomarket(Procurement procurement,Model model){
		return "shenhe/tomarkets";
	}
	@RequestMapping("datagr")
	@ResponseBody
	public Object datagr(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= marketService.findCountByMarket(map);
		//数据库分页
		List<Map<String,Object>> list= marketService.selectMarketMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
}
