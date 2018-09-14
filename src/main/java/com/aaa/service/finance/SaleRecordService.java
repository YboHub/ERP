package com.aaa.service.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;

/** 
 * @类名称:  SaleRecordService 
 * @类描述:	销售记录统计管理接口
 * @author  公子哥
 * @time    2018-7-31下午7:24:37
 * @version 1.0
 */
public interface SaleRecordService {

	/***
	 * 销售记录统计管理
	 * 获取分页总行数
	 */
	int findCountByMap(Map<String, Object> map);

	/***
	 * 销售记录统计管理
	 * 查询销售记录列表信息
	 */
	List<Map<String, Object>> selectSaleRecordMap(PageVo pageVo,Map<String, Object> map);
	
}
