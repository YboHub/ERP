package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.AppropriationDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Appropriation;
import com.aaa.service.emp.AppropriationService;

@Service
public class AppropriationServiceImpl implements AppropriationService {
	@Autowired
	private AppropriationDao appropriationDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return appropriationDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectAppropriation(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return appropriationDao.selectAppropriation(map);
	}

	/**
	 * 修改返回值
	 */
	@Override
	public List<Map> selAppropriation(Appropriation appropriation) {
		return appropriationDao.selAppropriation(appropriation);
	}

	/**
	 * 拨款添加到拨款记录
	 */
	@Override
	public int saveFundsrecord(Appropriation appropriation) {
		return appropriationDao.saveFundsrecord(appropriation);
	}

	/**
	 * 拨款后删除
	 */
	@Override
	public void deleteAppropriation(Integer id) {
		appropriationDao.deleteAppropriation(id);
	}

	/**
	 * 添加财务拨款
	 */
	@Override
	public void addAppropriation(Appropriation appropriation) {
		appropriationDao.addAppropriation(appropriation);
	}
}
