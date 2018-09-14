package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.InventoryDao;
import com.aaa.entity.PageVo;
import com.aaa.service.warehouseservice.InventoryService;
@Service
public class InventoryServiceImpl implements InventoryService {
	@Autowired
	private InventoryDao inventoryDao;
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return inventoryDao.findCountByMap(map);
	}
	@Override
	public List<Map<String, Object>> selectAllInv(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectAllInv(map);
	}
	@Override
	public int findCountByMap1(Map<String, Object> map) {
		return inventoryDao.findCountByMap1(map);
	}
	@Override
	public List<Map<String, Object>> selectAllRmfd(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectAllRmfd(map);
	}
	@Override
	public int findCountByMap2(Map<String, Object> map) {
		return inventoryDao.findCountByMap2(map);
	}
	@Override
	public List<Map<String, Object>> selectAllDow(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectAllDow(map);
	}
	/**
	 * 成品出库记录
	 */
	@Override
	public int findCountByMapthere(Map<String, Object> map) {
		return inventoryDao.findCountByMapthere(map);
	}
	@Override
	public List<Map<String, Object>> selectArod(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectArod(map);
	}
	/**
	 * 成品库存总量
	 */
	@Override
	public int findCountByMapFore(Map<String, Object> map) {
		return inventoryDao.findCountByMapFore(map);
	}
	@Override
	public List<Map<String, Object>> selectGross(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectGross(map);
	}
	/**
	 * 原料库存总量
	 */
	@Override
	public int findCountByMapFive(Map<String, Object> map) {
		return inventoryDao.findCountByMapFive(map);
	}
	@Override
	public List<Map<String, Object>> selectYlkc(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selectYlkc(map);
	}
	/**
	 * 废品库存总量
	 */
	@Override
	public int findCountByMapSex(Map<String, Object> map) {
		return inventoryDao.findCountByMapSex(map);
	}
	@Override
	public List<Map<String, Object>> selFpzl(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return inventoryDao.selFpzl(map);
	}
	
}
