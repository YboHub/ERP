package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.PlanDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Plan;
import com.aaa.service.manger.PlanService;
@Service
public class PlanServiceImpl implements PlanService {
@Autowired
private PlanDao planDao;

@Override
public int findCountByplan(Map<String, Object> map) {
	return planDao.findCountByplan(map);
}

@Override
public List<Map<String, Object>> selectplan(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return planDao.selectplan(map);
}

@Override
public int addplan(Plan plan) {
	return planDao.addplan(plan);
}

@Override
public int delete(long id) {
	return planDao.delete(id);
}

@Override
public List<Plan> selectbyplan(Plan plan) {
	return planDao.selectbyplan(plan);
}

@Override
public int updateplan(Plan plan) {
	return planDao.updateplan(plan);
}

@Override
public int update(Plan plan) {
	return planDao.update(plan);
}

@Override
public int toupdate(Plan plan) {
	return planDao.toupdate(plan);
}

@Override
public List<Map<String, Object>> selectorder(Map<String, Object> map) {
	return planDao.selectorder(map);
}

@Override
public List<Plan> select(Plan plan) {
	return planDao.select(plan);
}

@Override
public int tooupdate(Plan plan) {
	return planDao.tooupdate(plan);
}

@Override
public List<Plan> selectma(Plan plan) {
	return planDao.selectma(plan);
}

@Override
public Double selectpl(Map<String, Object> map) {
	return planDao.selectpl(map);
}

@Override
public List<Plan> selecttime(Plan plan) {
	return planDao.selecttime(plan);
}

@Override
public int date(Plan plan) {
	return planDao.date(plan);
}

@Override
public List<Plan> selectshi(Plan plan) {
	return planDao.selectshi(plan);
}





}
