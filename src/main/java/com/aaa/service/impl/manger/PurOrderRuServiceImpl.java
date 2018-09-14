package com.aaa.service.impl.manger;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.PurOrderRuDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.service.manger.PurOrderRuService;
@Service
public class PurOrderRuServiceImpl implements PurOrderRuService {
@Autowired
private PurOrderRuDao purOrderRuDao;

@Override
public int findCountByPurOrderRu(Map<String, Object> map) {
	return purOrderRuDao.findCountByPurOrderRu(map);
}

@Override
public List<Map<String, Object>> selectPurOrderRu(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return purOrderRuDao.selectPurOrderRu(map);
}

@Override
public int update(QualityRecord qualityRecord) {
	return purOrderRuDao.update(qualityRecord);
}

@Override
public List<QualityRecord> select(QualityRecord qualityRecord) {
	return purOrderRuDao.select(qualityRecord);
}

@Override
public int insert(QualityRecord qualityRecord) {
	return purOrderRuDao.insert(qualityRecord);
}

@Override
public int up(QualityRecord qualityRecord) {
	return purOrderRuDao.up(qualityRecord);
}

@Override
public int findCountByInventory(Map<String, Object> map) {
	return purOrderRuDao.findCountByInventory(map);
}

@Override
public List<Map<String, Object>> selectInventory(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return purOrderRuDao.selectInventory(map);
}
}
