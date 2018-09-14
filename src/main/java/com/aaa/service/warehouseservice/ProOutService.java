package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.warehouseentity.Cpck;

public interface ProOutService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectProOut(PageVo pageVo,Map<String, Object> map);

	List<Map<String, Object>> selOutDetails(PageVo pageVo,Map<String, Object> map);

	int findCountByMapOne(Map<String, Object> map);

	List<Map> selProOut(OrderDetail orderDetail);

	int saveProOut(OrderDetail orderDetail);

	void updateProOut(Integer id);

	List<Cpck> selectOrderinfoById(Integer id);

	Double selectGross(Integer pno);

	int reduceGross(Cpck cpck);

	String selectCKDH();

	void insertArod(Cpck cpck);

	List selWareAll(String orderno);
}
