package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Plan;

public interface ProjectService {

	int findCountByMap(Map<String, Object> map);//查询

	List<Map<String, Object>> selectproject(PageVo pagevo,Map<String, Object> map);//分页

	List<Plan> selectPlan(Plan plan);

	int updatePlan(Plan plan);//同意审核

	int noupdatePlan(Plan plan);//不同意审核

	int insert(Plan plan);

	List<Plan> select(Plan plan);
}
