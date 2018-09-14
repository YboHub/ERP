package com.aaa.dao.emp;

import java.util.List;
import java.util.Map;

public interface MaterualreturnDao {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectMaterualreturn(Map<String, Object> map);

}
