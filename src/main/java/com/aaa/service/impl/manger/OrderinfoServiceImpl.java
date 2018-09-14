package com.aaa.service.impl.manger;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.manger.OrderinfoDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Neng;
import com.aaa.entity.manger.Plan;
import com.aaa.entity.manger.Xubiao;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.service.manger.OrderinfoService;
@Service
public class OrderinfoServiceImpl implements OrderinfoService {
@Autowired
private OrderinfoDao orderinfoDao;

@Override
public int findByorderinfo(Map<String, Object> map) {
	return orderinfoDao.findByorderinfo(map);
}

@Override
public List<Map<String, Object>> selectorderinfo(PageVo vo,
		Map<String, Object> map) {
	int begin = vo.getRows()*(vo.getPage()-1);
	if(begin<0){
		begin=0;
	}
	int end = vo.getRows();
	map.put("begin",begin);
	map.put("end",end);
	return orderinfoDao.selectorderinfo(map);
}

@Override
public List<OrderDetail> toselect(OrderDetail orderinfo) {
	return orderinfoDao.toselect(orderinfo);
}

@Override
public int toAdd(Plan plan) {
	return orderinfoDao.toAdd(plan);
}

@Override
public int update(OrderDetail orderDetail) {
	return orderinfoDao.update(orderDetail);
}

@Override
public String selectPunm() {
	return orderinfoDao.selectPunm();
}

@Override
public int insert(Xubiao xubiao) {
	return orderinfoDao.insert(xubiao);
}

@Override
public List<Xubiao> selectXubiao(Xubiao xubiao) {
	return orderinfoDao.selectXubiao(xubiao);
}

@Override
public int delete(Plan plan) {
	return orderinfoDao.delete(plan);
}

@Override
public List<Map<String, Object>> selectorder(Map<String, Object> map) {
	return orderinfoDao.selectorder(map);
}


@Override
public List<Neng> selectneng() {
	return orderinfoDao.selectneng();
}



}
