package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.sell.OrderDetail;
import com.aaa.entity.sell.OrderInfo;

public interface ProOutAuditService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selOutAuditDetails(PageVo pageVo,Map<String, Object> map);

	List<Map> proOutAudit(OrderDetail orderDetail);

	int savepassProOut(OrderInfo orderInfo);


	int cprkbh(OrderInfo orderInfo);

	int findCountByMapOne(Map<String, Object> map);

	List<Map<String, Object>> selOutAuditRecord(PageVo pageVo,Map<String, Object> map);

	List selProDatails(String orderno);

}
