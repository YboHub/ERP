package com.aaa.service.ischeck;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.entity.purchase.PurOrder;

public interface IscheckService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectIscheckMap(PageVo pageVo,Map<String, Object> map);

	List<PurOrder> selectPur(Integer id);

	int toUpdate(PurOrder purorder);

	int tooUpdate(PurOrder purorder);

	void insertQualityRecord(QualityRecord qualityRecord);

	void insertQualityRe(QualityRecord qualityRecord);

	int findCountByMapQuality(Map<String, Object> map);

	List<Map<String, Object>> selectQualityRecordMap(PageVo pageVo,Map<String, Object> map);

	int updatePro(Procurement procurement);

}