package com.aaa.controller.apauditor;

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
import com.aaa.entity.apauditor.Procurement;
import com.aaa.service.apauditor.PurchaseRecordService;

@Controller
@RequestMapping("purchase")
public class PurchaseRecordController {
	@Autowired
	private PurchaseRecordService pruchaseRecordService;
	/**
	 * 查询 并分页 采购审核
	 * @param procurement
	 * @param model
	 * @return
	 */
	@RequestMapping("toList")
	public String tocaigou(Procurement procurement,Model model){
		return "shenhe/record";
	}
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String name,String value){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int count= pruchaseRecordService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> list= pruchaseRecordService.selectPurchaseRecordMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);//获取总行数
		dg.setRows(list);
		return dg;
	}
	/**
	 * 详情信息查看
	 */
	@RequestMapping("sel")
	public String sel(Integer sid,Model model){
		model.addAttribute("sid", sid);
		return "shenhe/recorddetails";
	}
	@RequestMapping("detailsid")
	@ResponseBody
	public Object detailsid(Integer orderid){
		List<Map<String,Object>> list= pruchaseRecordService.selectdetailsMap(orderid);
		return list;
	}
}
