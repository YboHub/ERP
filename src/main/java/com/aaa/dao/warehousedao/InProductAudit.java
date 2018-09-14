package com.aaa.dao.warehousedao;

import java.util.List;
import java.util.Map;

public interface InProductAudit {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectAllInpro(Map<String, Object> map);

}
