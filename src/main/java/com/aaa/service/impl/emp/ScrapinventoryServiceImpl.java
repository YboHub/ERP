package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.ScrapinventoryDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Scrapinventory;
import com.aaa.service.emp.ScrapinventoryService;

@Service
public class ScrapinventoryServiceImpl implements ScrapinventoryService {
	@Autowired
	private ScrapinventoryDao scrapinventoryDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return scrapinventoryDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectScrapinventory(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return scrapinventoryDao.selectScrapinventory(map);
	}
	/**
	 * 查询废品库剩余
	 */
	@Override
	public List<Map> listScrapinventoryzong(Scrapinventory scrapinventory) {
		return scrapinventoryDao.listScrapinventoryzong(scrapinventory);
	}
	/**
	 * 修改废品库存总量
	 */
	@Override
	public int updateScrapinventoryzong(Scrapinventory scrapinventory) {
		return scrapinventoryDao.updateScrapinventoryzong(scrapinventory);
	}

	/**
	 * 添加废品出库记录
	 */
	@Override
	public int addScrapinventory(Scrapinventory scrapinventory) {
		return scrapinventoryDao.addScrapinventory(scrapinventory);
	}

	/**
	 * 查询仓库废铁原料
	 */
	@Override
	public List<Map> selectYuanLiao(Scrapinventory scrapinventory) {
		return scrapinventoryDao.selectYuanLiao(scrapinventory);
	}

	/**
	 * 添加原料库废铁重量
	 */
	@Override
	public void editYuanLiao(Scrapinventory scrapinventory) {
		scrapinventoryDao.editYuanLiao(scrapinventory);
	}

	@Override
	public int findCountByMaps(Map<String, Object> map) {
		return scrapinventoryDao.findCountByMaps(map);
	}

	@Override
	public List<Map<String, Object>> selectScrapinventorys(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return scrapinventoryDao.selectScrapinventorys(map);
	}


	
	
}
