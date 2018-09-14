/**
 * 
 */
package com.aaa.controller.finance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.DataGrid;
import com.aaa.entity.PageVo;
import com.aaa.entity.purchase.MaterialReturn;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.service.finance.FinanceSettlementService;

/**
 * @类名称: FinanceSettlement
 * @描述类: 财务结算控制层
 * @author: 公子哥
 * @time:   2018-8-17上午9:07:40
 */
@Controller
@RequestMapping("/finace")
public class FinanceSettlementController {
	@Autowired
	 private FinanceSettlementService financeSettlementService;
	/**
	 * 页面跳转
	 */
	@RequestMapping("financeList")
	public String financeSettlement(){
		return "finances/financesettlement";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = financeSettlementService.findCountByMap(map);
		List<Map<String,Object>> purList = financeSettlementService.selectPur(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);//获取总行数
		dg.setRows(purList); //获取每一行信息
		return dg;
	}
	/**
	 * 结算
	 */
	@RequestMapping("settlement")
	@ResponseBody
	public int deletetwoReturn(String id,MaterialReturn mater,OrderInfo ord){
		List<OrderInfo> purList = financeSettlementService.selectOrderReturnOne(ord);//查询
		financeSettlementService.insert(purList.get(0));//插入
		int row=financeSettlementService.updateTwo(ord);//修改
		return row;
	}
}
