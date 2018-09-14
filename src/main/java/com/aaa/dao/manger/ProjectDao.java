package com.aaa.dao.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.manger.Plan;

public interface ProjectDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectproject(Map<String, Object> map);

	List<Plan> selectPlan(Plan plan);

	int updatePlan(Plan plan);

	int noupdatePlan(Plan plan);

	int insert(Plan plan);

	List<Plan> select(Plan plan);


}
