package com.aaa.dao.sell;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.aaa.entity.sell.OrderData;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.entity.sell.ReturnOrder;

public interface OrderDao {
	List<Map<String, Object>> selectOrderInfo(Map<String, Object> map);

	List<Map<String, Object>> selectClientInfoByOrderNo(OrderInfo orderInfo);
	
	List<Map<String, Object>> selectReorderInfo(Map<String, Object> map);
	
	List<OrderDetail> selectProInfoByPname(OrderDetail orderDetail);

	List<OrderDetail> selectProInfoByPno(OrderDetail orderDetail);

	List<OrderDetail> selectProInfoByPsize(OrderDetail orderDetail);

	List<OrderDetail> selectOrderInfoByOrderNo(OrderDetail orderDetail);
	
	Map<String, Object> selectPnumByPno(OrderDetail orderDetail);
	
	Map<String, Object> selectPseudoDeleteByOrderId(OrderDetail orderDetail);
	
	OrderDetail selectReturnProInfoById(OrderDetail orderDetail);
	
	OrderInfo selectOrderMoneyByOrderNo(OrderInfo orderInfo);
	
	OrderInfo selectCnoByCname(OrderInfo orderInfo);

	OrderInfo selectEnoByEname(OrderInfo orderInfo);
	
	int gainTotalLineNum(Map<String, Object> map);

	int updateOrderDetailByOrderId(OrderDetail orderDetail);
	
	int addOrderDetail(OrderDetail orderDetail);

	int addOrderInfo(OrderInfo orderInfo);

	int deleteOrderDetailByOrderId(OrderDetail orderDetail);

	int deleteOrderDetailByOrderNo(OrderDetail orderDetail);

	int updateOrderInfoByOrderId(OrderInfo orderInfo);
	
	int updateOrderDelStaByOrderId(OrderDetail orderDetail);
	
	int updateReturnReason(Map<String, Object> map);

	int saveReturnOrder(ReturnOrder returnOrder);

	int insertDownPayment(Map<String, Object> financeMap);

	int gainReorderTotalLineNum();

	void updateOrderStateByOrderNo(Map<String, Object> map);
	
	Map<String, Object> selectPaymentStateByOrderNo(@Param("num")String num, @Param("fpType")int fpType);
	
	int updateOrderPayTypeByOrderNo(@Param("orderno")String num, @Param("paytype")int fpType);

	List<Map<String, Object>> selectReorderDetail(@Param("rorderno")String rorderno);

	Map<String, Integer> selectReturnedQuantity(@Param("opid")int opid);

	List<OrderData> selectOrderData(Map<String, Object> dateMap);

}
