package com.aaa.service.impl.facility;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.facility.ScrapApplyDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.facility.ScrapApply;
import com.aaa.service.facility.ScrapApplyService;
/**
 * 类名称：ScrapApplyServiceImpl
 * 类描述： 实现类 业务层
 * 创建人：wangsongkang
 * 创建时间：2018-8-16 
 * @version
 */
@Service
public class ScrapApplyServiceImpl implements ScrapApplyService{
	@Autowired
	private ScrapApplyDao scrapApplyDao;
	
	@Override
	public int findCountByscrapApply(Map<String, Object> map) {
		return scrapApplyDao.findCountByscrapApply(map);
	}
	/**
	 * PageVo
	 * rows 5一页显示多少条
	 * page 1 当前第几页
	 * sort sid 排序字段
	 * order desc 升序  降序
	 */
	@Override
	public List<Map<String, Object>> selectScrapApplyMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);// 第一页0 第二页5
		int end = vo.getRows()*vo.getPage()+1;//第一页6  第二页5*2+1
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> scrapApplyList = scrapApplyDao.selectScrapApplyMap(map);
		return scrapApplyList;
	}
	/**
	 * 获取单号
	 */
	@Override
	public String scrapApply() {
		return scrapApplyDao.scrapApply();
	}
	/**
	 * 新增保存
	 */
	@Override
	public int save(ScrapApply scrapApply) {
		return scrapApplyDao.save(scrapApply);
	}
	/**
	 * 审核
	 */
	@Override
	public List<ScrapApply> selectScrapApply(ScrapApply scrapApply) {
		return scrapApplyDao.selectScrapApply(scrapApply);
	}
	/**
	 * 审核 通过
	 */
	@Override
	public int updateScrapApply(ScrapApply scrapApply) {
		return scrapApplyDao.updateScrapApply(scrapApply);
	}
	/**
	 * 审核 不通过
	 */
	@Override
	public int noupdateScrapApply(ScrapApply scrapApply) {
		return scrapApplyDao.noupdateScrapApply(scrapApply);
	}
	/**
	 * 跳转修改页面
	 */
	@Override
	public List<ScrapApply> toEdit(ScrapApply scrapApply) {
		return scrapApplyDao.toEdit(scrapApply);
	}
	/**
	 * 修改保存
	 */
	@Override
	public int saveUpdate(ScrapApply scrapApply) {
		return scrapApplyDao.saveUpdate(scrapApply);
	}
}
