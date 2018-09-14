package com.aaa.service.impl.facility;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.facility.ScrapRecordsDao;
import com.aaa.entity.PageVo;
import com.aaa.service.facility.ScrapRecordsService;
/**
 * 类名称：ScrapRecordsImpl
 * 类描述： 实现类业务层
 * 创建人：wangsongkang
 * 创建时间：2018-8-10 
 * @version
 */
@Service
public class ScrapRecordsServiceImpl implements ScrapRecordsService{
	@Autowired
	private ScrapRecordsDao scrapRecordsDao;
	
	@Override
	public int findCountByscrapRecords(Map<String, Object> map) {
		return scrapRecordsDao.findCountByscrapRecords(map);
	}
	/**
	 * PageVo
	 * rows 5一页显示多少条
	 * page 1 当前第几页
	 * sort sid 排序字段
	 * order desc 升序  降序
	 */
	@Override
	public List<Map<String, Object>> selectScrapRecordsMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);// 第一页0 第二页5
		int end = vo.getRows()*vo.getPage()+1;//第一页6  第二页5*2+1
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> scrapRecordsLists = scrapRecordsDao.selectScrapRecordsMap(map);
		return scrapRecordsLists;
	}
}
