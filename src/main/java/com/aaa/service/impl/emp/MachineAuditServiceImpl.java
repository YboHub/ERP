package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.MachineAuditDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Equipment;
import com.aaa.service.emp.MachineAuditService;

@Service
public class MachineAuditServiceImpl implements MachineAuditService {
	@Autowired
	private MachineAuditDao machineAuditDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return machineAuditDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectMachineAudit(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return machineAuditDao.selectMachineAudit(map);
	}
	/**
	 * 信息返回审核表
	 */
	@Override
	public List<Equipment> selectEquipment(Equipment equipment) {
		return machineAuditDao.selectEquipment(equipment);
	}
	/**
	 * 同意审核
	 */
	@Override
	public int updateEquipment(Equipment equipment) {
		return machineAuditDao.updateEquipment(equipment);
	}
	/**
	 * 不同意审核
	 */
	@Override
	public int noupdateEquipment(Equipment equipment) {
		return machineAuditDao.noupdateEquipment(equipment);
	}
	/**
	 * 添加到拨款
	 */
	@Override
	public void insertsEquipment(Equipment equipment) {
		machineAuditDao.insertsEquipment(equipment);
	}
}
