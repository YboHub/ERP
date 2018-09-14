package com.aaa.dao.purchase;

import java.util.List;
import java.util.Map;

import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.purchase.MaterialReturn;
import com.aaa.entity.purchase.PurOrder;

/**
 * @类名称: PurDao
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-27上午9:37:00
 * 
 */
@SuppressWarnings("all")
public interface PurDao {

	/**
	 * @param map
	 * @return
	 */
	int findCountByMap(Map<String, Object> map);

	/**
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectPur(Map<String, Object> map);

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
	 * @return
	 */
	int addPurOff(String orderid, String[] goodsname, String[] types,
			String[] company, Double[] price, Double[] weights, Double[] money);

	/**
	 * @param map
	 * @return
	 */
	int addPurOff(Map<String, Object> map);

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
	 * @return
	 */
	int detailToBuy(Procurement pro);

	/**
	 * @param pur
	 * @return
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
	 * @return
	 */
	int insert(PurOrder purOrder);

}
