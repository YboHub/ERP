package com.aaa.service.facility;

import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
/**
 * 类名称：ScrapRecordsService
 * 类描述： 实现类业务层
 * 创建人：wangsongkang
 * 创建时间：2018-8-10 
 * @version
 */
public interface ScrapRecordsService {
	/**
	 * 
	 * @param map
	 * @return
	 */
	int findCountByscrapRecords(Map<String, Object> map);
	/**
	 * 查询列表信息
	 * @param pageVo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectScrapRecordsMap(PageVo pageVo,Map<String, Object> map);

}
