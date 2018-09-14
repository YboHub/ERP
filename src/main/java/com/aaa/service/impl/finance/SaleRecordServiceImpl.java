package com.aaa.service.impl.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.finance.SaleRecordDao;
import com.aaa.entity.PageVo;
import com.aaa.service.finance.SaleRecordService;

/** 
 * @类名称:  SaleRecordServiceImpl 
 * @类描述:	 销售记录统计管理
 * @author  公子哥
 * @time    2018-7-31下午7:25:07
 * @version 1.0
 */
@Service
public class SaleRecordServiceImpl implements SaleRecordService {
	@Autowired
	private SaleRecordDao saleRecordDao;
	/***
	 * 获取总行数
	 * 销售记录统计管理
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		List<Map> list=saleRecordDao.findContByMap(map);
		int allrow=list.size();
		return allrow;
	}
	/***
	 * 销售记录统计管理
	 * 分页查询销售记录信息列表
	 */
	@Override
	public List<Map<String, Object>> selectSaleRecordMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>>saleRecordList = saleRecordDao.selectSaleRecordMap(map);
		return saleRecordList;
	}
}
