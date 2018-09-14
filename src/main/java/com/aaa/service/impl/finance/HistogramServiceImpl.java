package com.aaa.service.impl.finance;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.finance.HistogramDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.finance.Disburse;
import com.aaa.entity.finance.Income;
import com.aaa.entity.finance.Profit;
import com.aaa.service.finance.HistogramService;

/** 
 * @类名称:  HistogramServiceImpl 
 * @类描述:
 * @author  公子哥
 * @time    2018-7-30下午3:34:27
 * @version 1.0
 */
@Service
public class HistogramServiceImpl implements HistogramService {
	@Autowired
	private HistogramDao histogramDao;
	/***
	 * 获得分页总行数
	 */
	@Override
	public int findCountByMap(Map<String, Object> map) {
		return histogramDao.findCountByMap(map);
	}
	/***
	 * 查询月份利润信息
	 */
	@Override
	public List<Map<String, Object>> selectHistogramMap(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		int end = pageVo.getRows()*pageVo.getPage();
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> histogramList = histogramDao.selectHistogramMap(map);
		return histogramList;
	}
	/***
	 * 获得总行数
	 */
	@Override
	public int findCount1ByMap(Map<String, Object> map) {
		return histogramDao.findCount1ByMap(map);
	}
	/***
	 * 查询年利润列表信息
	 */
	@Override
	public List<Map<String, Object>> selectHistogram1Map(
			Map<String, Object> map) {
		List<Map<String,Object>> histogram1List = histogramDao.selectHistogram1Map(map);
		return histogram1List;
	}
	/***
	 * 查询收情况入
	 */
	@Override
	public List<Income> selectIncome(Income income) {
		return histogramDao.selectIncome(income);
	}
	/***
	 * 查询支出情况
	 */
	@Override
	public List<Disburse> selectDisburse(Income income) {
		return histogramDao.selectDisburse(income);
	}
	/***
	 * 查询利润
	 */
	@Override
	public List<Income> selectProfit(Income income) {
		return histogramDao.selectProfit(income);
	}
}
