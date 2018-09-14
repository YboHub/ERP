package com.aaa.dao.warehousedao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.warehouseentity.Inventory;

public interface InventoryDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllInv(Map<String, Object> map);

	int findCountByMap1(Map<String, Object> map);

	List<Map<String, Object>> selectAllRmfd(Map<String, Object> map);

	int findCountByMap2(Map<String, Object> map);

	List<Map<String, Object>> selectAllDow(Map<String, Object> map);
	/**
	 * 成品出库记录
	 * @param map
	 * @return
	 */
	int findCountByMapthere(Map<String, Object> map);

	List<Map<String, Object>> selectArod(Map<String, Object> map);

	int findCountByMapFore(Map<String, Object> map);

	List<Map<String, Object>> selectGross(Map<String, Object> map);

	int findCountByMapFive(Map<String, Object> map);

	List<Map<String, Object>> selectYlkc(Map<String, Object> map);

	int findCountByMapSex(Map<String, Object> map);

	List<Map<String, Object>> selFpzl(Map<String, Object> map);
	
}
