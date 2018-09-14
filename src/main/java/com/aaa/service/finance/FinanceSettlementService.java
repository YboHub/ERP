/**
 * 
 */
package com.aaa.service.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.entity.sell.OrderInfo;

/**
 * @类名称: FinanceSettlementService
 * @描述类: 财务结算service接口
 * @author: 公子哥
 * @time: 2018-8-17上午9:13:21
 * 
 */
public interface FinanceSettlementService {
	
	int insert(OrderInfo ord);

	int updateTwo(OrderInfo ord);

	int findCountByMap(Map<String, Object> map);
	
	List<OrderInfo> selectOrderReturnOne(OrderInfo ord);

	List<Map<String, Object>> selectPur(PageVo pagevo, Map<String, Object> map);

}
