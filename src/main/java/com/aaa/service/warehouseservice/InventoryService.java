package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.Inventory;

public interface InventoryService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllInv(PageVo pageVo,Map<String, Object> map);

	int findCountByMap1(Map<String, Object> map);

	List<Map<String, Object>> selectAllRmfd(PageVo pageVo,Map<String, Object> map);

	int findCountByMap2(Map<String, Object> map);

	List<Map<String, Object>> selectAllDow(PageVo pageVo,Map<String, Object> map);

	int findCountByMapthere(Map<String, Object> map);

	List<Map<String, Object>> selectArod(PageVo pageVo, Map<String, Object> map);

	int findCountByMapFore(Map<String, Object> map);

	List<Map<String, Object>> selectGross(PageVo pageVo, Map<String, Object> map);

	int findCountByMapFive(Map<String, Object> map);

	List<Map<String, Object>> selectYlkc(PageVo pageVo, Map<String, Object> map);

	int findCountByMapSex(Map<String, Object> map);

	List<Map<String, Object>> selFpzl(PageVo pageVo, Map<String, Object> map);

}
