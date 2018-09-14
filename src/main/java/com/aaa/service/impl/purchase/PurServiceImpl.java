package com.aaa.service.impl.purchase;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.purchase.PurDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.purchase.MaterialReturn;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.purchase.PurService;

/**
 * @类名称: PurServiceImpl
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-27上午9:34:39
 * 
 */
@Service
@SuppressWarnings("all")
public class PurServiceImpl implements PurService {

	@Autowired
	private PurDao purDao;
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return purDao.findCountByMap(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPur(PageVo pagevo,Map<String, Object> map) {
		int begin=pagevo.getRows()*(pagevo.getPage()-1);
		int end=pagevo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return purDao.selectPur(map);
	}

	@Override
	public List<Map<String, Object>> getBMName() {
		return purDao.getBMName();
	}

	@Override
	public List<Map<String, Object>> getSpecificate(String goodsname) {
		return purDao.getSpecificate(goodsname);
	}

	@Override
	public List<Map<String, Object>> agetSpecificate(Map<String, Object> map) {
		return purDao.agetSpecificate(map);
	}


	@Override
	public List<Map<String, Object>> aagetSpecificate(Map<String, Object> map) {
		return purDao.aagetSpecificate(map);
	}

	@Override
	public int addPurOff(String orderid, String[] goodsname, String[] types,
			String[] company, Double[] price, Double[] weights, Double[] money) {
		 return purDao.addPurOff(orderid,goodsname,types,company,price,weights,money);
	}

	
	@Override
	public int addPurOff(PurOrder purOrd, String[] goodsname, String[] types,
			String[] company, Double[] price, Double[] weights, Double[] money) {
		return 0;
	}

	
	@Override
	public int addPurOff(PurOrder purOrder) {
		return purDao.addPurOff(purOrder);
	}

	@Override
	public int addP(Procurement pro) {
		return purDao.addP(pro);
	}

	
	@Override
	public List<Map<String, Object>> selectOrder(String orderid) {
		return purDao.selectOrder(orderid);
	}

	
	@Override
	public List<Map<String, Object>> selectOrderOne(String id) {
		return purDao.selectOrderOne(id);
	}

	
	@Override
	public int deleteOne(long id) {
		return purDao.deleteOne(id);
	}

	
	@Override
	public int delete(String id) {
		return purDao.delete(id);
	}

	@Override
	public int deleteTwo(String id) {
		
		return purDao.deleteTwo(id);
	}

	@Override
	public int edit(Procurement pro) {
		
		return purDao.edit(pro);
	}

	@Override
	public List<Map<String, Object>> selectProduction() {
		return purDao.selectProduction();
	}

	
	@Override
	public String purductionList() {
	
		return purDao.purductionList();
	}

	@Override
	public List<Map<String, Object>> selectPlanNum() {

		return purDao.selectPlanNum();
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.PurService#updatedetalisONe(java.lang.String)
	 */
	
	@Override
	public List<PurOrder> updatedetalisONe(PurOrder pur) {
		return purDao.updatedetalisONe(pur);
	}

	@Override
	public int updateDetalis(PurOrder pur) {
		return purDao.updateDetalis(pur);
	}

	@Override
	public int detailToBuy(Procurement pro) {
		
		return purDao.detailToBuy(pro);
	}

	@Override
	public int detailToBuyOne(PurOrder pur) {
		return purDao.detailToBuyOne(pur);
	}

	@Override
	public List<Map<String, Object>> selectOrderReturn(String orderid) {
		
		return purDao.selectOrderReturn(orderid);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.PurService#selectOrderReturnOne(java.lang.String)
	 */
	@Override
	public List<PurOrder> selectOrderReturnOne(PurOrder pur) {
		
		return purDao.selectOrderReturnOne(pur);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.PurService#insert(com.aaa.entity.purchase.MaterialReturn)
	 */
	@Override
	public int insert(PurOrder purOrder) {
		
		return purDao.insert(purOrder);
	}


	

}
