/**
 * 
 */
package com.aaa.service.purchase;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.purchase.Offer;

/**
 * @类名称: OffService
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-28下午3:06:51
 * 
 */
public interface OffService {

	/**
	 * @param map
	 * @return
	 */
	int findCountByMap(Map<String, Object> map);

	/**
	 * @param pagevo
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectOff(PageVo pagevo, Map<String, Object> map);

	/**
	 * @param off
	 * @return
	 */
	int addOff(Offer off);

	/**
	 * @param off
	 * @return
	 */
	List<Offer> selectOffbiao(Offer off);

	/**
	 * @param off
	 * @return
	 */
	int updateOff(Offer off);

	/**
	 * @param off
	 * @return
	 */
	int deleteOff(Offer off);

}
