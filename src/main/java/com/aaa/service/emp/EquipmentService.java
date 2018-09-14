package com.aaa.service.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Equipment;

public interface EquipmentService {

	int findCountByMap(Map<String, Object> map);//查询

	List<Map<String, Object>> selectequipment(PageVo pagevo,Map<String, Object> map);//分页

	int updatequipment(Integer id);//点击停止运行

	int updatequipments(Integer id);//点击运行

	int addEquipment(Equipment equipment);//保存

	String equipment();


}
