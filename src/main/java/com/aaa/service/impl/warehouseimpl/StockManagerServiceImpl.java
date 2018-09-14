package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.StockManagerDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;

@Service
public class StockManagerServiceImpl implements com.aaa.service.warehouseservice.StockManagerService {
	@Autowired
	private StockManagerDao stockManagerDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		
		return stockManagerDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectAllStock(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return stockManagerDao.selectAllStock(map);
	}

	@Override
	public int findCountByMap1(Map<String, Object> map) {
		return stockManagerDao.findCountByMap1(map);
	}

	@Override
	public List<Map<String, Object>> selectAllDetails(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows()*pageVo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		return stockManagerDao.selectAllDetails(map);
	}

	@Override
	public List<Map> selProInc(StockManager stockManager) {
		return stockManagerDao.selProInc(stockManager);
	}

	@Override
	public int savePeoInc(StockManager stockManager) {
		return stockManagerDao.savePeoInc(stockManager);
	}

	@Override
	public int savePeoInc2(StockManager stockManager) {
		return stockManagerDao.savePeoInc2(stockManager);
	}

	@Override
	public int savePeoInc3(StockManager stockManager) {
		return stockManagerDao.savePeoInc3(stockManager);
	}

	@Override
	public Double selectTotal(StockManager stockManager) {
		return stockManagerDao.selectTotal(stockManager);
	}
	/**
	 * 保存入库
	 */
	@Override
	public Map<String, Object> selectStockById(Integer id) {
		return stockManagerDao.selectStockById(id);
	}
	@Override
	public String selectRKDH() {
		return stockManagerDao.selectRKDH();
	}

	@Override
	public void insertStock(Map<String, Object> map) {
		stockManagerDao.insertStock(map);
	}

	@Override
	public void updateStock(Integer id) {
		stockManagerDao.updateStock(id);
	}

	
	@Override
	public int addGross(Map<String, Object> map) {
		return stockManagerDao.addGross(map);
	}

	@Override
	public Double selectGross(Map<String, Object> map) {
		return stockManagerDao.selectGross(map);
	}

}
