package com.aaa.controller.finance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aaa.entity.PageVo;
import com.aaa.entity.DataGrid;
import com.aaa.service.finance.SaleRecordService;

/** 
 * @类名称:  SaleRecordController 
 * @类描述:	 销售记录统计管理
 * @author  公子哥
 * @time    2018-7-31下午7:22:19
 * @version 1.0
 */
@Controller
@RequestMapping("sale")
public class SaleRecordController {
	@Autowired
	private SaleRecordService saleRecordService;
	/***
	 * 跳转到列表页面
	 * 销售记录统计管理
	 */
	@RequestMapping("toList")
	public String toList(Model model){
		//return "histogram/salerecordList";
		return "histogram/SaleRecordList";//histogram是jsp文件夹的路径,fundsList是jsp的名字
	}
	/***
	 * 分页查询列表信息
	 * 销售记录统计管理
	 */
	@RequestMapping("/datagrid")
	@ResponseBody
	public Object datagrid(PageVo pageVo,String beginTime,String endTime,String name,String value){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		map.put("name",name);
		map.put("value",value);
		//获取总行数
		int count = saleRecordService.findCountByMap(map);
		//数据库分页
		List<Map<String,Object>> saleRecordList = saleRecordService.selectSaleRecordMap(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(count);        //获取总行数
		dg.setRows(saleRecordList);//获取每一行信息
		return dg;
	}
}
