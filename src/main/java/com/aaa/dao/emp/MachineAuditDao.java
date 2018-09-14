package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.emp.Equipment;

public interface MachineAuditDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectMachineAudit(Map<String, Object> map);

	List<Equipment> selectEquipment(Equipment equipment);//信息返回审核表

	int updateEquipment(Equipment equipment);//同意审核

	int noupdateEquipment(Equipment equipment);//不同意审核

	void insertsEquipment(Equipment equipment);//添加到拨款


}
