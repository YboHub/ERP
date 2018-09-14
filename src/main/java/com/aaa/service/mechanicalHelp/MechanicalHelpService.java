package com.aaa.service.mechanicalHelp;
import java.util.List;
import java.util.Map;
import com.aaa.entity.PageVo;
import com.aaa.entity.mechanicalHelp.MechanicalHelp;
/**
 * 类名称：MechanicalHelpService
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:26:38
 * @version
 */
public interface MechanicalHelpService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectMechanicalHelpMap(PageVo pageVo,Map<String, Object> map);

	int save(MechanicalHelp mechanicalHelp);
}
