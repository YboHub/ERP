package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.ProBackInFoodDao;
import com.aaa.entity.PageVo;
import com.aaa.service.warehouseservice.ProBackInFoodService;
@Service
public class ProBackInFoodServiceImpl implements ProBackInFoodService {
	@Autowired ProBackInFoodDao proBackInFoodDao;
	/**
	 * 成品退回
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return proBackInFoodDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selProBack(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		if(begin<0){
			begin=0;
		}
		map.put("begin", begin);
		map.put("end", end);
		return proBackInFoodDao.selProBack(map);
	}

	@Override
	public List selWareAll(Integer id) {
		return proBackInFoodDao.selWareAll(id);
	}
	/**
	 * 退回成品入库
	 */
	@Override
	public Map<String, Object> selectMarketById(Integer id) {
		return proBackInFoodDao.selectMarketById(id);
	}

	@Override
	public Double selectGross(Map<String, Object> map) {
		return proBackInFoodDao.selectGross(map);
	}

	@Override
	public int addGross(Map<String, Object> map) {
		
		return proBackInFoodDao.addGross(map);
	}
	/**
	 * 生成入库单号
	 */
	/**
	 * 将入库信息插入记录表中
	 */
	@Override
	public void insertStock(Map<String, Object> map) {
		proBackInFoodDao.insertStock(map);
	}

	@Override
	public String selectRKDH() {
		return proBackInFoodDao.selectRKDH();
	}

	@Override
	public void updateMarket(Integer id) {
		proBackInFoodDao.updateMarket(id);
	}

}
