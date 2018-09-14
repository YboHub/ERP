/**
 * 
 */
package com.aaa.service.impl.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.finance.FinanceSettlementDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.service.finance.FinanceSettlementService;

/**
 * @类名称: FinanceSettlementImpl
 * @描述类: 财务结算实现类
 * @author: 公子哥
 * @time: 2018-8-17上午9:14:43
 * 
 */
@Service
public class FinanceSettlementImpl implements FinanceSettlementService {
	@Autowired
	private FinanceSettlementDao financeSettlementDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return financeSettlementDao.findCountByMap(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPur(PageVo pagevo,
			Map<String, Object> map) {
		int begin=pagevo.getRows()*(pagevo.getPage()-1);
		int end=pagevo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return financeSettlementDao.selectPur(map);
	}
	
	@Override
	public List<OrderInfo> selectOrderReturnOne(OrderInfo ord) {
		return financeSettlementDao.selectOrderReturnOne(ord);
	}
	
	@Override
	public int insert(OrderInfo ord) {
		return financeSettlementDao.insert(ord);
	}
	
	@Override
	public int updateTwo(OrderInfo ord) {
		return financeSettlementDao.updateTwo(ord);
	}
}
