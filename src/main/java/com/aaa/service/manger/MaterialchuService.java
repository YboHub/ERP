package com.aaa.service.manger;

import java.util.List;
import java.util.Map;

import com.aaa.entity.PageVo;
import com.aaa.entity.manger.Material;

public interface MaterialchuService {

	int findCountBymaterial(Map<String, Object> map);

	List<Map<String, Object>> selectmaterial(PageVo pagevo,
			Map<String, Object> map);

	List<Material> selectma(Material material);

	Double select(String name);

	int update(Material material);

	int up(Material material);

	List<Material> selectbymaterial(Material material);

	int insert(Material material);

	int upda(Material material);

}
