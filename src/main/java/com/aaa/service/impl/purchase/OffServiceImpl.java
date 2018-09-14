/**
 * 
 */
package com.aaa.service.impl.purchase;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aaa.dao.purchase.OffDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.purchase.Offer;
import com.aaa.service.purchase.OffService;

/**
 * @类名称: OffServiceImpl
 * @描述类: 
 * @author: LiuJinYu
 * @time: 2018-7-28下午3:07:26
 * 
 */
@Service
public class OffServiceImpl implements OffService {

	@Autowired
	private OffDao offDao;
	@Override
	public int findCountByMap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return offDao.findCountByMap(map);
	}

	
	@Override
	public List<Map<String, Object>> selectOff(PageVo pagevo,Map<String, Object> map) {
		int begin=pagevo.getRows()*(pagevo.getPage()-1);
		int end=pagevo.getRows()*pagevo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		return offDao.selectOff(map);
	}


	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.OffService#addOff(com.aaa.entity.Offer)
	 */
	@Override
	public int addOff(Offer off) {
		// TODO Auto-generated method stub
		return offDao.addOff(off);
	}

	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.OffService#selectOffbiao(com.aaa.entity.Offer)
	 */
	@Override
	public List<Offer> selectOffbiao(Offer off) {
		// TODO Auto-generated method stub
		return offDao.selectOffbiao(off);
	}


	/* (non-Javadoc)
	 * @see com.aaa.service.purchase.OffService#updateOff(com.aaa.entity.Offer)
	 */
	@Override
	public int updateOff(Offer off) {
		
		return offDao.updateOff(off);
	}

	@Override
	public int deleteOff(Offer off) {
		// TODO Auto-generated method stub
		return offDao.deleteOff(off);
	}

}
