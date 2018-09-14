package com.aaa.dao.finance;

import java.util.List;
import java.util.Map;

import com.aaa.entity.finance.Finances;

/** 
 * @类名称:  FinancesDao 
 * @类描述:	 财务Dao接口
 * @author  公子哥
 * @time    2018-7-27上午8:38:14
 * @version 1.0
 */
public interface FinancesDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectFinancesMap(Map<String, Object> map);

}
