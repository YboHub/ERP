package com.aaa.service.impl.apauditor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.apauditor.MarketDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Market;
import com.aaa.entity.sell.ReturnOrder;
import com.aaa.service.apauditor.MarketService;
@Service
public class MarketServiceImpl implements MarketService {
	@Autowired
	private MarketDao marketDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return marketDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectReturnOrderMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return marketDao.selectReturnOrderMap(map);
	}

	@Override
	public int toUpdate(ReturnOrder returnOrder) {
		return marketDao.toUpdate(returnOrder);
	}

	@Override
	public void insertMarket(Market market) {
		marketDao.inserMarket(market);
	}

	@Override
	public List<ReturnOrder> selectRet(Integer id) {
		return marketDao.selectRet(id);
	}

	@Override
	public int tooUpdate(ReturnOrder returnOrder) {
		return marketDao.tooUpdate(returnOrder);
	}

	@Override
	public void insertToMarket(Market market) {
		marketDao.insertToMarket(market);
	}

	@Override
	public int findCountByMarket(Map<String, Object> map) {
		return marketDao.findCountByMarket(map);
	}

	@Override
	public List<Map<String, Object>> selectMarketMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return marketDao.selectMarketMap(map);
	}

	
}
