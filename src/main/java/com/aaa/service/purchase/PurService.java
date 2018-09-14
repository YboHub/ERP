/**
 * 
 */
package com.aaa.service.purchase;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.purchase.MaterialReturn;
import com.aaa.entity.purchase.PurOrder;

/**
 * @类名称: PurService
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-27上午9:31:59
 * 
 */
public interface PurService {

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
	List<Map<String, Object>> selectPur(PageVo pagevo, Map<String, Object> map);

	/**
	 * @param pro
	 * @return
	 */
	int edit(Procurement pro);

	/**
	 * @return
	 */
	List<Map<String, Object>> getBMName();

	/**
	 * @param goodsname
	 * @return
	 */
	List<Map<String, Object>> getSpecificate(String goodsname);

	/**
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> agetSpecificate(Map<String, Object> map);

	/**
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> aagetSpecificate(Map<String, Object> map);

	/**
	 * @param orderid
	 * @param goodsname
	 * @param types
	 * @param company
	 * @param price
	 * @param weights
	 * @param money
	 */
	int addPurOff(String orderid, String[] goodsname, String[] types,
			String[] company, Double[] price, Double[] weights, Double[] money);

	/**
	 * @param purOrd
	 * @param goodsname
	 * @param types
	 * @param company
	 * @param price
	 * @param weights
	 * @param money
	 * @return
	 */
	int addPurOff(PurOrder purOrd, String[] goodsname, String[] types,
			String[] company, Double[] price, Double[] weights, Double[] money);

	/**
	 * @param purOrder
	 * @return
	 */
	int addPurOff(PurOrder purOrder);

	/**
	 * @param pro
	 * @return
	 */
	int addP(Procurement pro);

	/**
	 * @param orderid
	 * @return
	 */
	List<Map<String, Object>> selectOrder(String orderid);

	/**
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> selectOrderOne(String id);

	/**
	 * @param id
	 * @return
	 */
	int deleteOne(long id);

	/**
	 * @param id
	 * @return
	 */
	int delete(String id);

	/**
	 * @param id
	 * @return
	 */
	int deleteTwo(String id);

	/**
	 * @return
	 */
	List<Map<String, Object>> selectProduction();

	/**
	 * @return
	 */
	String purductionList();

	/**
	 * @return
	 */
	List<Map<String, Object>> selectPlanNum();

	/**
	 * @param pur
	 * @return
	 */

	List<PurOrder> updatedetalisONe(PurOrder pur);

	/**
	 * @param pur
	 * @return
	 */
	int updateDetalis(PurOrder pur);

	/**
	 * @param pro
	 */
	int detailToBuy(Procurement pro);

	/**
	 * @param pur
	 */
	int detailToBuyOne(PurOrder pur);

	/**
	 * @param orderid
	 * @return
	 */
	List<Map<String, Object>> selectOrderReturn(String orderid);

	/**
	 * @param pur
	 * @return
	 */
	List<PurOrder> selectOrderReturnOne(PurOrder pur);

	/**
	 * @param purOrder
	 */
	int insert(PurOrder purOrder);

}
