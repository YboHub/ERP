package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;

public interface StockManagerService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllStock(PageVo pageVo,Map<String, Object> map);

	int findCountByMap1(Map<String, Object> map);

	List<Map<String, Object>> selectAllDetails(PageVo pageVo,Map<String, Object> map);

	List<Map> selProInc(StockManager stockManager);

	int savePeoInc(StockManager stockManager);

	int savePeoInc2(StockManager stockManager);

	int savePeoInc3(StockManager stockManager);

	Double selectTotal(StockManager stockManager);

	Map<String, Object> selectStockById(Integer id);


	String selectRKDH();

	void insertStock(Map<String, Object> map);

	void updateStock(Integer id);


	int addGross(Map<String, Object> map);

	Double selectGross(Map<String, Object> map);


}
