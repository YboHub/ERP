package com.aaa.dao.warehousedao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.warehouseentity.Food;

public interface FoodDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllFood(Map<String, Object> map);

	int addFood(Food food);

	int deleteFood(Food food);

	List<Map> selectFood(Food food);

	List<Map> selectFoodId(Integer warehousenum);

	int updateFood(Food food);

}
