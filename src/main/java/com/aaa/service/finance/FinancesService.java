package com.aaa.service.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.finance.Finances;

/** 
 * @类名称:  FinanceServices 
 * @类描述:	
 * @author  公子哥
 * @time    2018-7-27上午8:39:08
 * @version 1.0
 */
public interface FinancesService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectFinancesMap(PageVo pageVo,Map<String, Object> map);

}
