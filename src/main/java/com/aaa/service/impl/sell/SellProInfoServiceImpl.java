package com.aaa.service.impl.sell;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.sell.SellProInfoDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.ProduceInfo;
import com.aaa.service.sell.SellProInfoService;

@Service
public class SellProInfoServiceImpl implements SellProInfoService{
	@Autowired
	private SellProInfoDao sellProInfoDao;

	@Override
	public int gainTotalLineNum(Map<String, Object> map) {
		return sellProInfoDao.gainTotalLineNum(map);
	}

	@Override
	public List<Map<String, Object>> selectProduct(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return sellProInfoDao.selectProduct(map);
	}

	@Override
	public int updatePriceByPno(ProduceInfo produceInfo) {
		return sellProInfoDao.updatePriceByPno(produceInfo);
	}
}
