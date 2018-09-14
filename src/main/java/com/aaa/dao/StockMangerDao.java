package com.aaa.dao;

import java.util.List;


import java.util.Map;


import com.aaa.entity.manger.Manger;

public interface StockMangerDao {

	int findCountBymanger(Map<String, Object> map);

	List<Map<String, Object>> selectmanger(Map<String, Object> map);

	int addmanger(Manger manger);

	int deletemanger(Manger manger);

	List<Manger> selectmangers(Manger manger);

	int updatemanger(Manger manger);

}
