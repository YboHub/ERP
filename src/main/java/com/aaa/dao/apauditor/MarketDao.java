package com.aaa.dao.apauditor;

import java.util.List;
import java.util.Map;

import com.aaa.entity.apauditor.Market;
import com.aaa.entity.sell.ReturnOrder;

public interface MarketDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectReturnOrderMap(Map<String, Object> map);

	int toUpdate(ReturnOrder returnOrder);

	void inserMarket(Market market);

	List<ReturnOrder> selectRet(Integer id);

	int tooUpdate(ReturnOrder returnOrder);

	void insertToMarket(Market market);

	int findCountByMarket(Map<String, Object> map);

	List<Map<String, Object>> selectMarketMap(Map<String, Object> map);

}
