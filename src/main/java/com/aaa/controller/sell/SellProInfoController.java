package com.aaa.controller.sell;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.ProduceInfo;
import com.aaa.service.sell.SellProInfoService;
/**
 * 
 * 类名称：SellProInfoController
 * 类描述：销售产品信息
 * @author Aer
 * @date 2018-7-28 上午11:37:52
 * @version
 */
@Controller
@RequestMapping("/sellProInfo")
public class SellProInfoController {
	@Autowired
	private SellProInfoService sellProInfoService;
	/**
	 * 跳转列表页面
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(){
		return "sell/product/product_list";
	}
	/**
	 * 列表显示
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object dagaGrid(PageVo pageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int totalLineNum = sellProInfoService.gainTotalLineNum(map);
		//数据库分页
		List<Map<String, Object>> productList = sellProInfoService.selectProduct(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setRows(productList);
		dg.setTotal(totalLineNum);
		return dg;
	}
	/**
	 * 更改产品价格	
	 * @param produceInfo
	 * @return
	 */
	@RequestMapping("updatePrice")
	@ResponseBody
	public int updatePrice(ProduceInfo produceInfo){
		int row = sellProInfoService.updatePriceByPno(produceInfo);
		return row;
	}
}
