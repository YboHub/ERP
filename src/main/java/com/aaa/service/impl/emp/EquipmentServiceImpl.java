package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.EquipmentDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.emp.Equipment;
import com.aaa.service.emp.EquipmentService;
@Service
public class EquipmentServiceImpl implements EquipmentService {
	@Autowired
	private EquipmentDao equipmentDao;
	
	/**
	 * 查询
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return equipmentDao.findCountByMap(map);
	}

	/**
	 * 分页
	 */
	@Override
	public List<Map<String, Object>> selectequipment(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return equipmentDao.selectequipment(map);
	}
	/**
	 * 点击停止运行
	 */
	@Override
	public int updatequipment(Integer id) {
		return equipmentDao.updatequipment(id);
	}
	/**
	 * 点击运行
	 */
	@Override
	public int updatequipments(Integer id) {
		return equipmentDao.updatequipments(id);
	}

	/**
	 * 保存
	 */
	@Override
	public int addEquipment(Equipment equipment) {
		return equipmentDao.addEquipment(equipment);
	}

	@Override
	public String equipment() {
		return equipmentDao.equipment();
	}
	

}
