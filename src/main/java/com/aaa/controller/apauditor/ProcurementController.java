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
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.service.apauditor.ProcurementService;
/**
 * 
 * 类名称：ProcurementController
 * 类描述： 采购审核
 * 创建人：fuyukun
 * 创建时间：2018-7-30 下午2:47:33
 * @version
 */
@Controller
@RequestMapping("procurement")
public class ProcurementController {
	@Autowired
	private ProcurementService procurementService;
	/**
	 * 查询 并分页 采购审核
	 * @param procurement
	 * @param model
	 * @return
	 */
	@RequestMapping("toList")
	public String tocaigou(Procurement procurement,Model model){
		return "shenhe/caigou";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= procurementService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> list= procurementService.selectProcurementMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
	/**
	 * 详情信息查看
	 */
	@RequestMapping("sel")
	public String sel(Integer id,Model model){
		//System.out.println(id);
		model.addAttribute("id", id);
		return "shenhe/details";
	}
	@RequestMapping("detailsid")
	@ResponseBody
	public Object detailsid(String orderid){
		List<Map<String,Object>> list= procurementService.selectdetailsMap(orderid);
		//System.out.println(list);
		return list;
	}
	/**
	 * 审核同意不同意按钮的  修改 插入
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("audit")
	public String audit(String orderid,String caozuoname,Model model){
		//List<Procurement> list=procurementService.selectPro(id);
		//System.out.println(list);
		model.addAttribute("orderid", orderid);
		model.addAttribute("caozuoname", caozuoname);
		return "shenhe/audit";
	}
	/**
	 * 同意按钮
	 * @param procurement
	 * @return
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public Object toUpdate(Procurement procurement,PurchaseRecord purchaseRecord,HttpSession session){
		int row=procurementService.toUpdate(procurement);
		String buyer = (String) session.getAttribute("ename");
		purchaseRecord.setBuyer(buyer);
		procurementService.insertPurchases(purchaseRecord);
		//procurementService.deleteProcurement(procurement);
		return row;
	}
	/**
	 * 不同意按钮
	 * @param procurement
	 * @return
	 */
	@RequestMapping("tooUpdate")
	@ResponseBody
	public Object tooUpdate(Procurement procurement,PurchaseRecord purchaseRecord,HttpSession session){
		int row=procurementService.tooUpdate(procurement);
		String buyer = (String) session.getAttribute("ename");
		purchaseRecord.setBuyer(buyer);
		procurementService.insertPurchase(purchaseRecord);
		return row;
	}
}
