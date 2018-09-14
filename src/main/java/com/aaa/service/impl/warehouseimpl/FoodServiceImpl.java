package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.FoodDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.Food;
import com.aaa.service.warehouseservice.FoodService;
@Service
public class FoodServiceImpl implements FoodService {
	@Autowired
	private FoodDao foodDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return foodDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectAllFood(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows()*pageVo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		return foodDao.selectAllFood(map);
	}

	@Override
	public int addFood(Food food) {
		return foodDao.addFood(food);
	}

	@Override
	public int deleteFood(Food food) {
		return foodDao.deleteFood(food);
	}

	@Override
	public List<Map> selectFood(Food food) {
		return foodDao.selectFood(food);
	}


	@Override
	public List<Map> selectFoodId(Integer warehousenum) {
		return foodDao.selectFoodId(warehousenum);
	}

	@Override
	public int updateFood(Food food) {
		return foodDao.updateFood(food);
	}
}
