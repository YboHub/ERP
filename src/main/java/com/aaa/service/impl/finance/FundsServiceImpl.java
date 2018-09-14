package com.aaa.service.impl.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.finance.FundsDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.apauditor.FundsRecord;
import com.aaa.entity.apauditor.Procurement;
import com.aaa.entity.apauditor.PurchaseRecord;
import com.aaa.entity.finance.Funds;
import com.aaa.entity.purchase.PurOrder;
import com.aaa.service.finance.FundsService;

/** 
 * @类名称:  FundsServiceImpl 
 * @类描述:
 * @author  公子哥
 * @time    2018-7-31下午1:34:15
 * @version 1.0
 */
@Service
public class FundsServiceImpl implements FundsService {
	@Autowired
	private FundsDao fundsDao;
	@Override
	/***
	 * 获取总行数
	 * 采购拨款管理
	 */
	public int findCountByMap(Map<String, Object> map) {
		return fundsDao.findCountByMap(map);
	}
	/***
	 * 分页查询信息列表
	 * 采购拨款管理
	 */
	@Override
	public List<Map<String, Object>> selectFundsMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> fundsList = fundsDao.selectFundsMap(map);
		return fundsList;
	}
	/***
	 * 获取分页总行数
	 * 尾款结算
	 */
	@Override
	public List<Map<String, Object>> findCount1ByMap(Map<String, Object> map) {
		return fundsDao.findCount1ByMap(map);
	}
	/***
	 * 查新尾款结算信息列表
	 * 尾款结算
	 */
	@Override
	public List<Map<String, Object>> selectFinalMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows()*pageVo.getPage();
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> finalList = fundsDao.selectFinalMap(map);
		return finalList;
	}
	/***
	 * 修改状态
	 */
	@Override
	public int updatefunds(Funds funds) {
		return fundsDao.updatefunds(funds);
	}
	
	@Override
	public int toUpdate(PurchaseRecord purchaseRecord) {
		return fundsDao.toUpdate(purchaseRecord);
	}
	@Override
	public void insertPur(PurOrder purorder) {
		fundsDao.insertPur(purorder);
	}
	/**
	 * 查询拨款记录表
	 */
	@Override
	public int findCountByMapFundsRecord(Map<String, Object> map) {
		return fundsDao.findCountByMapFundsRecord(map);
	}
	@Override
	public List<Map<String, Object>> selectFundsRecordMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin",begin);
		map.put("end",end);
		return fundsDao.selectFundsRecordMap(map);
	}
	@Override
	public int toUpdateMoney(Procurement pro) {
		return fundsDao.toUpdateMoney(pro);
	}
	@Override
	public void insertFundsRecord(FundsRecord fundsRecord) {
		fundsDao.insertFundsRecord(fundsRecord);
	}
}
