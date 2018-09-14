package com.aaa.dao.warehousedao;

import java.util.List;
import java.util.Map;

public interface ProBackInFoodDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selProBack(Map<String, Object> map);

	List selWareAll(Integer id);

	Map<String, Object> selectMarketById(Integer id);

	Double selectGross(Map<String, Object> map);

	int addGross(Map<String, Object> map);


	void insertStock(Map<String, Object> map);

	String selectRKDH();

	void updateMarket(Integer id);


}
