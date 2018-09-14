package com.aaa.dao.apauditor;

import java.util.List;
import java.util.Map;

public interface PurchaseRecordDao {

	List<Map<String, Object>> selectPurchaseRecordMap(Map<String, Object> map);

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectdetailsMap(Integer orderid);

}
