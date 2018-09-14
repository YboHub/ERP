package com.aaa.dao.manger;

import java.util.List;

import java.util.Map;

import com.aaa.entity.manger.Neng;
import com.aaa.entity.manger.Plan;
import com.aaa.entity.manger.Xubiao;
import com.aaa.entity.sell.OrderDetail;

public interface OrderinfoDao {

	int findByorderinfo(Map<String, Object> map);

	List<Map<String, Object>> selectorderinfo(Map<String, Object> map);

	List<OrderDetail> toselect(OrderDetail orderinfo);

	int toAdd(Plan plan);

	int update(OrderDetail orderDetail);

	
	String selectPunm();

	int insert(Xubiao xubiao);

	List<Xubiao> selectXubiao(Xubiao xubiao);

	int delete(Plan plan);

	List<Map<String, Object>> selectorder(Map<String, Object> map);

	List<Neng> selectneng();

}
