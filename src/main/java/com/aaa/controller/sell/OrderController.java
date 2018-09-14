package com.aaa.controller.sell;

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
import com.aaa.entity.sell.Client;
import com.aaa.entity.sell.OrderData;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.entity.sell.ReturnOrder;
import com.aaa.service.sell.OrderService;
import com.aaa.utils.OrderNumUtil;
/**
 * 
 * 类名称：OrderController
 * 类描述：订单
 * @author Aer
 * @date 2018-7-28 下午4:17:06
 * @version
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	/**
	 * 跳转列表页面
	 * @return
	 */
	@RequestMapping("toList")
	public String toList(){
		return "sell/order/order_list";
	}
	/**
	 * 列表显示
	 * @param pagevo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("datagrid")
	@ResponseBody
	public Object datagrid(PageVo pagevo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = orderService.gainTotalLineNum(map);
		//数据库分页
		List<Map<String,Object>> orderList = orderService.selectOrderInfo(pagevo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(orderList);
		return dg;
	}
	/**
	 * 跳转添加订单页面
	 * @param model
	 * @return
	 */
	@RequestMapping("toAdd")
	public String toAdd(Model model, HttpSession session){
		String orderNum = OrderNumUtil.makeOrderNum();
		List<Object> cnameList = orderService.selectCname();
		List<Object> pnoList = orderService.selectPno();
		List<Object> pnameList = orderService.selectPname();
		List<Object> enameList = orderService.selectEname(session);
		model.addAttribute("enameList", enameList);
		model.addAttribute("orderNum", orderNum);
		model.addAttribute("cnameList", cnameList);
		model.addAttribute("pnoList", pnoList);
		model.addAttribute("pnameList", pnameList);
		return "sell/order/order_add";
	}
	/**
	 * 订单保存
	 * @param order
	 * @return
	 */
	@RequestMapping("toSave")
	@ResponseBody
	public int toSave(OrderDetail orderDetail,OrderInfo orderInfo,Client client){
		int row = orderService.insertOrder(orderDetail,orderInfo,client);
		return row;
	}
	/**
	 * 订单详情
	 * @param orderInfo
	 * @param orderDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("toDetail")
	public String toShowOrderDetail(OrderInfo orderInfo, OrderDetail orderDetail, Model model){
		List<Map<String,Object>> editClientList = orderService.selectClientInfoByOrderNo(orderInfo);
		List<OrderDetail> editOrderList = orderService.selectOrderInfoByOrderNo(orderDetail);
		model.addAttribute("editClientList", editClientList);
		model.addAttribute("editOrderList", editOrderList);
		return "sell/order/order_detail";
	}
	/**
	 * 通过产品名称查询产品信息
	 * @param order
	 * @return
	 */
	@RequestMapping("toSelectByPname")
	@ResponseBody
	public Object toSelectByPname(OrderDetail order){
		List<OrderDetail> proInfoList = orderService.selectProInfoByPname(order);
		return proInfoList;
	}
	/**
	 * 通过产品编号查询产品信息
	 * @param order
	 * @return
	 */
	@RequestMapping("toSelectByPno")
	@ResponseBody
	public Object toSelectByPno(OrderDetail orderDetail){
		List<OrderDetail> proInfoList = orderService.selectProInfoByPno(orderDetail);
		return proInfoList;
	}
	/**
	 * 通过产品编号和产品型号查询产品价格
	 * @param order
	 * @return
	 */
	@RequestMapping("toSelectByPsize")
	@ResponseBody
	public Object toSelectByPsize(OrderDetail orderDetail){
		List<OrderDetail> proInfoList = orderService.selectProInfoByPsize(orderDetail);
		return proInfoList;
	}
	/**
	 * 根据产品编号查询产品数量
	 * @param orderDetail
	 * @return
	 */
	@RequestMapping("selectPnumByPno")
	@ResponseBody
	public int selectPnumByPno(OrderDetail orderDetail){
		int data = orderService.selectPnumByPno(orderDetail);
		return data;
	}
	/**
	 * 编辑订单
	 * @param order
	 * @param model
	 * @return
	 */
	@RequestMapping("toEdit")
	public String toEditByOrderNo(OrderInfo orderInfo, OrderDetail orderDetail, Model model){
		List<Map<String,Object>> editClientList = orderService.selectClientInfoByOrderNo(orderInfo);
		List<OrderDetail> editOrderList = orderService.selectOrderInfoByOrderNo(orderDetail);
		List<Object> pnoList = orderService.selectPno();
		List<Object> pnameList = orderService.selectPname();
		model.addAttribute("pnoList", pnoList);
		model.addAttribute("pnameList", pnameList);
		model.addAttribute("editClientList", editClientList);
		model.addAttribute("editOrderList", editOrderList);
		return "sell/order/order_edit";
	}
	/**
	 * 更改订单信息
	 * @param orderDetail
	 * @param orderInfo
	 * @return
	 */
	@RequestMapping("toUpdate")
	@ResponseBody
	public int toUpdateByOrderId(OrderDetail orderDetail, OrderInfo orderInfo){
		int row = orderService.updateOrderInfoByOrderId(orderDetail,orderInfo);
		return row;
	}
	/**
	 * 更改页面删除产品信息行
	 * @param orderDetail
	 * @return
	 */
	@RequestMapping("toDelete")
	@ResponseBody
	public int toDeleteByOrderId(OrderDetail orderDetail){
		int row = orderService.deleteOrderDetailByOrderId(orderDetail);
		return row;
	}
	/**
	 * 打印订单信息
	 * @param orderInfo
	 * @param orderDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("toPrint")
	public String toPrintOrderInfo(OrderInfo orderInfo, OrderDetail orderDetail, Model model){
		List<Map<String,Object>> editClientList = orderService.selectClientInfoByOrderNo(orderInfo);
		List<OrderDetail> editOrderList = orderService.selectOrderInfoByOrderNo(orderDetail);
		model.addAttribute("editClientList", editClientList);
		model.addAttribute("editOrderList", editOrderList);
		return "sell/order/order_print";
	}
	/**
	 * 更改页面删除订单
	 * @param orderDetail
	 * @return
	 */
	@RequestMapping("toDeleteOrder")
	@ResponseBody
	public int toDeleteByOrderNo(OrderDetail orderDetail){
		int row = orderService.deleteOrderDetailByOrderNo(orderDetail);
		return row;
	}
	/**
	 * 订单货物退回选择
	 * @param orderInfo
	 * @param orderDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("saleReturn")
	public String saleReturn(OrderInfo orderInfo, OrderDetail orderDetail, Model model){
		List<Map<String,Object>> editClientList = orderService.selectClientInfoByOrderNo(orderInfo);
		List<OrderDetail> editOrderList = orderService.selectOrderInfoByOrderNo(orderDetail);
		model.addAttribute("editClientList", editClientList);
		model.addAttribute("editOrderList", editOrderList);
		return "sell/order/order_salereturn";
	}
	/**
	 * 货物退回编辑窗口
	 * @return
	 */
	@RequestMapping("returnProNum")
	public String returnProNum(OrderDetail orderDetail, Model model){
		OrderDetail ropInfo = orderService.selectReturnProInfoById(orderDetail);
		model.addAttribute("ropInfo", ropInfo);
		return "sell/order/order_returnpronum";
	}
	/**
	 * 货物已退回数量
	 * @param opid
	 * @return
	 */
	@RequestMapping("returnedQuantity")
	@ResponseBody
	public int returnedQuantity(int opid){
		int quantity = orderService.selectReturnedQuantity(opid);
		return quantity;
	}
	/**
	 * 退回货物信息保存
	 * @param returnOrder
	 * @return
	 */
	@RequestMapping("saveReturnOrder")
	@ResponseBody
	public int saveReturnOrder(ReturnOrder returnOrder){
		int row = orderService.saveReturnOrder(returnOrder);
		return row;
	}
	/**
	 * 跳转异常单列表
	 * @return
	 */
	@RequestMapping("returnOrderList")
	public String returnOrderList(){
		return "sell/order/order_reorderlist";
	}
	/**
	 * 异常单列表
	 * @param pageVo
	 * @param name
	 * @param value
	 * @return
	 */
	@RequestMapping("reOrderDatagrid")
	@ResponseBody
	public Object returnOrderDatagrid(PageVo pageVo,String name,String value){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("value", value);
		//获取总行数
		int lineNum = orderService.gainReorderTotalLineNum(map);
		//数据库分页
		List<Map<String,Object>> reorderList = orderService.selectReorderInfo(pageVo,map);
		DataGrid dg = new DataGrid();
		dg.setTotal(lineNum);
		dg.setRows(reorderList);
		return dg;
	}
	/**
	 * 退回货物详情
	 * @return
	 */
	@RequestMapping("rorderDetailList")
	public String rorderDetailList(String rorderno, Model model){
		model.addAttribute("rorderno", rorderno);
		return "sell/order/order_reorderdetail";
	}
	/**
	 * 退回货物详情列表
	 * @param rorderno
	 * @return
	 */
	@RequestMapping("rorderDetailDatagrid")
	@ResponseBody
	public Object rorderDetailDatagrid(String rorderno){
		List<Map<String,Object>> reorderDeatil = orderService.selectReorderDetail(rorderno);
		return reorderDeatil;
	}
	/**
	 * 尾款计算插入
	 * @param orderInfo
	 * @return
	 */
	@RequestMapping("countFinalPayment")
	@ResponseBody
	public int countFinalPayment(OrderInfo orderInfo){
		int row = orderService.insertFinalPayment(orderInfo);
		return row;
	}
	/**
	 * 添加保存成功跳转
	 * @return
	 */
	@RequestMapping("addSuccess")
	public String addSuccess(){
		return "sell/order/order_addsuccess";
	}
	/**
	 * 更改保存成功跳转
	 * @return
	 */
	@RequestMapping("updSuccess")
	public String updSuccess(){
		return "sell/order/order_updsuccess";
	}
	/**
	 * 库存不足提示
	 * @return
	 */
	@RequestMapping("concon")
	public String concon(){
		return "sell/order/order_choose";
	}
	/**
	 * 跳转统计图页面
	 * @param model
	 * @return
	 */
	@RequestMapping("echarts")
	public String echarts(Model model){
		List<Object> pnoList = orderService.selectPno();
		model.addAttribute("pnoList", pnoList);
		return "sell/order/order_echarts";
	}
	/**
	 * 查询统计数据
	 * @param orderData
	 * @return
	 */
	@RequestMapping("echartsData")
	@ResponseBody
	public Object echartsData(OrderData orderData){
		List<OrderData> info = orderService.selectOrderData(orderData);
		return info;
	}
}
