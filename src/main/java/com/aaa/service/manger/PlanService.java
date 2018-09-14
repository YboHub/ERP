package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Plan;

public interface PlanService {

	int findCountByplan(Map<String, Object> map);

	List<Map<String, Object>> selectplan(PageVo pagevo, Map<String, Object> map);

	int addplan(Plan plan);

	int delete(long id);

	List<Plan> selectbyplan(Plan plan);

	int updateplan(Plan plan);

	int update(Plan plan);

	int toupdate(Plan plan);

	List<Map<String, Object>> selectorder(Map<String, Object> map);

	List<Plan> select(Plan plan);

	int tooupdate(Plan plan);

	List<Plan> selectma(Plan plan);

	Double selectpl(Map<String, Object> map);

	List<Plan> selecttime(Plan plan);

	int date(Plan plan);

	List<Plan> selectshi(Plan plan);





}
