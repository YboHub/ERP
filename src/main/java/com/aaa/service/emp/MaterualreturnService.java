package com.aaa.service.emp;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;

public interface MaterualreturnService {

	int findCountByMap(Map<String, Object> map);

	List<Map<String, Object>> selectMaterualreturn(PageVo pagevo,Map<String, Object> map);

}
 