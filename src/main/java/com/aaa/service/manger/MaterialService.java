package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;

public interface MaterialService {

	int findCountBymaterial(Map<String, Object> map);

	List<Map<String, Object>> selectmaterial(PageVo pagevo,
			Map<String, Object> map);

	int deletematerial(Material material);

	int addmanger(Material material);

	List<Map<String, Object>> selectmaterialss(Material material);

}
