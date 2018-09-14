/**
 * 
 */
package com.aaa.dao.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.purchase.PurOrder;
import com.aaa.entity.sell.OrderInfo;

/**
 * @类名称:  FinanceSettlementDao
 * @描述类:  财务结算接口
 * @author: 公子哥
 * @time:   2018-8-17上午9:16:42
 * 
 */
public interface FinanceSettlementDao {
	
	int insert(OrderInfo ord);

	int updateTwo(OrderInfo ord);
	
	int findCountByMap(Map<String, Object> map);
	
	List<OrderInfo> selectOrderReturnOne(OrderInfo ord);

	List<Map<String, Object>> selectPur(Map<String, Object> map);

}
