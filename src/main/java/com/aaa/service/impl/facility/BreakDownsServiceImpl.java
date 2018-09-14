package com.aaa.service.impl.facility;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.facility.BreakDownsDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.facility.BreakDowns;
import com.aaa.service.facility.BreakDownsService;
/**
 * 类名称：BreakDownsServiceImpl
 * 类描述：实现类 业务层 
 * 创建人：wangsongkang
 * 创建时间：2018-8-15 
 * @version
 */
@Service
public class BreakDownsServiceImpl implements BreakDownsService{
	@Autowired
	private BreakDownsDao breakDownsDao;

	@Override
	public int findCountBybreakDowns(Map<String, Object> map) {
		return breakDownsDao.findCountBybreakDowns(map);
	}
	/**
	 * PageVo
	 * rows 5一页显示多少条
	 * page 1 当前第几页
	 * sort bid 排序字段
	 * order desc 升序  降序
	 */
	@Override
	public List<Map<String, Object>> selectBreakDownsMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);// 第一页0 第二页5
		int end = vo.getRows()*vo.getPage()+1;//第一页6  第二页5*2+1
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> breakDownsList = breakDownsDao.selectBreakDownsMap(map);
		return breakDownsList;
	}
	/**
	 * 查询下拉框信息
	 */
	@Override
	public List<Map> selectBreakDowns(BreakDowns breakDowns) {
		return breakDownsDao.selectBreakDowns(breakDowns);
	}
	/**
	 * 获取单号
	 */
	@Override
	public String breakDowns() {
		return breakDownsDao.breakDowns();
	}
	/**
	 * 新增保存
	 */
	@Override
	public int save(BreakDowns breakDowns) {
		return breakDownsDao.save(breakDowns);
	}
}
