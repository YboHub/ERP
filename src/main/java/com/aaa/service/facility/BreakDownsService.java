package com.aaa.service.facility;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.facility.BreakDowns;
/**
 * 类名称：BreakDownsService
 * 类描述：实现类  业务层
 * 创建人：wangsongkang
 * 创建时间：2018-8-15 
 * @version
 */
public interface BreakDownsService {
	/**
	 * 
	 * @param map
	 * @return
	 */
	int findCountBybreakDowns(Map<String, Object> map);
	/**
	 * 查询列表信息
	 * @param pageVo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectBreakDownsMap(PageVo pageVo,Map<String, Object> map);
	/**
	 * 查询下拉款信息
	 * @param breakDowns
	 * @return
	 */
	List<Map> selectBreakDowns(BreakDowns breakDowns);
	/**
	 * 获取单号
	 * @return
	 */
	String breakDowns();
	/**
	 * 新增保存
	 * @param breakDowns
	 * @return
	 */
	int save(BreakDowns breakDowns);

}
