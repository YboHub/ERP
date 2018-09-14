package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Appropriation;

public interface AppropriationDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAppropriation(Map<String, Object> map);

	List<Map> selAppropriation(Appropriation appropriation);//修应该返回值

	int saveFundsrecord(Appropriation appropriation);//拨款添加到拨款记录

	void deleteAppropriation(Integer id);//拨款后删除

	void addAppropriation(Appropriation appropriation);//添加财务拨款

}
