package com.aaa.dao.sell;

import java.util.List;
import java.util.Map;

import com.aaa.entity.sell.ProduceInfo;

public interface SellProInfoDao {

	int gainTotalLineNum(Map<String, Object> map);

	List<Map<String, Object>> selectProduct(Map<String, Object> map);
	
	List<Object> selectPno();

	List<Object> selectPname();

	int updatePriceByPno(ProduceInfo produceInfo);
}
