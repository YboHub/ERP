package com.aaa.dao.ischeck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.entity.purchase.PurOrder;

public interface IscheckDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectIscheckMap(Map<String, Object> map);

	List<PurOrder> selectPur(Integer id);

	int toUpdate(PurOrder purorder);

	int tooUpdate(PurOrder purorder);

	void insertQualityRecord(QualityRecord qualityRecord);

	void insertQualityRe(QualityRecord qualityRecord);
	
	//质检记录
	int findCountByMapQuality(Map<String, Object> map);

	List<Map<String, Object>> selectQualityRecordMap(Map<String, Object> map);

	int updatePro(Procurement procurement);

}