package com.aaa.dao.mechanicalHelp;
import java.util.List;
import java.util.Map;
import com.aaa.entity.mechanicalHelp.MechanicalHelp;
/**
 * 类名称：MechanicalHelpDao
 * 类描述： 
 * 创建人：wangsongkang
 * 创建时间：2018-7-31 下午9:26:02
 * @version
 */
public interface MechanicalHelpDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectMechanicalHelpMap(Map<String, Object> map);

	int save(MechanicalHelp mechanicalHelp);

}
