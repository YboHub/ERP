package com.aaa.service.impl.manger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.YuanChuDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.YuanChu;
import com.aaa.service.manger.YuanChuService;
@Service
public class YuanChuServiceImpl implements YuanChuService {
@Autowired
private YuanChuDao yuanChuDao;

@Override
public int findCountyuanchu(Map<String, Object> map) {
	return yuanChuDao.findCountyuanchu(map);
}

@Override
public List<Map<String, Object>> selectyuanchu(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return yuanChuDao.selectyuanchu(map);
}

@Override
public List<YuanChu> selectmaterialss(YuanChu yuanchu) {
	return yuanChuDao.selectmaterialss(yuanchu);
}
}
