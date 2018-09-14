package com.aaa.service.sell;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.aaa.entity.PageVo;
import com.aaa.entity.sell.Client;
import com.aaa.entity.sell.OrderData;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.entity.sell.ReturnOrder;

public interface OrderService {
	
	List<Object> selectCname();

	List<Object> selectPno();

	List<Object> selectPname();

	List<Object> selectEname(HttpSession session);

	List<OrderDetail> selectProInfoByPname(OrderDetail orderDetail);

	List<OrderDetail> selectProInfoByPno(OrderDetail orderDetail);

	List<OrderDetail> selectProInfoByPsize(OrderDetail orderDetail);

	List<Map<String, Object>> selectOrderInfo(PageVo pagevo, Map<String, Object> map);
	
	List<Map<String, Object>> selectClientInfoByOrderNo(OrderInfo orderInfo);
	
	List<Map<String, Object>> selectReorderInfo(PageVo pageVo, Map<String, Object> map);

	List<Map<String, Object>> selectReorderDetail(String rorderno);

	List<OrderDetail> selectOrderInfoByOrderNo(OrderDetail orderDetail);
	
	OrderDetail selectReturnProInfoById(OrderDetail orderDetail);
	
	int gainTotalLineNum(Map<String, Object> map);

	int deleteOrderDetailByOrderId(OrderDetail orderDetail);
	
	int deleteOrderDetailByOrderNo(OrderDetail orderDetail);
	
	int insertOrder(OrderDetail orderDetail,OrderInfo orderInfo, Client client);

	int updateOrderInfoByOrderId(OrderDetail orderDetail, OrderInfo orderInfo);

	int selectPnumByPno(OrderDetail orderDetail);

	int saveReturnOrder(ReturnOrder returnOrder);

	int insertFinalPayment(OrderInfo orderInfo);

	int gainReorderTotalLineNum(Map<String, Object> map);

	int selectReturnedQuantity(int opid);

	List<OrderData> selectOrderData(OrderData orderData);

}
