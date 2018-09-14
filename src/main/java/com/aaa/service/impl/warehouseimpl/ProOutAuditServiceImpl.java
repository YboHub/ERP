package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.ProOutAuditDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;
import com.aaa.service.warehouseservice.ProOutAuditService;
@Service
public class ProOutAuditServiceImpl implements ProOutAuditService {
	@Autowired
	private ProOutAuditDao proOutAuditDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return proOutAuditDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selOutAuditDetails(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return proOutAuditDao.selOutAuditDetails(map);
	}

	@Override
	public List<Map> proOutAudit(OrderDetail orderDetail) {
		return proOutAuditDao.proOutAudit(orderDetail);
	}

	@Override
	public int savepassProOut(OrderInfo orderInfo) {
		return proOutAuditDao.savepassProOut(orderInfo);
	}

	@Override
	public int cprkbh(OrderInfo orderInfo) {
		return proOutAuditDao.cprkbh(orderInfo);
	}
	/**
	 * 成品入库审核
	 */
	@Override
	public int findCountByMapOne(Map<String, Object> map) {
		return proOutAuditDao.findCountByMapOne(map);
	}

	@Override
	public List<Map<String, Object>> selOutAuditRecord(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return proOutAuditDao.selOutAuditRecord(map);
	}

	@Override
	public List selProDatails(String orderno) {
		return proOutAuditDao.selProDatails(orderno);
	}
	
}
