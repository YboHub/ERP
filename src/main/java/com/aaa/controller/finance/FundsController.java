package com.aaa.controller.finance;

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
import com.aaa.entity.apauditor.FundsRecord;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.entity.finance.Funds;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.finance.FundsService;
import com.aaa.utils.NowTimeUtil;

/** 
 * @类名称:  FundsController 
 * @类描述:	[采购拨款管理],[采购拨款记录],[尾款结算]控制层
 * @author  公子哥
 * @time    2018-7-31下午1:31:18
 * @version 1.0
 */
@Controller
@RequestMapping("/funds")//窄化的路径
public class FundsController {
	@Autowired
	private FundsService fundsService;
	/***
	 * 跳转到列表页面
	 * 采购拨款管理
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(Model model){
		return "histogram/fundsList";//histogram是jsp文件夹的路径,fundsList是jsp的名字
	}
	/***
	 * 分页查询并查询列表信息
	 * 采购拨款管理
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
		int count = fundsService.findCountByMap(map);
		//数据库分页
		/***
		 * 遍历的方法List<Map<String,Object>>
		 * List集合中的对象是一个Map对象,而这个Map对象的键是String类型,值是Object类型
		 * List里只能放Map类型的对象，而这个Map类型的对象又只能放以String类型为键，以Object类型为值的键值对。
		 * List以Map接口对象为列表对象。
		 * Map以String为键，以Object为值。
		 * Map<String,Object>map =new HashMap<String,Object>();
		 * map.put("key1","value1");
		 * mpa.put("key2","value2");
		 * List<Map<String,Object>>list = new ArrayList<Map<Object>>();
		 */
		List<Map<String,Object>> fundsList= fundsService.selectFundsMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);   //获取总行数
		dg.setRows(fundsList);//获取每一行信息
		return dg;
	}
	/***
	 * 财务拨款审核按钮
	 * @param allmoney
	 * @param orderid
	 * @param model
	 * @return
	 */
	@RequestMapping("sel")
	public String sel(Double allmoney,String orderid,Model model){
		model.addAttribute("allmoney", allmoney);
		model.addAttribute("orderid", orderid);
		return "histogram/tofunds";
	}
	@SuppressWarnings("unused")
	@RequestMapping("toUpdate")
	@ResponseBody
	public Object toUpdate(HttpSession session,PurchaseRecord purchaseRecord,Procurement pro,PurOrder purorder,Double allmoney,FundsRecord fundsRecord){
		String time=NowTimeUtil.newDateTime();
		purorder.setTime(time);
		int row=fundsService.toUpdate(purchaseRecord);
		int row1=fundsService.toUpdateMoney(pro);
		String fundsname = (String) session.getAttribute("ename");
		fundsRecord.setFundsname(fundsname);
		purorder.setAllmoney(allmoney);
		fundsService.insertPur(purorder);
		fundsService.insertFundsRecord(fundsRecord);
		return row;
	}
	/***
	 * 采购拨款记录
	 */
	@RequestMapping("tofunds")
	public String tocaigou(Procurement procurement,Model model){
		return "histogram/fundsRecord";
	}
	
	@RequestMapping("fundsid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= fundsService.findCountByMapFundsRecord(map);
		//数据库分页
		List<Map<String,Object>> list= fundsService.selectFundsRecordMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);  //获取每一行信息
		return dg;
	}
	/***
	 * 跳转到新增页面
	 * 采购拨款管理
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(){
		return "histogram/fundsAdd";
	}
	/***
	 * 采购拨款审核
	 * @param funds
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public int update(@RequestParam(value="idStr[]") int[] idStr,Funds funds){
		int row =0; 
		for (int id:idStr){
			funds.setFundsid(id);
			row=fundsService.updatefunds(funds);
		}
		return row;
	}
/*-----------------------------------采购拨款管理结束----------------------------------------*/
	/***
	 * 跳转到列表页面
	 * 尾款结算
	 * @return
	 */
	@RequestMapping("toList1")
	public String toList1(Model model){
		return "histogram/finalList";
	}
	/***
	 * 分页查询并查询列表信息
	 * 尾款结算
	 */
	@RequestMapping("/datagrid1")
	@ResponseBody
	public Object datagrid1(PageVo pageVo,String beginTime,String endTime,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count = fundsService.findCount1ByMap(map).size();
		//数据库分页
		List<Map<String,Object>> finalList= fundsService.selectFinalMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);   //获取总行数
		dg.setRows(finalList);//获取每一行信息
		return dg;
	}
/*-------------------------------------尾款结算结束-------------------------------------------*/
}
