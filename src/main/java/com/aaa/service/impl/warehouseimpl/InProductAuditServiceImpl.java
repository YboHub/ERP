package com.aaa.service.impl.warehouseimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.warehousedao.InProductAuditDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.warehouseservice.InProductAuditService;
@Service
@SuppressWarnings("all")
public class InProductAuditServiceImpl implements InProductAuditService {
	@Autowired
	private InProductAuditDao inProductAudit;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return inProductAudit.findCountByMap(map);
	}
	@Override
	public List<Map<String, Object>> selectAllInpro(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return inProductAudit.selectAllInpro(map);
	}

	@Override
	public int findCountByMapOne(Map<String, Object> map) {
		return inProductAudit.findCountByMapOne(map);
	}

	@Override
	public List<Map<String, Object>> selectAllDetails(PageVo pageVo,Map<String, Object> map) {
		int begin = pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end = pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return inProductAudit.selectAllDetails(map);
	}
	
	
	@Override
	public List<Map> productAudit(StockManager stockManager) {
		return inProductAudit.productAudit(stockManager);
	}
	/**
	 * 保存通过审核
	 */
	@Override
	public int savepassVerification(StockManager stockManager) {
		return inProductAudit.savepassVerification(stockManager);
	}
	@Override
	public int savepassVerificationtwo(StockManager stockManager) {
		return inProductAudit.savepassVerificationtwo(stockManager);
	}
	/**
	 * 成品审核驳回
	 */
	@Override
	public int failedPass(StockManager stockManager) {
		return inProductAudit.failedPass(stockManager);
	}

	@Override
	public int insertWaste(StockManager stockManager) {
		return inProductAudit.insertWaste(stockManager);
	}
	@Override
	public String rukudanhao() {
		return inProductAudit.rukudanhao();
	}
	@Override
	public String rkdhScrip() {
		return inProductAudit.rkdhScrip();
	}
	@Override
	public void selectStockById(Integer id) {
		 inProductAudit.selectStockById(id);
	}
	/**
	 * 查询废品总量
	 */
	@Override
	public Double selectZong() {
		return inProductAudit.selectZong();
	}
	/**
	 * 添加废品总量
	 */
	@Override
	public void addFeiPZong(StockManager stockManager) {
		inProductAudit.addFeiPZong(stockManager);
	}

}
