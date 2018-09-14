package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.CapacityDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Capacity;
import com.aaa.entity.manger.Manger;
import com.aaa.service.manger.CapacityService;

@Service
public class CapacityServiceImpl implements CapacityService {
@Autowired
private CapacityDao capacityDao;

@Override
public int findCountByCapacity(Map<String, Object> map) {
	return capacityDao.findCountByCapacity(map);
}

@Override
public List<Map<String, Object>> selectCapacity(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return capacityDao.selectCapacity(map);

}

@Override
public int addmanger(Capacity capacity) {
	return capacityDao.addmanger(capacity);
}

@Override
public int deletemanger(Capacity capacity) {
	return capacityDao.deletemanger(capacity);
}

@Override
public List<Manger> selectmangers(Capacity capacity) {
	return capacityDao.selectmangers(capacity);
}

@Override
public int updatemanger(Capacity capacity) {
	return capacityDao.updatemanger(capacity);
}
}
