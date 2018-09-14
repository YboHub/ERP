package com.aaa.service.impl.apauditor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.apauditor.ProcurementDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.service.apauditor.ProcurementService;
@Service
public class ProcurementServiceImpl implements ProcurementService {
	@Autowired
	private ProcurementDao procurementDao;
	/**
	 * 查询总行数
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return procurementDao.findCountByMap(map);
	}
	/**
	 * 查询数据分页
	 */
	@Override
	public List<Map<String, Object>> selectProcurementMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return procurementDao.selectProcurementMap(map);
	}
	
	@Override
	public List<Map<String, Object>> selectdetailsMap(String orderid) {
		return procurementDao.selectdetailsMap(orderid);
	}
	@Override
	public List<Procurement> selectPro(Integer id) {
		return procurementDao.selectPro(id);
	}
	@Override
	public int toUpdate(Procurement procurement) {
		return procurementDao.toUpdate(procurement);
	}
	@Override
	public int tooUpdate(Procurement procurement) {
		return procurementDao.tooUpdate(procurement);
	}
	@Override
	public void insertPurchases(PurchaseRecord purchaseRecord) {
		procurementDao.insertPurchases(purchaseRecord);
	}
	@Override
	public void insertPurchase(PurchaseRecord purchaseRecord) {
		procurementDao.insertPurchase(purchaseRecord);
	}

}
