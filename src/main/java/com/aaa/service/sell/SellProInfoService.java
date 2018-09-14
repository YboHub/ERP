package com.aaa.service.sell;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.sell.ProduceInfo;

public interface SellProInfoService {

	int gainTotalLineNum(Map<String, Object> map);

	List<Map<String, Object>> selectProduct(PageVo pageVo,
			Map<String, Object> map);

	int updatePriceByPno(ProduceInfo produceInfo);

}
