package com.aaa.dao.manger;

import java.util.List;

import java.util.Map;

import com.aaa.entity.manger.Capacity;
import com.aaa.entity.manger.Manger;

public interface CapacityDao {

	int findCountByCapacity(Map<String, Object> map);

	List<Map<String, Object>> selectCapacity(Map<String, Object> map);

	int addmanger(Capacity capacity);

	int deletemanger(Capacity capacity);

	List<Manger> selectmangers(Capacity capacity);

	int updatemanger(Capacity capacity);

}
