
package com.aaa.dao.apauditor;

import java.util.List;
import java.util.Map;

import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;

public interface ProcurementDao {
	//获取审核总行数
	int findCountByMap(Map<String, Object> map);
	//查询审核数据  分页
	List<Map<String, Object>> selectProcurementMap(Map<String, Object> map);
	// 查询详情
	List<Map<String, Object>> selectdetailsMap(String orderid);
	//查询procurement状态 理由
	List<Procurement> selectPro(Integer id);
	//同意按钮修改状态 理由
	int toUpdate(Procurement procurement);
	//不同意按钮修改状态 理由
	int tooUpdate(Procurement procurement);
	void insertPurchases(PurchaseRecord purchaseRecord);
	void insertPurchase(PurchaseRecord purchaseRecord);

}
