package com.aaa.dao.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.finance.Disburse;
import com.aaa.entity.finance.Income;
import com.aaa.entity.finance.Profit;

/** 
 * @类名称:  HistogramDao 
 * @类描述:  收入支出利润接口
 * @author  公子哥
 * @time    2018-7-30下午3:32:48
 * @version 1.0
 */
public interface HistogramDao {

	int findCountByMap(Map<String, Object> map);
	
	int findCount1ByMap(Map<String, Object> map);
	
	List<Income> selectIncome(Income income);

	List<Disburse> selectDisburse(Income income);

	List<Income> selectProfit(Income income);

	List<Map<String, Object>> selectHistogramMap(Map<String, Object> map);

	List<Map<String, Object>> selectHistogram1Map(Map<String, Object> map);

}
