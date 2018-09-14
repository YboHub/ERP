package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.MaintainsDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Maintain;
import com.aaa.service.emp.MaintainsService;

@Service
public class MaintainsServiceImpl implements MaintainsService {
	@Autowired
	private MaintainsDao maintainsDao;
	/**
	 * 查询
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return maintainsDao.findCountByMap(map);
	}
	/**
	 * 分页
	 */
	@Override
	public List<Map<String, Object>> selectMaintains(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return maintainsDao.selectMaintains(map);
	}
	/**
	 * 添加
	 */
	@Override
	public int addMaintains(Maintain maintain) {
		return maintainsDao.addMaintains(maintain);
	}
	/**
	 * 便利故障订单下拉框
	 */
	@Override
	public List<Map> selecteMaintains(Maintain maintain) {
		return maintainsDao.selecteMaintains(maintain);
	}
	/**
	 * 修该维修状态
	 */
	@Override
	public int updateMaintains(Maintain maintain) {
		return maintainsDao.updateMaintains(maintain);
	}
	/**
	 * 详情
	 */
	@Override
	public List<Map<String, Object>> selectmaintainsMap(Integer mid) {
		return maintainsDao.selectmaintainsMap(mid);
	}
	/**
	 * 添加到拨款
	 */
	@Override
	public void addAppropriation(Maintain maintain) {
		maintainsDao.addAppropriation(maintain);
		
	}
}
