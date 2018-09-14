package com.aaa.service.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.FundsRecord;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.entity.finance.Funds;
import com.aaa.entity.purchase.PurOrder;

/** 
 * @类名称:  FundsService 
 * @类描述:	 采购拨款,尾款结算,采购拨款记录接口
 * @author  公子哥
 * @time    2018-7-31下午1:33:49
 * @version 1.0
 */
public interface FundsService {

	int updatefunds(Funds funds);
	
	int toUpdateMoney(Procurement pro);
	
	int findCountByMap(Map<String, Object> map);
	
	int toUpdate(PurchaseRecord purchaseRecord);
	
	int findCountByMapFundsRecord(Map<String, Object> map);
	
	void insertPur(PurOrder purorder);
	
	List<Map<String, Object>> findCount1ByMap(Map<String, Object> map);

	List<Map<String, Object>> selectFundsMap(PageVo pageVo,Map<String, Object> map);

	List<Map<String, Object>> selectFinalMap(PageVo pageVo,Map<String, Object> map);

	List<Map<String, Object>> selectFundsRecordMap(PageVo pageVo,Map<String, Object> map);

	void insertFundsRecord(FundsRecord fundsRecord);

}
