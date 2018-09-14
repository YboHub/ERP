package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Maintain;

public interface MaintainsDao {

	int findCountByMap(Map<String, Object> map);//查询

	List<Map<String, Object>> selectMaintains(Map<String, Object> map);//分页

	int addMaintains(Maintain maintain);//添加

	List<Map> selecteMaintains(Maintain maintain);//便利故障订单下拉框

	int updateMaintains(Maintain maintain);//修该维修状态

	List<Map<String, Object>> selectmaintainsMap(Integer mid);//详情

	void addAppropriation(Maintain maintain);//添加到拨款

}
