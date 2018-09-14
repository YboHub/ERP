package com.aaa.dao.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.apauditor.FundsRecord;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.entity.finance.Funds;
import com.aaa.entity.purchase.PurOrder;

/** 
 * @类名称:  FundsDao 
 * @类描述:	 接口
 * @author  公子哥
 * @time    2018-7-31下午1:32:48
 * @version 1.0
 */
public interface FundsDao {

	int updatefunds(Funds funds);
	
	int toUpdateMoney(Procurement pro);

	int toUpdate(PurchaseRecord purchaseRecord);
	
	int findCountByMap(Map<String, Object> map);

	int findCountByMapFundsRecord(Map<String, Object> map);
	
	void insertPur(PurOrder purorder);
	
	List<Map<String, Object>> selectFundsMap(Map<String, Object> map);

	List<Map<String, Object>> findCount1ByMap(Map<String, Object> map);

	List<Map<String, Object>> selectFinalMap(Map<String, Object> map);

	List<Map<String, Object>> selectFundsRecordMap(Map<String, Object> map);

	void insertFundsRecord(FundsRecord fundsRecord);

}
