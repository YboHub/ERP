package com.aaa.service.impl.lsh;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.lsh.ProRecordDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.warehouseentity.StockManager;
import com.aaa.service.lsh.ProRecordService;
import com.aaa.utils.GenerateNumber;
import com.aaa.utils.NowTimeUtil;
@Service
public class ProRecordServiceImpl implements ProRecordService {
	@Autowired
	private ProRecordDao proRecordDao;

	@Override
	public int getAllCount(Map<String, Object> map) {
		return proRecordDao.getAllCount(map);
	}

	@Override
	public List<Map<String, Object>> selectAllProRecord(PageVo pageVo,Map<String, Object> map) {
		int begin=pageVo.getRows()*(pageVo.getPage()-1);
		if(begin<0){
			begin=0;
		}
		int end=pageVo.getRows();
		map.put("begin", begin);
		map.put("end", end);
		return proRecordDao.selectAllProRecord(map);
	}
 
	@Override
	public boolean toSaveProRecord(HttpSession session,String[] types,
			Double[] weights, int[] nums,String dnumber) {
		boolean b=true;
		StockManager stockManager=new StockManager();
		String protime=NowTimeUtil.newTime();
		String prefix="p";
		String propeople=(String) session.getAttribute("ename");
		for (int i = 0; i < types.length; i++) {
			String sno=proRecordDao.getLastProductionnum();
			String productionnum=GenerateNumber.generaterNextNumber(sno, prefix);
			String goodstype=types[i];
			Double inventoryunit=weights[i];
			int cid=nums[i];
			stockManager.setProductionnum(productionnum);
			stockManager.setGoodstype(goodstype);
			stockManager.setInventoryunit(inventoryunit);
			stockManager.setCid(cid);
			stockManager.setProtime(protime);
			stockManager.setPropeople(propeople);
			stockManager.setDnumber(dnumber);
			int row=proRecordDao.toSaveProRecord(stockManager);
			if (row>0) {
				continue;
			}else{
				b=false;
				break;
			}
		}
		return b;
	}

	@Override
	public List<Map<String, Object>> selectAllCapacity(Integer id) {
		return proRecordDao.selectAllCapacity(id);
	}

	@Override
	public List<Map<String, Object>> getDoodsType() {
		return proRecordDao.getDoodsType();
	}


}
