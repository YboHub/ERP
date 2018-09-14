package com.aaa.service.facility;

import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
import com.aaa.entity.facility.ScrapApply;
/**
 * 类名称：ScrapApplyService
 * 类描述： 实现类 业务层
 * 创建人：wangsongkang
 * 创建时间：2018-8-16 
 * @version
 */
public interface ScrapApplyService {
	/**
	 * 
	 * @param map
	 * @return
	 */
	int findCountByscrapApply(Map<String, Object> map);
	/**
	 * 查询列表信息
	 * @param pageVo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectScrapApplyMap(PageVo pageVo,Map<String, Object> map);
	/**
	 * 获取单号
	 * @return
	 */
	String scrapApply();
	/**
	 * 新增保存
	 * @param scrapApply
	 * @return
	 */
	int save(ScrapApply scrapApply);
	/**
	 * 审核
	 * @param scrapApply
	 * @return
	 */
	List<ScrapApply> selectScrapApply(ScrapApply scrapApply);
	/**
	 * 审核 通过
	 * @param scrapApply
	 * @return
	 */
	int updateScrapApply(ScrapApply scrapApply);
	/**
	 * 审核 不通过
	 * @param scrapApply
	 * @return
	 */
	int noupdateScrapApply(ScrapApply scrapApply);
	/**
	 * 跳转修改页面
	 * @param scrapApply
	 * @return
	 */
	List<ScrapApply> toEdit(ScrapApply scrapApply);
	/**
	 * 修改保存
	 * @param scrapApply
	 * @return
	 */
	int saveUpdate(ScrapApply scrapApply);

}
