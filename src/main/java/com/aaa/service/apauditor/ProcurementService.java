package com.aaa.service.apauditor;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
public interface ProcurementService {
	//审核
	int findCountByMap(Map<String, Object> map);
	//审核
	List<Map<String, Object>> selectProcurementMap(PageVo pageVo,Map<String, Object> map);
	
	List<Map<String, Object>> selectdetailsMap(String orderid);
	List<Procurement> selectPro(Integer id);
	int toUpdate(Procurement procurement);
	int tooUpdate(Procurement procurement);
	void insertPurchases(PurchaseRecord purchaseRecord);
	void insertPurchase(PurchaseRecord purchaseRecord);
}