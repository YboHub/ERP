package com.aaa.service.warehouseservice;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;
@SuppressWarnings("all")
public interface InProductAuditService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllInpro(PageVo pageVo,Map<String, Object> map);

	int findCountByMapOne(Map<String, Object> map);

	List<Map<String, Object>> selectAllDetails(PageVo pageVo,Map<String, Object> map);

	
	List<Map> productAudit(StockManager stockManager);

	int savepassVerification(StockManager stockManager);

	int savepassVerificationtwo(StockManager stockManager);

	int failedPass(StockManager stockManager);

	int insertWaste(StockManager stockManager);

	String rukudanhao();

	String rkdhScrip();

	void selectStockById(Integer id);

	Double selectZong();

	void addFeiPZong(StockManager stockManager);
}
