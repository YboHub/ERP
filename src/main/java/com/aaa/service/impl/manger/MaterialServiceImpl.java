package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.MaterialDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialService;
@Service
public class MaterialServiceImpl implements MaterialService {
@Autowired
private MaterialDao materialDao;

@Override
public int findCountBymaterial(Map<String, Object> map) {
	return materialDao.findCountBymaterial();
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
	return materialDao.selectmaterial(map);
}

@Override
public int deletematerial(Material material) {
	return materialDao.deletematerial(material);
}

@Override
public int addmanger(Material material) {
	return materialDao.addmanger(material);
}

@Override
public List<Map<String, Object>> selectmaterialss(Material material) {
	return materialDao.selectmaterialss(material);
}
}
