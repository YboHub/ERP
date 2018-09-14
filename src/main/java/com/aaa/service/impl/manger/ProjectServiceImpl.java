package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.ProjectDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Plan;
import com.aaa.service.manger.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao projectDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return projectDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectproject(PageVo pagevo,Map<String, Object> map) {
		
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
				begin=0;	
			}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return projectDao.selectproject(map);
	}

	/**
	 * 返回审核页面
	 */
	@Override
	public List<Plan> selectPlan(Plan plan) {
		return projectDao.selectPlan(plan);
	}

	/**
	 * 审核同意
	 */
	@Override
	public int updatePlan(Plan plan) {
		return projectDao.updatePlan(plan);
	}
	/**
	 * 不同意审核
	 */
	@Override
	public int noupdatePlan(Plan plan) {
		return projectDao.noupdatePlan(plan);
	}

	@Override
	public int insert(Plan plan) {
		return projectDao.insert(plan);
	}

	@Override
	public List<Plan> select(Plan plan) {
		return projectDao.select(plan);
	}
	
}
