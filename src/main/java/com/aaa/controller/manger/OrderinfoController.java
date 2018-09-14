package com.aaa.controller.manger;

import java.util.HashMap;


import java.util.Date;
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
import com.aaa.entity.manger.Neng;
import com.aaa.entity.manger.Plan;
import com.aaa.entity.manger.Xubiao;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.service.manger.OrderinfoService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;

@Controller
@RequestMapping("orderinfo")
public class OrderinfoController {
@Autowired
private OrderinfoService orderinfoService;


/**
 * 查询
 */
@RequestMapping("toList")
public String toList( Model model){
	return "orderinfo/orderinfoList";
}
@RequestMapping("datagrid")
@ResponseBody
public Object datagrid(PageVo pagevo,String name,String value){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("name", name);
	map.put("value", value);
	//获取总行数
	int lineNum = orderinfoService.findByorderinfo(map);
	//数据库分页
	List<Map<String,Object>> empList = orderinfoService.selectorderinfo(pagevo,map);
	DataGrid dg = new DataGrid();
	dg.setTotal(lineNum);
	dg.setRows(empList);
	return dg;
}

/**
 * 制定生产计划
 */
@RequestMapping("toEdit")
public String toEdit(OrderDetail orderinfo,Model model,HttpSession session){
	
	Map<String, Object> map = new HashMap<String, Object>();
	List<Neng> nenglist=orderinfoService.selectneng();
	String punm=orderinfoService.selectPunm();
	String sno=punm;
	String prefix="S";
	String application=GenerateNumber.generaterNextNumber(sno, prefix);
	String name=(String) session.getAttribute("ename");
	List<OrderDetail> list=orderinfoService.toselect(orderinfo);
	String orderno=list.get(0).getOrderno();
	map.put("orderno", orderno);
	List<Map<String,Object>> orList = orderinfoService.selectorder(map);
	String time=NowTimeUtil.newDateTime();
	list.get(0).setTime(time);
	list.get(0).setWarehouse(name);
	model.addAttribute("list",list);
	model.addAttribute("application", application);
	model.addAttribute("orList",orList);
	model.addAttribute("nenglist",nenglist);
	return "orderinfo/orderinfoAdd";
}
/**
 * 
 * @param 增加
 */
@RequestMapping("toAdd")
@ResponseBody
public int toAdd(Plan plan,OrderDetail orderDetail){
	int row=orderinfoService.toAdd(plan);
	orderinfoService.update(orderDetail);
	orderinfoService.delete(plan);
	return row;
}
/**
 * 计算时间差
 * @param obegintime
 */
@RequestMapping("toend")
@ResponseBody
public Object toend(String obegintime,String chang,String num,Xubiao xubiao){
	xubiao.setBegintime(obegintime);
	xubiao.setEndtime(chang);
	xubiao.setPnumber(num);
	orderinfoService.insert(xubiao);
	List<Xubiao> listXubiao = orderinfoService.selectXubiao(xubiao);
	String row=listXubiao.get(0).getDay();
	return row;
	
}

/**
 * 详情
 */
@RequestMapping("todel")
public String todel(String orderno,Model model){
	model.addAttribute("orderno",orderno);
	return "orderinfo/add";
}

/**
 * 
 * @param orderno
 */
@RequestMapping("dataOne")
@ResponseBody
public Object todate(String orderno){
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("orderno", orderno);
	List<Map<String,Object>> orderList = orderinfoService.selectorder(map);
	DataGrid dg = new DataGrid();
	dg.setRows(orderList);
	return dg;

}
}
