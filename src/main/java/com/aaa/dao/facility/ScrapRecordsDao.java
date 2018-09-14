package com.aaa.dao.facility;

import java.util.List;
import java.util.Map;
/**
 * 类名称：ScrapRecordsDao
 * 类描述： 实现类
 * 创建人：wangsongkang
 * 创建时间：2018-8-10 
 * @version
 */
public interface ScrapRecordsDao {
	/**
	 * 
	 * @param map
	 * @return
	 */
	int findCountByscrapRecords(Map<String, Object> map);
	/**
	 * 查询列表信息
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectScrapRecordsMap(Map<String, Object> map);

}
