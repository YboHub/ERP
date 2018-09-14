package com.aaa.dao.warehousedao;

import java.util.List;
import java.util.Map;

import com.aaa.entity.warehouseentity.StockManager;
@SuppressWarnings("all")
public interface InProductAuditDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllInpro(Map<String, Object> map);

	int findCountByMapOne(Map<String, Object> map);

	List<Map<String, Object>> selectAllDetails(Map<String, Object> map);


	List<Map> productAudit(StockManager stockManager);

	int savepassVerification(StockManager stockManager);

	int savepassVerificationtwo(StockManager stockManager);

	int failedPass(StockManager stockManager);

	int insertWaste(StockManager stockManager);

	String rukudanhao();

	String rkdhScrip();


	Double selectZong();

	void selectStockById(Integer id);

	void addFeiPZong(StockManager stockManager);

}
