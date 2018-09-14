package com.aaa.service.impl.apauditor;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.apauditor.PurchaseRecordDao;
import com.aaa.entity.PageVo;
import com.aaa.service.apauditor.PurchaseRecordService;
@Service
public class PurchaseRecordServiceImpl implements PurchaseRecordService {
	@Autowired
	private PurchaseRecordDao purchasePecordDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return purchasePecordDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectPurchaseRecordMap(PageVo pageVo,
			Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return purchasePecordDao.selectPurchaseRecordMap(map);
	}

	@Override
	public List<Map<String, Object>> selectdetailsMap(Integer orderid) {
		return purchasePecordDao.selectdetailsMap(orderid);
	}
}
