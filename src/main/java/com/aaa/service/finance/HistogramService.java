package com.aaa.service.finance;

import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
import com.aaa.entity.finance.Disburse;
import com.aaa.entity.finance.Income;
import com.aaa.entity.finance.Profit;
/** 
 * @类名称:  HistogramService 
 * @类描述:	 收入,支出,利润,接口
 * @author  公子哥
 * @time    2018-7-30下午3:33:59
 * @version 1.0
 */
public interface HistogramService {

	int findCountByMap(Map<String, Object> map);
	
	int findCount1ByMap(Map<String, Object> map);
	
	List<Income> selectIncome(Income income);
	
	List<Income> selectProfit(Income income);

	List<Disburse> selectDisburse(Income income);
	
	List<Map<String, Object>> selectHistogram1Map(Map<String, Object> map);

	List<Map<String, Object>> selectHistogramMap(PageVo pageVo,Map<String, Object> map);

}
