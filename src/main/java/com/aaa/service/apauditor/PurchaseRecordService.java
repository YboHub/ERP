package com.aaa.service.apauditor;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;

public interface PurchaseRecordService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectPurchaseRecordMap(PageVo pageVo,Map<String, Object> map);

	List<Map<String, Object>> selectdetailsMap(Integer orderid);

	
}
