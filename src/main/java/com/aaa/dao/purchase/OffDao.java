/**
 * 
 */
package com.aaa.dao.purchase;

import java.util.List;
import java.util.Map;

import com.aaa.entity.purchase.Offer;

/**
 * @类名称: OffDao
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-28下午3:07:47
 * 
 */
public interface OffDao {

	/**
	 * @param map
	 * @return
	 */
	int findCountByMap(Map<String, Object> map);

	/**
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectOff(Map<String, Object> map);

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
