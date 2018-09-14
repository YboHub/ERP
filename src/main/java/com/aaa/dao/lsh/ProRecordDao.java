package com.aaa.dao.lsh;

import java.util.List;
import java.util.Map;

import com.aaa.entity.warehouseentity.StockManager;

public interface ProRecordDao {

	List<Map<String, Object>> selectAllProRecord(Map<String, Object> map);

	int getAllCount(Map<String, Object> map);

	int toSaveProRecord(StockManager stockManager);

	List<Map<String, Object>> selectAllCapacity(Integer id);

	List<Map<String, Object>> getDoodsType();

	String getLastProductionnum();

}
