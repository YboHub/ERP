package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.MaterialssDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialssService;
@Service
public class MaterialssServiceImpl implements MaterialssService {
@Autowired
private MaterialssDao materialssDao;

@Override
public int findCountBymaterial(Map<String, Object> map) {
	return materialssDao.findCountBymaterial(map);
}

@Override
public List<Map<String, Object>> selectmaterial(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return materialssDao.selectmaterial(map);
}

@Override
public List<Material> select(Integer mid) {
	return materialssDao.select(mid);
}

@Override
public int toUpdate(Material material) {
	return materialssDao.toUpdate(material);
}

@Override
public int tooUpdate(Material material) {
	return materialssDao.tooUpdate(material);
}
}
