package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.Food;

public interface FoodService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllFood(PageVo pageVo,Map<String, Object> map);

	int addFood(Food food);

	int deleteFood(Food food);

	List<Map> selectFood(Food food);


	List<Map> selectFoodId(Integer warehousenum);

	int updateFood(Food food);

}
