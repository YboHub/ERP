package com.aaa.service.impl.ischeck;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.ischeck.IscheckDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.QualityRecord;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.ischeck.IscheckService;
@Service
public class IscheckServiceImpl implements IscheckService {
	@Autowired
	private IscheckDao ischeckDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return ischeckDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectIscheckMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return ischeckDao.selectIscheckMap(map);
	}
	@Override
	public List<PurOrder> selectPur(Integer id) {
		return ischeckDao.selectPur(id);
	}

	@Override
	public int toUpdate(PurOrder purorder) {
		return ischeckDao.toUpdate(purorder);
	}

	@Override
	public int tooUpdate(PurOrder purorder) {
		return ischeckDao.tooUpdate(purorder);
	}

	@Override
	public void insertQualityRecord(QualityRecord qualityRecord) {
		ischeckDao.insertQualityRecord(qualityRecord);
		
	}

	@Override
	public void insertQualityRe(QualityRecord qualityRecord) {
		ischeckDao.insertQualityRe(qualityRecord);
	}
	/**
	 * 质检记录
	 */
	@Override
	public int findCountByMapQuality(Map<String, Object> map) {
		return ischeckDao.findCountByMapQuality(map);
	}

	@Override
	public List<Map<String, Object>> selectQualityRecordMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return ischeckDao.selectQualityRecordMap(map);
	}
	/**
	 * 不合格修改procurement状态
	 */
	@Override
	public int updatePro(Procurement procurement) {
		return ischeckDao.updatePro(procurement);
	}

}
