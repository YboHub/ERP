package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.ProOutDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.warehouseentity.Cpck;
import com.aaa.service.warehouseservice.ProOutService;
@Service
public class ProOutServiceImpl implements ProOutService {
	@Autowired
	private ProOutDao proOutDao;
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return proOutDao.findCountByMap(map);
	}
	@Override
	public List<Map<String, Object>> selectProOut(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return proOutDao.selectProOut(map);
	}
	@Override
	public int findCountByMapOne(Map<String, Object> map) {
		return proOutDao.findCountByMapOne(map);
	}
	@Override
	public List<Map<String, Object>> selOutDetails(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return proOutDao.selOutDetails(map);
	}
	@Override
	public List<Map> selProOut(OrderDetail orderDetail) {
		return proOutDao.selProOut(orderDetail);
	}
	@Override
	public int saveProOut(OrderDetail orderDetail) {
		return proOutDao.saveProOut(orderDetail);
	}
	@Override
	public void updateProOut(Integer id) {
		proOutDao.updateProOut(id);
	}
	@Override
	public List<Cpck> selectOrderinfoById(Integer id) {
		return proOutDao.selectOrderinfoById(id);
	}
	@Override
	public Double selectGross(Integer pno) {
		return proOutDao.selectGross(pno);
	}
	@Override
	public int reduceGross(Cpck cpck) {
		return proOutDao.reduceGross(cpck);
	}
	@Override
	public String selectCKDH() {
		return proOutDao.selectCKDH();
	}
	@Override
	public void insertArod(Cpck cpck) {
		proOutDao.insertArod(cpck);
	}
	/**
	 * 查询库存总量
	 */
	@Override
	public List selWareAll(String orderno) {
		return proOutDao.selWareAll(orderno);
	}
}
