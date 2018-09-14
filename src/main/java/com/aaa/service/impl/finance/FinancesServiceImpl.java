package com.aaa.service.impl.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.finance.FinancesDao;
import com.aaa.entity.emp.Emp;
import com.aaa.entity.PageVo;
import com.aaa.entity.finance.Finances;
import com.aaa.service.finance.FinancesService;

/** 
 * @类名称:  FinancesServiceImpl 
 * @类描述:
 * @author  公子哥
 * @time    2018-7-27上午8:39:39
 * @version 1.0
 */
@Service
public class FinancesServiceImpl implements FinancesService {
	@Autowired	//自动注入
	private FinancesDao financesDao;
	/***
	 * 获取总行数
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return financesDao.findCountByMap(map);
	}
	/***
	 * 分页查询
	 */
	@Override
	public List<Map<String, Object>> selectFinancesMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows()*pageVo.getPage();
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> financesList = financesDao.selectFinancesMap(map);
		return financesList;
	}
}
