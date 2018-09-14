package com.aaa.service.apauditor;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Market;
import com.aaa.entity.sell.ReturnOrder;

public interface MarketService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectReturnOrderMap(PageVo pageVo,
			Map<String, Object> map);

	int toUpdate(ReturnOrder returnOrder);

	void insertMarket(Market market);

	List<ReturnOrder> selectRet(Integer id);

	int tooUpdate(ReturnOrder returnOrder);

	void insertToMarket(Market market);

	int findCountByMarket(Map<String, Object> map);

	List<Map<String, Object>> selectMarketMap(PageVo pageVo,
			Map<String, Object> map);

}
