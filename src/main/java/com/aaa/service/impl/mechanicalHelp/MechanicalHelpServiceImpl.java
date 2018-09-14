package com.aaa.service.impl.mechanicalHelp;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.dao.mechanicalHelp.MechanicalHelpDao;
import com.aaa.entity.PageVo;
import com.aaa.entity.mechanicalHelp.MechanicalHelp;
import com.aaa.service.mechanicalHelp.MechanicalHelpService;
/**
 * 类名称：MechanicalHelpServiceImpl
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:26:56
 * @version
 */
@Service
public class MechanicalHelpServiceImpl implements MechanicalHelpService{
	@Autowired
	private MechanicalHelpDao mechanicalHelpDao;

	@Override
	public int findCountByMap(Map<String, Object> map) {
		return mechanicalHelpDao.findCountByMap(map);
	}

	@Override
	public List<Map<String, Object>> selectMechanicalHelpMap(PageVo vo,Map<String, Object> map) {
		int begin = vo.getRows()*(vo.getPage()-1);
		int end = vo.getRows()*vo.getPage()+1;
		map.put("begin", begin);
		map.put("end", end);
		List<Map<String,Object>> mechanicalHelpList = mechanicalHelpDao.selectMechanicalHelpMap(map);
		return mechanicalHelpList;
	}

	@Override
	public int save(MechanicalHelp mechanicalHelp) {
		return mechanicalHelpDao.save(mechanicalHelp);
	}
}
