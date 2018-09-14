package com.aaa.dao.finance;

import java.util.List;
import java.util.Map;

/** 
 * @类名称:  SaleRecordDao 
 * @类描述:	 销售记录统计管理接口
 * @author  公子哥
 * @time    2018-7-31下午7:23:34
 * @version 1.0
 */
public interface SaleRecordDao {

	List<Map> findContByMap(Map<String, Object> map);

	List<Map<String, Object>> selectSaleRecordMap(Map<String, Object> map);

}
