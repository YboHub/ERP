package com.aaa.dao.manger;

import java.util.List;


import java.util.Map;

import com.aaa.entity.apauditor.QualityRecord;

public interface PurOrderRuDao {

	int findCountByPurOrderRu(Map<String, Object> map);

	List<Map<String, Object>> selectPurOrderRu(Map<String, Object> map);

	int update(QualityRecord qualityRecord);

	List<QualityRecord> select(QualityRecord qualityRecord);

	int insert(QualityRecord qualityRecord);

	int up(QualityRecord qualityRecord);

	int findCountByInventory(Map<String, Object> map);

	List<Map<String, Object>> selectInventory(Map<String, Object> map);

}
