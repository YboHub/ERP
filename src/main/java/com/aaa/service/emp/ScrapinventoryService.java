package com.aaa.service.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Scrapinventory;

public interface ScrapinventoryService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectScrapinventory(PageVo pagevo,Map<String, Object> map);

	List<Map> listScrapinventoryzong(Scrapinventory scrapinventory);//库存数量

	int updateScrapinventoryzong(Scrapinventory scrapinventory);//修改废品库存总量

	int addScrapinventory(Scrapinventory scrapinventory);//添加废品出库记录

	List<Map> selectYuanLiao(Scrapinventory scrapinventory);//查询仓库废铁原料

	void editYuanLiao(Scrapinventory scrapinventory);//添加原料库废铁重量

	int findCountByMaps(Map<String, Object> map);

	List<Map<String, Object>> selectScrapinventorys(PageVo pagevo,Map<String, Object> map);

}
