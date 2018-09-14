package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;

public interface MaterialssService {

	int findCountBymaterial(Map<String, Object> map);

	List<Map<String, Object>> selectmaterial(PageVo pagevo,
			Map<String, Object> map);

	List<Material> select(Integer mid);

	int toUpdate(Material material);

	int tooUpdate(Material material);

}
