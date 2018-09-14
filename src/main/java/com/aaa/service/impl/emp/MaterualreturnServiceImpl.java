package com.aaa.service.impl.emp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.emp.MaterualreturnDao;
import com.aaa.entity.PageVo;
import com.aaa.service.emp.MaterualreturnService;
@Service
public class MaterualreturnServiceImpl implements MaterualreturnService {
	@Autowired
	private MaterualreturnDao materualreturnDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return materualreturnDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectMaterualreturn(PageVo pagevo,Map<String, Object> map) {
		int begin = pagevo.getRows()*(pagevo.getPage()-1);
		if(begin<0){
			begin=0;	
		}
		int end = pagevo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return materualreturnDao.selectMaterualreturn(map);
	}
}
