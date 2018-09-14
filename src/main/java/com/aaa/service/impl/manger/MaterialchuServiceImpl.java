package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.MaterialchuDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;
import com.aaa.service.manger.MaterialchuService;
@Service
public class MaterialchuServiceImpl implements MaterialchuService {
@Autowired
private MaterialchuDao materialchuDao;

@Override
public int findCountBymaterial(Map<String, Object> map) {
	return materialchuDao.findCountBymaterial(map);
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
	return materialchuDao.selectmaterial(map);
}

@Override
public List<Material> selectma(Material material) {
	return materialchuDao.selectma(material);
}

@Override
public Double select(String name) {
	return materialchuDao.select(name);
}

@Override
public int update(Material material) {
	return materialchuDao.update(material);
}

@Override
public int up(Material material) {
	return materialchuDao.up(material);
}

@Override
public List<Material> selectbymaterial(Material material) {
	return materialchuDao.selectbymaterial(material);
}

@Override
public int insert(Material material) {
	return materialchuDao.insert(material);
}

@Override
public int upda(Material material) {
	return materialchuDao.upda(material);
}
}
